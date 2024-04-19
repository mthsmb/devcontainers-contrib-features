#!/usr/bin/env bash

set -e

BUN_VERSION="${VERSION:-"latest"}"

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

command -v unzip >/dev/null || { echo "unzip is required to install Bun." ; exit 1; }

# Determine platform
case $(uname -ms) in
    "Linux x86_64")
        PLATFORM="linux-x64"
        ;;
    "Linux aarch64")
        PLATFORM="linux-aarch64"
        ;;
    "Darwin x86_64")
        PLATFORM="darwin-x64"
        ;;
    "Darwin arm64")
        PLATFORM="darwin-aarch64"
        ;;
    *)
        echo "Unsupported platform"
        exit 1
        ;;
esac

# Check if AVX2 support is needed for Linux or Darwin x64
if [[ "$PLATFORM" == "linux-x64" || "$PLATFORM" == "darwin-x64" ]]; then
    if ! grep -q avx2 /proc/cpuinfo && [ "$(uname)" == "Linux" ]; then
        PLATFORM="${PLATFORM}-baseline"
    elif ! sysctl -a | grep -q avx2 && [ "$(uname)" == "Darwin" ]; then
        PLATFORM="${PLATFORM}-baseline"
    fi
fi

BUN_BINARY="bun-${PLATFORM}.zip"
BUN_URL="https://github.com/oven-sh/bun/releases/download/${BUN_VERSION}/${BUN_BINARY}"

# Download and install Bun
curl -fsSL "$BUN_URL" -o /tmp/$BUN_BINARY
unzip /tmp/$BUN_BINARY -d /usr/local/bin
chmod +x /usr/local/bin/bun

echo "Bun installation complete."
echo "Add /usr/local/bin to your PATH to use bun from the command line."
