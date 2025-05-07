FROM n8nio/n8n:latest

# Install system dependencies
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    gcc \
    musl-dev \
    curl \
    git && \
    pip3 install --break-system-packages yt-dlp

# Use the default n8n entrypoint
CMD ["n8n"]