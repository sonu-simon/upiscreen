import 'package:camera/camera.dart';
import 'package:findmind_upiscreen/main.dart';
import 'package:flutter/material.dart';

String? imageURL;

class UpiScreen extends StatefulWidget {
  const UpiScreen({Key? key}) : super(key: key);

  @override
  _UpiScreenState createState() => _UpiScreenState();
}

class _UpiScreenState extends State<UpiScreen> {
  TextStyle headingStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.2,
      fontSize: 18);

  late double bottomSheetHeightFraction = 0.25;
  CameraController? controller;

  expandBottomSheet() {
    setState(() {
      bottomSheetHeightFraction = 0.65;
    });
  }

  collapseBottomSheet() {
    setState(() {
      bottomSheetHeightFraction = 0.25;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);

    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: null,
        ),
        title: Text(
          'Savings',
          style: headingStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 2),
              child: Text(
                'Pay through UPI',
                style: headingStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 4, bottom: 12),
              child: ListTile(
                title: TextField(
                  keyboardType: TextInputType.phone,
                  // maxLength: 10,
                  decoration: InputDecoration(
                    hintText: 'Enter UPI Number',
                    hintStyle: TextStyle(fontSize: 14),
                    hoverColor: Colors.blue,
                  ),
                ),
              ),
            ),
            Stack(children: [
              Container(
                color: Colors.grey[300],
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                child: !controller!.value.isInitialized
                    ? Icon(Icons.disabled_by_default)
                    : AspectRatio(
                        aspectRatio: controller!.value.aspectRatio,
                        child: CameraPreview(controller!),
                      ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 92, horizontal: 116),
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 8,
                        color: Colors.black54,
                      )),
                ),
              )
            ])
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height *
                      bottomSheetHeightFraction,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // GestureDetector(
                        //   onPanUpdate: (details) {
                        //     if (details.delta.dy < 0) expandBottomSheet();
                        //     if (details.delta.dy > 0) collapseBottomSheet();
                        //   },
                        //   child:
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 20.0, top: 16.0, bottom: 4.0),
                          child: Text(
                            'Search Contact',
                            style: headingStyle,
                          ),
                        ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 16.0, top: 6.0, bottom: 4.0),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            // maxLength: 10,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.contacts),
                                onPressed: null,
                              ),
                              hintText: 'Search Number',
                              hintStyle: TextStyle(fontSize: 14),
                              hoverColor: Colors.blue,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                    title: Text('Name'),
                                    subtitle: Text('XXXXX XXXXX'),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey[300],
                                      foregroundImage: NetworkImage(imageURL!),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
