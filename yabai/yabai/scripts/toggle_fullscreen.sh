
#!/bin/bash
# Get the current active space index
CURRENT_SPACE=$(yabai -m query --spaces --space | jq '.index')

# Get the number of windows in the current space
WINDOW_COUNT=$(yabai -m query --windows --space | jq '[.[] | select(.["is-visible"] == true and .["is-floating"] == false)] | length')
# Define padding values
SINGLE_WINDOW_PADDING=600
DEFAULT_PADDING=10

if [ "$WINDOW_COUNT" -eq 1 ]; then
    # Get the current padding value
    CURRENT_PADDING=$(yabai -m config --space $CURRENT_SPACE left_padding)
    
    # Toggle padding between 10 and 100
    if [ "$CURRENT_PADDING" -eq 10 ]; then
    yabai -m config --space $CURRENT_SPACE left_padding $SINGLE_WINDOW_PADDING
    yabai -m config --space $CURRENT_SPACE right_padding $SINGLE_WINDOW_PADDING
    else
    yabai -m config --space $CURRENT_SPACE left_padding $DEFAULT_PADDING
    yabai -m config --space $CURRENT_SPACE right_padding $DEFAULT_PADDING
    fi
else
    # Toggle fullscreen for the focused window
    yabai -m window --toggle zoom-fullscreen
fi
