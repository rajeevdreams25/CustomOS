
set -e

REPO_URL="https://github.com/rajeevdreams25/CustomOS.git" 


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
else
    git clone "$REPO_URL"
    cd "$REPO_NAME"
fi


echo "Script executed successfully."
