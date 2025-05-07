# Use official n8n base image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install system dependencies
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    gcc \
    musl-dev \
    curl \
    git

# Install yt-dlp with override for PEP 668
RUN pip3 install --break-system-packages yt-dlp

# Set environment for binary file handling
ENV N8N_DEFAULT_BINARY_DATA_MODE=filesystem

# Expose n8n port
EXPOSE 5678

# Switch back to n8n user
USER node

# Start n8n with the full path
CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]