# flutter_pets_app

A Dog App Flutter project.

## Getting Started

Dog App is a simple app displaying dog images by breeds or sub-breeds or randomly. This template provides simple UI and scalable project structure . 

The app has 2 basics Screens, the first one is to display random dog image and get the list of all breeds, the second screens display the sub breeds and get images for a specific breed, on taping on a sub-breed a dialog contains a random image depends on the breed and sub breed will be displayed.

It's configured with [MVVM] Architecture.

<br />
<div>
  &emsp;&emsp;&emsp;
  <img src="https://github.com/doratekaya/PetsAppFlutter/blob/main/images/Screen1.png" alt="First Screen theme" width="330">
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://github.com/doratekaya/PetsAppFlutter/blob/main/images/Screen2_1.png" alt="Second Screen" width="320">  
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://github.com/doratekaya/PetsAppFlutter/blob/main/images/Screen2_2.png" alt="Second Screen" width="320">  
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://github.com/doratekaya/PetsAppFlutter/blob/main/images/Screen3_1.png" alt="Dialog Screen" width="320">  
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://github.com/doratekaya/PetsAppFlutter/blob/main/images/Screen3_2.png" alt="Dialog Screen " width="320">  
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://github.com/doratekaya/PetsAppFlutter/blob/main/images/Screen3_3.png" alt="Dialog Screen " width="320">  
</div>
<br />

[Navigation 2.0]: https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade

# First Run

The project is configured with mock data if you run the **MOCK** flavor. See the next section for configuring run configurations.

After installing the package dependencies with 

```
flutter pub get
```

Select the target device

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
