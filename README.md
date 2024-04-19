# PlantCare

PlantCare is a Flutter app that can analyze images of plants(apple plant specifically for now) and determine whether they are healthy or diseased. It utilizes a custom-trained VGG16 deep learning model for image classification.
![-2147483648_-210050](https://github.com/Sarthakpurii/Plant-Disease-Detection-Application/assets/96935483/9b90b99d-9248-46e5-877f-4a9932ef5eae)
![-2147483648_-210054](https://github.com/Sarthakpurii/Plant-Disease-Detection-Application/assets/96935483/68ccd59f-4c85-4ed6-bf1a-f3a58a0c8057)

## Features

- Upload images from your device's gallery
- Classify plant images as healthy or diseased using a custom-trained deep learning model
- Simple and intuitive user interface

## Installation

### From Source

1. Clone the repository:

git clone https://github.com/Sarthakpurii/Plant-Disease-Detection-Application.git


2. Install the required dependencies:

flutter pub get


3. Run the app:

flutter run

(You need to have flutter configured on your desktop.)

### From APK

You can also install the app directly by downloading the APK file (`app-release.apk`) from this [LINK](https://www.dropbox.com/scl/fi/j1uf2pm54tlww40j586sq/app-release.apk?rlkey=yw5gtkqx6zkaqa8p7ia68ycme&st=7ziyf5lf&dl=0)

## Usage

1. Open the app on your device or emulator.
2. Tap the "Upload From Gallery" button to select an image from your device's gallery.
3. The app will analyze the image and display whether the plant is healthy or diseased.

## Model Training

The VGG16 model used in this app was trained on a custom dataset. The training process is included in the repository as a Jupyter Notebook (`DL model/model_training.ipynb`). The trained model is exported as a TFLite file (`DL model/model.tflite`) and integrated into the Flutter app.

## License

This project is licensed under the [Apache License](LICENSE).
