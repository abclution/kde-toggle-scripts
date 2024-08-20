#!/bin/bash
# REF: https://forum.manjaro.org/t/how-to-disable-enable-kwin-script-from-command-line-shell-script/61188 

# Run the kreadconfig5 command to check the current setting
current_value=$(kreadconfig5 --file kwinrc --group Plugins --key kde-tiling-on-dragEnabled)

# Check the output and toggle the setting
if [ "$current_value" = "true" ]; then
    kwriteconfig5 --file kwinrc --group Plugins --key kde-tiling-on-dragEnabled false
    qdbus org.kde.KWin /KWin reconfigure

elif [ "$current_value" = "false" ]; then
    kwriteconfig5 --file kwinrc --group Plugins --key kde-tiling-on-dragEnabled true
    qdbus org.kde.KWin /KWin reconfigure

else
    echo "Unknown value: $current_value"
fi
new_value=$(kreadconfig5 --file kwinrc --group Plugins --key kde-tiling-on-dragEnabled)

# Debug output, can be commented out.
echo "Changed $current_value to $new_value"
