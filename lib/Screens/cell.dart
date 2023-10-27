import 'package:flutter/material.dart';
import 'package:flutter_pets_app/services/services.dart';
import 'package:flutter_pets_app/Screens/sub_breeds_screen.dart';

enum CellType { breed, subbreed }

class Cell extends StatelessWidget {
  //var
  final String breed, subbreed;
  final CellType type;
  const Cell(this.breed, this.subbreed, this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (type == CellType.breed) {
          Navigator.pushNamed(context, SubBreedScreen.routeName,
              arguments: breed);
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Image
                    FutureBuilder(
                        future:
                            DogService().getRandomImageByBreed(breed, subbreed),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Image.network(snapshot.data!);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ],
                );
              });
        }
      },
      child: Card(
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Title
                type == CellType.breed
                    ? Text(
                        breed.substring(0, 1).toUpperCase() +
                            breed.substring(1),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      )
                    : Text(
                        subbreed.substring(0, 1).toUpperCase() +
                            subbreed.substring(1),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),

                //Move icon
                const Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
