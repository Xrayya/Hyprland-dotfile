#!/bin/bash
# Get the default file manager .desktop file for directories
desktop_file=$(xdg-mime query default inode/directory)

# Find the .desktop file location
file_path=$(find /usr/share/applications ~/.local/share/applications -name "$desktop_file" 2>/dev/null | head -n1)

# Extract the Exec command (remove placeholders like %U, %u, etc.)
exec_line=$(grep '^Exec=' "$file_path" | head -n1 | sed 's/^Exec=//;s/ *%[a-zA-Z]*//g')

# Launch the file manager, optionally with a directory argument
eval "$exec_line" "$@" 
