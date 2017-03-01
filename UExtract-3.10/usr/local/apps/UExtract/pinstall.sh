#! /bin/sh

###############################################################################
# UExtract v3.10 by SFR'2013-2015                                             #
# GNU GPL v2 applies                                                          #
# Thanks to Pemasu for helping me with making this script Woof-friendly       #
###############################################################################

# -----------------------------------------------------------------------------
# Associate ROX 'SendTo/OpenWith' with UExtract
# -----------------------------------------------------------------------------

UExtract_PATH="/usr/local/apps/UExtract"

if [ "`pwd`" = "/" ]; then
  LOC1="/etc/xdg/rox.sourceforge.net/SendTo"
  LOC2="$HOME/.config/rox.sourceforge.net/SendTo"
  LOC3="$HOME/.config/rox.sourceforge.net/OpenWith"
  for i in "$LOC1" "$LOC2" "$LOC3"; do
    [ -d "$i" ] && { RC_PATH="$i"; break; }
  done
  DOTdesktop_PATH="/usr/share/applications/UExtract.desktop"
else	# Woof
  RC_PATH="./root/.config/rox.sourceforge.net/OpenWith"
  DOTdesktop_PATH="./usr/share/applications/UExtract.desktop"
fi

if [ -d "$RC_PATH" ]; then

  # BTW, Mime-Types are kept inside UExtract.desktop file
  if [ -d "$RC_PATH" ]; then
    for i in $(grep '^MimeType=' "$DOTdesktop_PATH" | cut -f2- -d '=' | tr ';' '\n' | tr '/' '_' | head -n -1); do
      [ ! -d "${RC_PATH}/.${i}" ] && mkdir "${RC_PATH}/.${i}" 
      [ ! -L "${RC_PATH}/.${i}/UExtract" ] && ln -s "$UExtract_PATH" "${RC_PATH}/.${i}/UExtract"
    done
    [ ! -L "${RC_PATH}/UExtract" ] && ln -s "$UExtract_PATH" "${RC_PATH}/UExtract"
  fi

fi

# -----------------------------------------------------------------------------

# Associate custom action with Thunar
if [ "`pwd`" = "/" ]; then
  if [ `which thunar 2>/dev/null` ] || [ `which Thunar 2>/dev/null` ]; then
    CONFIG="$HOME/.config/Thunar/uca.xml"
    CONFIG_BAK="$HOME/.config/Thunar/uca.xml.bak"
    CONFIG_TMP=/tmp/uca.xml
    EXTENSIONS="`uextract -f | grep -vE '\[|\]|\?' | grep '^\.' | tr '\n' ';' | sed 's/\./\*\./g'`"
    if [ -f "$CONFIG" ]; then
      grep '<name>UExtract</name>' "$CONFIG" >/dev/null || {
      grep -v '^</actions>' "$CONFIG" > "$CONFIG_TMP"
      echo '<action>
	<icon>UExtract</icon>
	<name>UExtract</name>
	<command>/usr/local/apps/UExtract/AppRun %F</command>
	<description>Extract packages</description>
	<patterns>'${EXTENSIONS}'</patterns>
	<other-files/>
	<audio-files/>
	<video-files/>
</action>
</actions>' >> "$CONFIG_TMP"
      mv "$CONFIG" "$CONFIG_BAK"
      mv "$CONFIG_TMP" "$CONFIG"
    }
    else
      mkdir -p "${CONFIG%/*}"
      echo '<?xml encoding="UTF-8" version="1.0"?>
<actions>
<action>
	<icon>UExtract</icon>
	<name>UExtract</name>
	<command>/usr/local/apps/UExtract/AppRun %F</command>
	<description>Extract packages</description>
	<patterns>'${EXTENSIONS}'</patterns>
	<other-files/>
	<audio-files/>
	<video-files/>
</action>
</actions>' > "$CONFIG" 
    fi
  fi
fi

# -----------------------------------------------------------------------------

# Create shortcut on pinboard/desktop
[ "`pwd`" = "/" ] && /usr/local/apps/UExtract/createshortcut &

# =============================================================================
