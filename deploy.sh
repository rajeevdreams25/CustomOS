
set -e


echo "Updating package lists..."
 
PYTHON_SCRIPT="code/main.py"                        

echo "Installing packages"
pip3 install --upgrade pip
pip3 install -r requirements.txt

if [ -f "$PYTHON_SCRIPT" ]; then
    echo "Running the Python script..."
    python3 "$PYTHON_SCRIPT"
else
    echo "Error: Python script '$PYTHON_SCRIPT' not found in the repository."
    exit 1
fi

echo "Script executed successfully."
