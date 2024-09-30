#!/bin/bash

# Get the current active space index
CURRENT_SPACE=$(yabai -m query --spaces --space | jq '.index')

# Get the number of visible non-floating windows
WINDOW_COUNT=$(yabai -m query --windows --space | jq '[.[] | select(.["is-visible"] == true and .["is-floating"] == false)] | length')

# Define padding values
SINGLE_WINDOW_PADDING=600
DEFAULT_PADDING=10

if [ "$WINDOW_COUNT" -eq 0 ]; then
    # If no windows, set padding to 100
    yabai -m config --space $CURRENT_SPACE left_padding $SINGLE_WINDOW_PADDING
    yabai -m config --space $CURRENT_SPACE right_padding $SINGLE_WINDOW_PADDING
elif [ "$WINDOW_COUNT" -eq 1 ]; then
    # If only one window, set padding to 100
    yabai -m config --space $CURRENT_SPACE left_padding $SINGLE_WINDOW_PADDING
    yabai -m config --space $CURRENT_SPACE right_padding $SINGLE_WINDOW_PADDING
else
    # If more than one window, reset padding to 10
    yabai -m config --space $CURRENT_SPACE left_padding $DEFAULT_PADDING
    yabai -m config --space $CURRENT_SPACE right_padding $DEFAULT_PADDING
fi
