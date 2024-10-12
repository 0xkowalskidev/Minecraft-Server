# Use an official Java runtime as a parent image
FROM openjdk:21-slim

# Install netcat for liveness probe
RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Copy the files and scripts to the container
COPY files /data/files
COPY scripts /data/scripts

# Make all scripts executable
RUN chmod -R +x /data/scripts

# Set the working directory in the container
WORKDIR /data/server

# Expose the default Minecraft port
EXPOSE 25565

# Set ENV variables
# Memory, in GB, default is 1GB
ENV MEMORY=1
ENV PIPE_PATH="/tmp/command-fifo"

# Run the Minecraft server
CMD ["sh", "/data/scripts/start.sh"]
