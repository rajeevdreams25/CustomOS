from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.image import Image
from kivy.uix.floatlayout import FloatLayout
from kivy.core.window import Window


class FullScreenImageApp(App):
    def build(self):
        # Set the window size to fullscreen
        Window.fullscreen = True

        # Create the main layout
        layout = FloatLayout()

        # Add the background image
        background = Image(source="background.jpg", allow_stretch=True, keep_ratio=False)
        layout.add_widget(background)

        # Add the Login button
        login_button = Button(
            text="Login",
            size_hint=(0.2, 0.1),  # Size of the button relative to the screen
            pos_hint={"center_x": 0.5, "center_y": 0.5},  # Center the button
            font_size="20sp",
            background_color=(0.2, 0.6, 0.8, 1),  # Set button background color
            color=(1, 1, 1, 1),  # Set button text color
        )
        layout.add_widget(login_button)

        return layout


# Run the app
if __name__ == "__main__":
    FullScreenImageApp().run()
