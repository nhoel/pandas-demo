#!/bin/bash

# Check if .venv folder exists
if [ ! -d ".venv" ]; then
    echo ".venv does not exist. Creating virtual environment..."
    python3 -m venv .venv
else
    echo ".venv already exists. Skipping creation."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Install dependencies
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# Start Jupyter Notebook in background
echo "Starting Jupyter Notebook in background on port 8888..."
nohup jupyter notebook --no-browser \
    --NotebookApp.allow_origin='*' \
    --NotebookApp.allow_remote_access=True \
    --NotebookApp.token='' \
    --NotebookApp.password='' \
    --port=8888 > jupyter.log 2>&1 &

# Save the PID to a file
echo $! > jupyter.pid
echo "Jupyter Notebook started with PID $(cat jupyter.pid). Logs are in jupyter.log."