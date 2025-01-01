
set -e

REPO_URL="https://github.com/rajeevdreams25/CustomOS.git" 

echo "******************************************************"
# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git and try again."
    apk add git
    exit 1
fi

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Please install Python3 and try again."
    apk add python3
    exit 1
fi

REPO_NAME=$(basename -s .git "$REPO_URL") 
echo "Cloning the repository..."
if [ -d "$REPO_NAME" ]; then
    echo "Repository '$REPO_NAME' already exists. Pulling latest changes..."
    cd "$REPO_NAME"
    git pull
    cd ..
else
    git clone "$REPO_URL"
    cd "$REPO_NAME"
    cd ..
fi


echo "Script executed successfully."
echo "---------------------------------------------------------"

VENV_DIR="OS"

if [ -d "$VENV_DIR" ]; then
    echo "Virtual environment '$VENV_DIR' found. Activating it..."
    source "$VENV_DIR/bin/activate" || { echo "Failed to activate the virtual environment."; exit 1; }
else
    echo "Virtual environment '$VENV_DIR' does not exist. Creating it..."
    python3 -m venv "$VENV_DIR" || { echo "Failed to create virtual environment."; exit 1; }
    echo "Activating the newly created virtual environment..."
    source "$VENV_DIR/bin/activate" || { echo "Failed to activate the virtual environment."; exit 1; }
fi

if [ -n "$VIRTUAL_ENV" ]; then
    echo "Virtual environment activated: $VIRTUAL_ENV"
else
    echo "Failed to activate the virtual environment."
    exit 1
fi

echo "You are now in the virtual environment. Add your commands here."


echo "******************************************************"