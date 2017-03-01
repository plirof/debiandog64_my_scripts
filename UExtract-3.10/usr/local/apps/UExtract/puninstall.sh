#! /bin/sh

###############################################################################
# UExtract v3.10 by SFR'2013-2015                                             #
# GNU GPL v2 applies                                                          #
###############################################################################

[ "`which realpath 2>/dev/null`" ] || alias realpath='readlink -f'

# -----------------------------------------------------------------------------

# PPM may have problems with deleting /usr/local/apps/UExtract/* empty (sub)dir(s),
# so let's do it manually:
find /usr/local/apps/UExtract/ -type d -empty -delete

# -----------------------------------------------------------------------------

# Delete all broken symlinks after uninstallation
LOC1="/etc/xdg/rox.sourceforge.net/SendTo"
LOC2="$HOME/.config/rox.sourceforge.net/SendTo"
LOC3="$HOME/.config/rox.sourceforge.net/OpenWith"
for i in "$LOC1" "$LOC2" "$LOC3"; do
  if [ -d "$i" ]; then
    find "$(realpath "$i")" -type l -name "UExtract" -delete
    # Delete all empty dirs as well (have to rethink it yet)
    #find "$(realpath "$i")" -type d -empty -delete
  fi
done

# -----------------------------------------------------------------------------

# Remove icon from ROX pinboard
[ -e "$HOME/Choices/ROX-Filer/PuppyPin" ] &&
rox --RPC << EOF
<?xml version="1.0"?>
<env:Envelope xmlns:env="http://www.w3.org/2001/12/soap-envelope">
 <env:Body xmlns="http://rox.sourceforge.net/SOAP/ROX-Filer">
  <PinboardRemove>
   <Path>/usr/local/apps/UExtract</Path>
   <Label>UExtract</Label>
  </PinboardRemove>
 </env:Body>
</env:Envelope>
EOF

# -----------------------------------------------------------------------------

# Delete UExtract action from Thunar
CONFIG="$HOME/.config/Thunar/uca.xml"
CONFIG_BAK="$HOME/.config/Thunar/uca.xml.bak"
CONFIG_TMP=/tmp/uca.xml

if [ -f "$CONFIG" ]; then
  grep '<name>UExtract</name>' "$CONFIG" >/dev/null && {
  LINE_NO=`grep -n '<name>UExtract</name>' "$CONFIG" | cut -f1 -d ':'`

  LINE_TMP=$LINE_NO
  for i in {0..99}; do
    awk 'NR=='${LINE_TMP}' {if ($0 == "<action>") {print $1}}' "$CONFIG" | grep '<action>' >/dev/null && break
    LINE_TMP=$(($LINE_TMP-1))
  done
  LINE_TOP=$LINE_TMP

  LINE_TMP=$LINE_NO
  for i in {0..99}; do
    awk 'NR=='${LINE_TMP}' {if ($0 == "</action>") {print $1}}' "$CONFIG" | grep '</action>' >/dev/null && break
    LINE_TMP=$(($LINE_TMP+1))
  done
  LINE_BOT=$LINE_TMP

  sed -e ''${LINE_TOP}','${LINE_BOT}'d' "$CONFIG" > "$CONFIG_TMP"
  mv "$CONFIG" "$CONFIG_BAK"
  mv "$CONFIG_TMP" "$CONFIG"
  }
fi

# =============================================================================
