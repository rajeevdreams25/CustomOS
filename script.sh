
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

pwd

if [ -d "OS" ]; then
    echo "'OS' directory already exists. Skipping virtual environment creation."
else
    echo "Creating a virtual environment in the 'OS' folder..."
    python3 -m venv OS
fi

pwd

# Now change into the "OS" directory, if exists
cd OS || { echo "Failed to change directory to OS."; exit 1; }

# Optionally, activate the virtual environment if it's a new creation
if [ ! -z "$(ls -A)" ]; then
    echo "Activating the virtual environment..."
    source bin/activate
    cd ..
fi

echo "******************************************************"