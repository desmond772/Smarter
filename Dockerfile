# Use the official Debian image
FROM debian:stable

# Install dependencies
RUN apt update && apt install -y curl gnupg
RUN curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt update && apt install -y google-chrome-stable && rm -rf /var/lib/apt/lists/*
