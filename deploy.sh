
set -e


echo "Updating package lists..."

REPO_URL="https://github.com/rajeevdreams25/CustomOS.git"  
PYTHON_SCRIPT="code/main.py"                        


if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git and try again."
    exit 1
fi


if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Please install Python3 and try again."
    exit 1
fi


REPO_NAME=$(basename -s .git "$REPO_URL") 
echo "Cloning the repository..."
if [ -d "$REPO_NAME" ]; then
    echo "Repository '$REPO_NAME' already exists. Pulling latest changes..."
    cd "$REPO_NAME"
    git pull
else
    git clone "$REPO_URL"
    cd "$REPO_NAME"
fi

if ! command -v pip3 &> /dev/null; then
    echo "Pip3 is not installed. Please install Pip3 and try again."
    echo "Installing Python3 and pip..."
    apk add --no-cache python3 py3-pip build-base
    exit 1
fi


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
