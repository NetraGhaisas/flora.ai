import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:path/path.dart';
 
import 'package:flora_ai/cropinfo.dart';
import 'package:flora_ai/history/cropdata.dart';
import 'package:flora_ai/http/Config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'http/http-client.dart';

class PickImageDemo extends StatefulWidget {

  PickImageDemo() : super();

  // final String title = "Flutter Pick Image demo";

  @override
  _PickImageDemoState createState() => _PickImageDemoState();
}

class _PickImageDemoState extends State<PickImageDemo> {
  Future<File> imageFile;
  File _image;
  String _uploadedFileURL;
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://flora-ai.appspot.com');

  StorageUploadTask _uploadTask;
 
  Future chooseFile(ImageSource source, BuildContext context) async {    
   await ImagePicker.pickImage(source: source).then((image) {    
     setState(() {    
       _image = image;    
     });    
   });
   print('iage chosen');
   uploadFile(context);
  
  }

 Future uploadFile(BuildContext context) async {
   print('in upload');
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('crops/${Path.basename(_image.path)}}');
       print('ref created'); 
   StorageUploadTask uploadTask = storageReference.putFile(_image);
   print('upload task created');   
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    
     setState(() {    
       _uploadedFileURL = fileURL;
       print(_uploadedFileURL); 
     });
   });
   _findCrop(context);    
 }
 
  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  _findCrop(BuildContext context) async {
    String id = "10";
    String title="test string";
    String baseUrl = AppConfig.baseUrl;
    HttpClient httpClient = new HttpClient(baseUrl);
    Map map = Map();
    map["id"] = id;
    map["title"] = title;
    http.Response response = await httpClient.post('/add',data:map);
    if(response.statusCode==200){
      print('success'+response.body);
      imageFile = null;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Container(child:CropInfoPage(CropData('Wheat','Triticum','This is a cereal grain',0))),
          ),
        );
    }
    else{
      print('failed'+response.body);
      Navigator.of(context).popAndPushNamed('/startup');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: _image==null ?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              child: Text('IMPORT FROM GALLERY', style: TextStyle(fontSize: 20)),
              splashColor: Theme.of(context).accentColor,
              highlightedBorderColor: Theme.of(context).accentColor,
              onPressed: () {
                // pickImageFromGallery(ImageSource.gallery);
                chooseFile(ImageSource.gallery, context);
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text('OR', style: TextStyle(color: Colors.grey,),),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            OutlineButton(
              child: Text('CLICK A PICTURE', style: TextStyle(fontSize: 20)),
              splashColor: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(horizontal: 45),
              highlightedBorderColor: Theme.of(context).accentColor,
              onPressed: () {
                print('Pressed');
                // pickImageFromGallery(ImageSource.camera);
                chooseFile(ImageSource.camera, context);
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 60)),
            Image.asset('images/app icon.png', height: 200,),
          ],
        ),
      ) : 
      // Uploader(file: _image),
      Container(),
    );
  }
}
