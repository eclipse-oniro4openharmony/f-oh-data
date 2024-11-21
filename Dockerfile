# First Stage: Build Environment
FROM ubuntu:22.04 as builder

# Set non-interactive installation to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install git, Node.js, and npm
RUN apt-get update && \
    apt-get install -y git nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone the repository to the working directory using the default branch
ARG REPO_URL=https://github.com/eclipse-oniro4openharmony/f-oh-data
RUN git clone ${REPO_URL} .
COPY allAppList.json /app/allAppList.json
COPY data/ /app/data/

# Install application dependencies
RUN npm install

# -------------------------------------------------------

# Second Stage: Production Environment
FROM ubuntu:22.04

# Set non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Node.js and npm
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Node.js dependencies from the builder stage
COPY --from=builder /app/node_modules /app/node_modules
# Copy application code and other necessary files
COPY --from=builder /app /app

# Expose port 5000
EXPOSE 5000

# Start the application
CMD ["npm", "start"]