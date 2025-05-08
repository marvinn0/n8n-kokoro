FROM n8nio/n8n:latest

# Switch to root to install packages
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

# Switch back to default n8n user
USER node

CMD ["n8n"]