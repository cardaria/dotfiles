#!/bin/bash

# Get the current active space index
CURRENT_SPACE=$(yabai -m query --spaces --space | jq '.index')

# Get the number of visible non-floating windows
WINDOW_COUNT=$(yabai -m query --windows --space | jq '[.[] | select(.["is-visible"] == true and .["is-floating"] == false)] | length')

# Define padding values for each display
SINGLE_WINDOW_PADDING_4K=600
DEFAULT_PADDING_4K=10

SINGLE_WINDOW_PADDING_LAPTOP=300
DEFAULT_PADDING_LAPTOP=10

# Call the C program to detect if the internal laptop display is active, and run it in the background
./detect_display &
C_PID=$!

# Apply default padding for 4K monitor while the C program is running
SINGLE_WINDOW_PADDING=$SINGLE_WINDOW_PADDING_4K
DEFAULT_PADDING=$DEFAULT_PADDING_4K

# Apply padding based on the number of windows while waiting for the C program
if [ "$WINDOW_COUNT" -eq 0 ]; then
    yabai -m config --space $CURRENT_SPACE left_padding $SINGLE_WINDOW_PADDING
    yabai -m config --space $CURRENT_SPACE right_padding $SINGLE_WINDOW_PADDING
elif [ "$WINDOW_COUNT" -eq 1 ]; then
    yabai -m config --space $CURRENT_SPACE left_padding $SINGLE_WINDOW_PADDING
    yabai -m config --space $CURRENT_SPACE right_padding $SINGLE_WINDOW_PADDING
else
    yabai -m config --space $CURRENT_SPACE left_padding $DEFAULT_PADDING
    yabai -m config --space $CURRENT_SPACE right_padding $DEFAULT_PADDING
fi

# Wait for the C program to finish, then check the result
wait $C_PID
DISPLAY_STATUS=$?

# Adjust the padding based on the display status (only if necessary)
if [ "$DISPLAY_STATUS" -eq 0 ]; then
    # Internal laptop display is active
    SINGLE_WINDOW_PADDING=$SINGLE_WINDOW_PADDING_LAPTOP
    DEFAULT_PADDING=$DEFAULT_PADDING_LAPTOP

    # Reapply padding if necessary
    if [ "$WINDOW_COUNT" -eq 0 ]; then
        yabai -m config --space $CURRENT_SPACE left_padding $SINGLE_WINDOW_PADDING
        yabai -m config --space $CURRENT_SPACE right_padding $SINGLE_WINDOW_PADDING
    elif [ "$WINDOW_COUNT" -eq 1 ]; then
        yabai -m config --space $CURRENT_SPACE left_padding $SINGLE_WINDOW_PADDING
        yabai -m config --space $CURRENT_SPACE right_padding $SINGLE_WINDOW_PADDING
    else
        yabai -m config --space $CURRENT_SPACE left_padding $DEFAULT_PADDING
        yabai -m config --space $CURRENT_SPACE right_padding $DEFAULT_PADDING
    fi
fi
