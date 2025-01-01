import sys
from PyQt5.QtWidgets import QApplication, QPushButton, QLabel, QVBoxLayout, QWidget
from PyQt5.QtGui import QPixmap
from PyQt5.QtCore import Qt


class FullScreenImageApp(QWidget):
    def __init__(self):
        super().__init__()

        # Set the window to fullscreen
        self.showFullScreen()

        # Create a layout
        layout = QVBoxLayout()
        layout.setContentsMargins(0, 0, 0)
        layout.setSpacing(0)

        # Add the background image
        self.background_label = QLabel(self)
        pixmap = QPixmap("img/background.jpg")  # Replace with your image file
        self.background_label.setPixmap(pixmap)
        self.background_label.setScaledContents(True)
        self.background_label.setAlignment(Qt.AlignCenter)
        layout.addWidget(self.background_label)

        # Add the Login button
        self.login_button = QPushButton("Login", self)
        self.login_button.setStyleSheet("""
            QPushButton {
                font-size: 20px;
                color: white;
                background-color: #3399CC;
                border-radius: 10px;
                padding: 10px;
            }
            QPushButton:hover {
                background-color: #2D89B0;
            }
        """)
        self.login_button.setFixedSize(200, 50)
        self.login_button.clicked.connect(self.on_login_clicked)

        # Add the button to the layout
        self.background_label.setLayout(layout)
        self.login_button.setParent(self.background_label)  # Set the button over the image
        self.login_button.move(
            self.width() // 2 - self.login_button.width() // 2,
            self.height() // 2 - self.login_button.height() // 2
        )

    def on_login_clicked(self):
        print("Login button clicked!")


# Run the app
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = FullScreenImageApp()
    window.show()
    sys.exit(app.exec_())
