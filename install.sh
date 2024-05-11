#!/bin/bash

# Define where to install the tool
INSTALL_DIR="$HOME/mytool"

# Create the directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download the tool
curl -L https://example.com/mytool -o "$INSTALL_DIR/mytool"

# Make the tool executable
chmod +x "$INSTALL_DIR/mytool"

# Add the tool to PATH in .bashrc and .zshrc if it's not already there
if ! grep -q "export PATH=\$PATH:$INSTALL_DIR" ~/.bashrc; then
    echo "export PATH=\$PATH:$INSTALL_DIR" >> ~/.bashrc
fi
if ! grep -q "export PATH=\$PATH:$INSTALL_DIR" ~/.zshrc; then
    echo "export PATH=\$PATH:$INSTALL_DIR" >> ~/.zshrc
fi

echo "Installation completed. Please restart your terminal or run 'source ~/.bashrc' or 'source ~/.zshrc'."
