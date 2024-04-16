import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imag;

class DetectorScreen extends StatefulWidget{
  const DetectorScreen({super.key});

  @override
  State<DetectorScreen> createState() => DetectorScreenState();

}

class DetectorScreenState extends State<DetectorScreen>{
  // Image Picker Variables and Functions
  File? img;
  bool imageUploaded=false;
  Future _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        img = File(pickedFile.path);
        imageUploaded=true;
      });
    }
  }
  
  void reset(){
    setState(() {
      img=null;
      imageUploaded=false;
      predictionStatus=false;
      prediction=null;
    });
  }

  // Model Variables and Fucntions
  Interpreter? _interpreter;
  bool predictionStatus=false;
  String? prediction;

  void loadModel() async {
    _interpreter = await Interpreter.fromAsset('DL model/model.tflite');
  }
 
  //Image preprocessing and model prediction
 void predict() async {
  imag.Image? image = imag.decodeImage(img!.readAsBytesSync());
  imag.Image resizedImage = imag.copyResize(image!, width: 64, height: 64);
  var normalizedImage = resizedImage.getBytes().map((pixel) => pixel / 255).toList();
  var input = Float32List.fromList(normalizedImage).reshape([1, 64, 64, 3]);
  var output = Float32List(1).reshape([1, 1]);
  _interpreter!.run(input, output);
  (output[0][0]<0.5)? prediction="Diseased": prediction="Healthy";
  setState(() {
    predictionStatus=true;
  });
  print(output);
}

  // initstate
  @override
  void initState(){
    super.initState();
    loadModel();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('PlantCare',style: GoogleFonts.montserrat(fontSize:22),),
        elevation: 1,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            
            (imageUploaded)? 
            Padding(
              padding: const EdgeInsets.fromLTRB(0,100,0,0),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.file(img!,fit: BoxFit.cover,)),
            ):
            Padding(
              padding: const EdgeInsets.fromLTRB(0,300,0,0),
              child: ElevatedButton(onPressed: _pickImage,
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(6),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
                  fixedSize: const MaterialStatePropertyAll(Size(320, 50)),
                  backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(170, 0, 171, 148)),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset('assets/icons/gallery.png',scale: 12,color: Colors.white,),
                  const SizedBox(width: 12,),
                  Text("Upload From Gallery",style: GoogleFonts.lato(fontSize:20,color: Colors.white),),
                  const SizedBox(width: 25)
                ],),
                ),
            ),
            

            (prediction!=null)? Padding(
              padding: const EdgeInsets.fromLTRB(0,25,0,5),
              child: Text("This Plant Looks "+prediction!, style: GoogleFonts.lato(fontSize: 22),),
            ):
            (imageUploaded)?const SizedBox(height: 60,):const SizedBox(),


            const SizedBox(height: 15,),
            (predictionStatus)?
            ElevatedButton(onPressed: reset,
            style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(6),
                fixedSize: MaterialStatePropertyAll(Size(120, 50)),
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(170, 0, 171, 148)),
                foregroundColor: MaterialStatePropertyAll(Colors.white)),
             child: Text("Reset",style: GoogleFonts.lato(fontSize:20,color: Colors.white))):
            ElevatedButton(onPressed: imageUploaded ? predict :
             (){ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("No Image Uploaded"),
                duration: Duration(seconds: 1),));},
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(6),
                fixedSize: const MaterialStatePropertyAll(Size(120, 50)),
                backgroundColor: MaterialStatePropertyAll(imageUploaded? const Color.fromARGB(170, 0, 171, 148) : const Color.fromARGB(170, 1, 111, 97)),
                foregroundColor: const MaterialStatePropertyAll(Colors.white)),
             child: Text("Check",style: GoogleFonts.lato(fontSize:20,color: Colors.white)))
          ],),
      )
    );
  }

  @override
  void dispose(){
    _interpreter!.close();
    super.dispose();
  }
}