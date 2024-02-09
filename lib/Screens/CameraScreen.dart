import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_clone/Screens/Camera%20View.dart';
import 'package:whatsapp_clone/Screens/VideoView.dart';

 List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
   late CameraController _cameraController;

   late Future<void> cameraValue;
   bool isRecording= false;
   bool flash=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController =CameraController(cameras![0], ResolutionPreset.high);
    cameraValue= _cameraController.initialize();
  }
  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.done) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(_cameraController));
            }
            else
              {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }
          }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  children: [
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    children: [
                  IconButton(
                      icon: Icon(
                        flash?Icons.flash_on:Icons.flash_off,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {

                        setState(() {
                          flash =!flash;
                        });
                        flash?_cameraController.
                        setFlashMode(FlashMode.torch):
                        _cameraController.setFlashMode(FlashMode.off);
                      }),
                  GestureDetector(
                    onLongPress: ()async {
                      final  path =
                      join((await getTemporaryDirectory()).path,"${DateTime.now()}.mp4");
                      await _cameraController.startVideoRecording();
                      setState(() {
                        isRecording = true;

                      });
                    } ,
                    onLongPressUp: () async{
                      XFile videopath = await _cameraController.stopVideoRecording();
                    setState(() {
                      isRecording = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder)=>VideoViewPage(
                              path:videopath.path ,)));

                    } ,
                    onTap: () {
                      if(!isRecording)
                      takephoto(context);
                    },
                    child:isRecording?
                    Icon(
                      Icons.radio_button_on,
                      color: Colors.red,
                    size: 80,
                    ):
                    Icon(
                    Icons.panorama_fish_eye,
                    color: Colors.white,
                    size: 70,
                  ),
                      ),

                      IconButton(
                          icon: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {} ),
                ],
                ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("hold for video, tap for photo",
                      style: TextStyle(
                      color: Colors.white,
                    ),
                      textAlign: TextAlign.center,
                    )
              ]),
            ),
          )
        ],
      ),
    );
  }
    void takephoto(BuildContext context) async {
    //final  path =
    //join((await getTemporaryDirectory()).path,"${DateTime.now()}.png");
     XFile path= await  _cameraController.takePicture();
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
          builder: (builder)=>CameraViewPage(
            path:path.path,
          )));


    }

}
