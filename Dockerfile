FROM debian:12

# Install minimal build dependencies
RUN apt-get update && apt-get install -y \
    build-essential meson ninja-build valac pkg-config libgtk-4-dev git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Build gtk4-layer-shell from source
RUN git clone https://github.com/wmww/gtk4-layer-shell.git /tmp/gtk4-layer-shell \
 && cd /tmp/gtk4-layer-shell \
 && meson setup build \
 && ninja -C build \
 && ninja -C build install