#!/usr/bin/env bash

# Function to fetch player info
get_info() {
    TOOLTIP=$(playerctl metadata title 2>/dev/null)
    COMMAND="playerctl play-pause"
    COVER_URL=$(playerctl metadata | grep artUrl | awk '{ print $3 }')
    ARTIST=$(playerctl metadata artist)

    ICON_PLAY=""   # Font Awesome music icon
    ICON_PAUSE=""  # Font Awesome pause icon
    ICON_STOP=""   # Font Awesome stop icon

    if [[ -n "$COVER_URL" ]]; then
        COVER=$(mktemp --suffix=.jpg)
        curl -s "$COVER_URL" --output "$COVER"
    else
        COVER=""
    fi

    STATUS=$(playerctl status)
    case "$STATUS" in
        Playing) ICON=$ICON_PLAY ;;
        Paused) ICON=$ICON_PAUSE ;;
        Stopped) ICON=$ICON_STOP ;;
        *) ICON=$ICON_STOP ;;
    esac

    TEXT="Now Playing: $TOOLTIP by $ARTIST"
    MENU="$TOOLTIP - $ARTIST| Next!playerctl next| Previous!playerctl previous|$ICON Play/Pause!playerctl play-pause"

    # Send updates to YAD
    echo "icon:$COVER"
    echo "tooltip:$TEXT"
    echo "menu:$MENU"
}

# Start YAD with dynamic updates
(
    echo "tooltip:Loading..."
    while true; do
        get_info
        sleep 1
    done
) | yad --notification --listen --command="playerctl play-pause" --icon-size=64 --no-middle
