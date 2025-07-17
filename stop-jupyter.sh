#!/bin/bash

if [ -f "jupyter.pid" ]; then
    PID=$(cat jupyter.pid)
    echo "Stopping Jupyter Notebook process with PID $PID..."
    kill $PID
    rm jupyter.pid
    echo "Jupyter Notebook stopped."
else
    echo "No jupyter.pid file found. Is Jupyter running?"
fi