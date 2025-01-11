#!/bin/bash

echo "Starting the script"

# Update packages and install dependencies for nvm and Node.js
echo "Installing required dependencies..."
apk update && apk add --no-cache bash curl alpine-sdk coreutils python3

# Check if nvm is already installed
if [ -d "$HOME/.nvm" ]; then
  echo "nvm is already installed. Skipping installation."
else
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
fi

# Reload shell configuration
echo "Reloading shell..."
source ~/.bashrc

# Install the latest LTS version of Node.js
echo "Installing latest LTS version of Node.js..."
nvm install --lts

# Verify installation
if command -v node &> /dev/null; then
  echo "Node.js version: $(node -v)"
else
  echo "Node.js installation failed!"
  exit 1
fi

echo "Script ended"
