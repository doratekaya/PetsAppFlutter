# flutter_pets_app

A  Dog App Flutter project.

## Getting Started

# Flutter Template

Dog App is a simple app displaying dog images by breeds or subbreeds or randomly. This template provides simple UI and scalable project structure . 

The app has basic 2 Screens, the first one is to display random dog image and get the list of all breeds, the second screens display the sub breeds and get images for a spesific breed, on taping on a subbreed a dialog contains a random image deponds on the breed and subbreed will be displayed. 

It's configured with [MVVM] Architecture. 

<br />
<div>
  &emsp;&emsp;&emsp;
  <img src="https://github.com/webfactorymk/flutter-template/blob/main/diagrams/light_theme.png" alt="First Screen theme" width="330">
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://github.com/webfactorymk/flutter-template/blob/main/diagrams/dark_theme.jpg" alt="Second Screen" width="320">  
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://github.com/webfactorymk/flutter-template/blob/main/diagrams/dark_theme.jpg" alt="Dialog Screen " width="320">  
</div>
<br />

[Navigation 2.0]: https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade

# First Run

The project is configured with mock data if you run the **MOCK** flavor. See the next section for configuring run configurations.

After installing the package dependencies with 

```
flutter pub get
```

select the target device

```
flutter devices  
```

Copy the target device ID e.g D4A5FE95-12D8-43C2-8299-95FBE752F040

```
flutter run -d D4A5FE95-12D8-43C2-8299-95FBE752F040      
```


### ApiService

Abstraction over the API communication that defines (all) endpoints. 
This templates uses [http], an http client generator, to make network requests.

- [https://dog.ceo/dog-api/] - Documentation for backend server
