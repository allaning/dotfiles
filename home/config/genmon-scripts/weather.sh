#!/bin/bash
# This script uses xfce4-genmon-plugin/noble,now 4.1.1-1build2
# to show weather info in the xfce4 panel

# You can pass a custom string like ?format=%l:+%c+%t and mix and match any of these:
#
# CODE   SHOWS
# -----  ------------------------------------------------------------------------------
# %c     Weather condition (icon)
# %C     Weather condition (text name, e.g. "Partly cloudy")
# %x     Weather condition, plain-text symbol (no emoji — useful if your panel font can't render weather icons)
# %h     Humidity
# %t     Temperature (actual)
# %f     Temperature (feels like)
# %w     Wind
# %l     Location name
# %m     Moon phase (🌑🌒🌓🌔🌕🌖🌗🌘)
# %M     Moon day
# %p     Precipitation (mm)
# %P     Pressure (hPa)
# %u     UV index (1-12)
# %D     Dawn
# %S     Sunrise
# %z     Zenith (solar noon)
# %s     Sunset
# %d     Dusk
#
# Example custom format for your genmon script:
# curl -s "wttr.in/${LOCATION}?format=%l:+%c+%t+(feels+%f)+%w"


# Leave blank for auto-detect by IP, or set e.g. "London" or "90210"
LOCATION="Dallas"

# Just an icon + temperature
#TXT=$(curl -s "wttr.in/${LOCATION}?format=%c+%t" 2>/dev/null)

# Text in panel
TXT=$(curl -s "wttr.in/${LOCATION}?format=3" 2>/dev/null)

# Tooltip
# Fetch all values in one call, pipe-separated (%7C is a URL-encoded "|")
RAW=$(curl -s "wttr.in/${LOCATION}?format=%l%7C%C%7C%c%7C%t%7C%f%7C%w%7C%h%7C%p%7C%P%7C%u%7C%m%7C%M%7C%D%7C%S%7C%z%7C%s%7C%d" 2>/dev/null)

if [ -z "$TXT" ] || [ -z "$RAW" ]; then
    echo "<txt>N/A</txt>"
    echo "<tool>Weather unavailable</tool>"
    exit 0
fi

IFS='|' read -r LOC COND ICON TEMP FEELS WIND HUM PRECIP PRESS UV MOON MOONDAY DAWN SUNRISE ZENITH SUNSET DUSK <<< "$RAW"

TOOL="
📍  Location:    $LOC
$ICON Condition:   $ICON $COND
🌡️  Temperature: $TEMP
🤔  Feels like:  $FEELS
🌬️  Wind:        $WIND
💧  Humidity:    $HUM
☔  Precip:      $PRECIP
🔽  Pressure:    $PRESS
😎  UV Index:    $UV
$MOON  Moon phase:  $MOON day $MOONDAY
🌅  Dawn:        $DAWN
☀️  Sunrise:     $SUNRISE
🔆  Zenith:      $ZENITH
🌇  Sunset:      $SUNSET
🌆  Dusk:        $DUSK
"

echo "<txt>$TXT</txt>"
echo "<tool><span font_family='monospace'>$TOOL</span></tool>"

