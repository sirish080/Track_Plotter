#!/bin/bash

# Exit immediately if any command fails
set -e

# Activate the Python virtual environment
echo "Activating Python virtual environment..."
source /mnt/managed_home/farm-ng-user-sirish08/Track_Plotter/venv/bin/activate

# Start the FastAPI server using uvicorn
echo "Starting FastAPI server on 0.0.0.0:8000..."
uvicorn main:app --host 0.0.0.0 --port 8000 &

# Save the PID of the uvicorn process if needed
UVICORN_PID=$!

# Change directory to the frontend (or Node.js) project
cd /mnt/managed_home/farm-ng-user-sirish08/Track_Plotter/track-plotter

# Start the frontend (Node.js) project
echo "Starting frontend with npm..."
npm start

# Optional: Wait for background processes if needed
# wait $UVICORN_PID

