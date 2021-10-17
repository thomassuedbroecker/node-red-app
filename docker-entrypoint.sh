#!/bin/bash

export info=$(pwd)

echo "**********************************"
echo "Step 1"
echo "**********************************"
echo "  -> Log: Root path: '$info'"
echo "  -> Log: Check env variables:" 
echo "    - $CLOUDANT_URL"
echo "    - $NODE_ENV"
echo "    - $PORT"
echo "    - $NODE_RED_USERNAME"
echo "    - $NODE_RED_PASSWORD"

echo "**********************************"
echo "Step 1.1 show all env variables"
echo "**********************************"
echo ""
printenv 
env

echo ""
echo "**********************************"
echo "Step 2"
echo "**********************************"
echo " Verify that the copied file exists"
echo "**********************************"
export info=$(pwd)
ls

echo ""
echo "**********************************"
echo "Step 3"
echo "**********************************"
echo "Execute npm start command "
echo "**********************************"
echo ""

npm start
