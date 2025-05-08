FROM n8nio/n8n:latest

# Switch to root to install dependencies
USER root

RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    gcc \
    musl-dev \
    curl \
    git && \
    pip3 install --break-system-packages yt-dlp

# Switch back to node user (n8n expects this)
USER node

# Ensure n8n starts
CMD ["n8n"]