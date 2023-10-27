import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_pets_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class DogService {
//Fetch all breeds
  Future<List<String>> getAllBreeds() async {
    //var
    List<String> breeds = [];
    //End point
    var request = Uri.parse("$baseUrl/breeds/list/all");
    //Exec end point
    await http.get(request).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> message = json.decode(response.body)['message'];
        breeds = message.keys.toList();
      }
    }).onError((error, stackTrace) {});

    //return array
    return breeds;
  }

//..
//Fetch gallery by Breed
  Future<List<String>> getGalleryByBreed(String breed) async {
    //var
    List<String> images = [];
    //End point
    var request = Uri.parse("$baseUrl/breed/${breed.toLowerCase()}/images");
    //Exec end point
    await http.get(request).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> message = json.decode(response.body)['message'];
        for (var item in message) {
          images.add(item);
        }
      }
    }).onError((error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
    });

    //return array
    return images;
  }

//..
//Fetch rqndom image by Breed and sub-breed
  Future<String> getRandomImageByBreed(String breed, String subbreed) async {
    //../images/random
    //var
    late String image;
    late Uri request;

    //End point
    if (subbreed.isNotEmpty) {
      request = Uri.parse(
          "$baseUrl/breed/${breed.toLowerCase()}/${subbreed.toLowerCase()}/images/random");
    } else {
      request =
          Uri.parse("$baseUrl/breed/${breed.toLowerCase()}/images/random");
    }

    //Exec end point
    await http.get(request).then((response) {
      if (response.statusCode == 200) {
        String message = json.decode(response.body)['message'];
        image = message;
      }
    }).onError((error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
    });

    //return array
    return image;
  }

//..
//Fetch random Image
  Future<String> getRandomImage() async {
    //var
    String image = "";
    //End point
    var request = Uri.parse("$baseUrl/breeds/image/random");
    await http.get(request).then((response) {
      if (response.statusCode == 200) {
        String message = json.decode(response.body)['message'];
        image = message;
      }
    }).onError((error, stackTrace) {
     debugPrintStack(stackTrace: stackTrace);
    });

    //return array
    return image;
  }

//..
//Fetch sub-breeds by Breed
  Future<List<String>> getSubBreeds(String breed) async {
    //var
    List<String> subbreeds = [];
    //End point
    var request = Uri.parse("$baseUrl/breed/${breed.toLowerCase()}/list");
    //Exec end point
    await http.get(request).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> message = json.decode(response.body)['message'];
        for (var item in message) {
          subbreeds.add(item);
        }
      }
    }).onError((error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
    });

    //return array
    return subbreeds;
  }
}
