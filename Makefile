# Rift GTK4 Runtime Makefile
# Default 'make' shows help
DOCKER_IMAGE := rift-builder
BUILD_DIR := build
BINARY := $(BUILD_DIR)/src/rift

.PHONY: all help build run clean

# Default target
all: help

# Show help
help:
	@echo "Rift Makefile - available commands:"
	@echo "  make build      Build Rift binary inside Docker"
	@echo "  make run        Run Rift binary on host"
	@echo "  make clean      Clean build folder"

# Build Rift inside Docker
build:
	@echo "==> Building Rift inside Docker..."
	docker build -t $(DOCKER_IMAGE) .
	docker run --rm -v "$(PWD)":/app $(DOCKER_IMAGE) \
		sh -c "meson setup $(BUILD_DIR) --buildtype=release || true && meson compile -C $(BUILD_DIR)"
	@echo "==> Build complete. Binary at $(BINARY)"

# Run Rift on host
run:
	@echo "==> Running Rift..."
	$(BINARY)

# Clean build folder
clean:
	@echo "==> Cleaning build folder..."
	rm -rf $(BUILD_DIR)