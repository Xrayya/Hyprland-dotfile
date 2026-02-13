#!/bin/bash
# Get the default browser .desktop file
desktop_file=$(xdg-settings get default-web-browser)

# Find the .desktop file location
file_path=$(find /usr/share/applications ~/.local/share/applications -name "$desktop_file" 2>/dev/null | head -n1)

# Extract the Exec command (remove placeholders like %U, %u, etc.)
exec_line=$(grep '^Exec=' "$file_path" | head -n1 | sed 's/^Exec=//;s/ *%[a-zA-Z]*//g')

# Launch the browser using eval to handle arguments and quoted paths
eval "$exec_line" "$@"
