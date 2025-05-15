#!/bin/bash
docker build -t gautadas/javamavenwebapp:v1.0.0 .
# --- IMPORTANT: Handling Credentials Securely ---
# Storing credentials directly in the script is NOT recommended for security.
# See the notes below on better ways to handle secrets.

DOCKER_USERNAME="gautadas"
DOCKER_PASSWORD="Druvi@1605" # Replace with your actual password
DOCKER_REGISTRY="docker.io" # Or your specific registry like gcr.io, quay.io, etc.

echo "Attempting to log in to Docker registry: ${DOCKER_REGISTRY}"

# Use the non-interactive login
echo "${DOCKER_PASSWORD}" | docker login --username "${DOCKER_USERNAME}" --password-stdin "${DOCKER_REGISTRY}"

# Check the exit status of the docker login command
if [ $? -eq 0 ]; then
  echo "Docker login successful!"
  # You can now proceed with docker push or other commands
else
  echo "Docker login failed!"
  exit 1 # Exit the script with an error code
fi

# --- Example of what you might do after login (e.g., push an image) ---
docker push gautadas/javamavenwebapp:v1.0.0
