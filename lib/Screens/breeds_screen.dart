import 'package:flutter/material.dart';
import 'package:flutter_pets_app/services/services.dart';
import 'package:flutter_pets_app/Screens/cell.dart';

class BreedsScreen extends StatefulWidget {
  //var
  static const String routeName = "/";

  const BreedsScreen({super.key});
  @override
  BreedsScreenState createState() => BreedsScreenState();
}

class BreedsScreenState extends State<BreedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breeds'),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children:[
            //Random image
             FutureBuilder(
                future: DogService().getRandomImage(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                      return Image.network(snapshot.data!, height: MediaQuery.of(context).size.height * 0.2,);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
             const SizedBox(height: 10,),
             const Padding(
               padding:  EdgeInsets.all(8.0),
               child:  Text("Breed List : ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple)),
             ),
          //Breeds list
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: FutureBuilder(
            future: DogService().getAllBreeds(), 
            builder: (context, snapshot) {
              if(snapshot.hasData){
               return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder:  (context, index) {
                return Cell(snapshot.data![index], "", CellType.breed);
            });
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            }),
          ),]
        ),
      )),
    );
   }
}