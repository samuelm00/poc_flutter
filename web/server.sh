#!/bin/bash

# get first argument
PORT=3000

# Start the server
echo 'Server starting on port' $PORT '...'
python3 -m http.server --directory build/web $PORT
