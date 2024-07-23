#!/bin/bash

# Check if the user provided an argument
if [ -z "$1" ]; then
  echo "Usage: $0 on|off"
  exit 1
fi

# Define the network service
NETWORK_SERVICE="Wi-Fi"

# Define the proxy settings (adjust as needed)
PROXY_SERVER="proxy.example.com"
PROXY_PORT="8080"

# Function to enable proxy
enable_proxy() {
  echo "Enabling web proxy and secure web proxy..."
  sudo networksetup -setwebproxy "$NETWORK_SERVICE" "$PROXY_SERVER" "$PROXY_PORT"
  sudo networksetup -setsecurewebproxy "$NETWORK_SERVICE" "$PROXY_SERVER" "$PROXY_PORT"
  echo "Web proxy and secure web proxy have been enabled."
}

# Function to disable proxy
disable_proxy() {
  echo "Disabling web proxy and secure web proxy..."
  sudo networksetup -setwebproxystate "$NETWORK_SERVICE" off
  sudo networksetup -setsecurewebproxystate "$NETWORK_SERVICE" off
  echo "Web proxy and secure web proxy have been disabled."
}

# Check the argument and call the appropriate function
case "$1" in
  on)
    enable_proxy
    ;;
  off)
    disable_proxy
    ;;
  *)
    echo "Invalid argument: $1"
    echo "Usage: $0 on|off"
    exit 1
    ;;
esac

exit 0

