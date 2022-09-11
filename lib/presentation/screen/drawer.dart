import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/presentation/utils/camera_utils.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

enum StoryState { story, reel }

class _StoryState extends State<Story> {
  late CameraController _cameraController;
  int cam = 0;
  FlashMode flash = FlashMode.off;
  StoryState storyState = StoryState.story;
  final TextStyle selectedStoryState =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final TextStyle notSelectedStoryState =
      const TextStyle(color: Colors.white70);

  @override
  void initState() {
    _cameraController = CameraController(
        CameraUtil.instanse.cameras[cam], ResolutionPreset.medium);
    // TODO: implement initState
    super.initState();
    print("init state for camera");
  }

  @override
  void dispose() {
    _cameraController.dispose();
    print("dispose for camera");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 3,
              right: 2,
              left: 2,
              bottom: 120,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: FutureBuilder(
                      future: _cameraController.initialize(),
                      builder: (context, snapshot) {
                        return CameraPreview(_cameraController);
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      onPressed: () {
                        flash = flash == FlashMode.torch
                            ? FlashMode.off
                            : FlashMode.torch;
                        _cameraController.setFlashMode(flash);
                      },
                      icon: const Icon(
                        Icons.light_mode,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                height: 150,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.plumbing_sharp,
                      color: Colors.white,
                    ),
                    InkWell(
                        onTap: () {
                          if (storyState == StoryState.reel) {
                            setState(() {
                              storyState = StoryState.story;
                            });
                          }
                        },
                        child: Text("Story",
                            style: storyState == StoryState.story
                                ? selectedStoryState
                                : notSelectedStoryState)),
                    InkWell(
                        onTap: () {
                          if (storyState == StoryState.story) {
                            setState(() {
                              storyState = StoryState.reel;
                            });
                          }
                        },
                        child: Text("Reel",
                            style: storyState == StoryState.reel
                                ? selectedStoryState
                                : notSelectedStoryState)),
                    IconButton(
                        onPressed: () {
                          cam = cam == 0 ? 1 : 0;
                          _cameraController = CameraController(
                              CameraUtil.instanse.cameras[cam],
                              ResolutionPreset.medium);
                          _cameraController.initialize().then((_) {
                            setState(() {});
                          });
                        },
                        icon: const Icon(
                          Icons.cameraswitch_outlined,
                          color: Colors.white,
                        ))
                  ],
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _cameraController.takePicture().then((value) {
                        Scaffold.of(context).showBottomSheet(
                          (context) => Container(
                            child: Text("Image has taken in ${value.path}"),
                          ),
                        );
                      }).catchError(() {
                        Scaffold.of(context).showBottomSheet(
                          (context) => Container(
                            child: const Text("Nothing has taken"),
                          ),
                        );
                      });
                    },
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white70,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
