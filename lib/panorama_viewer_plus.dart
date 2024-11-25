library panorama_viewer_plus;

import 'package:flutter/material.dart';
import 'src/panorama_viewer.dart';

class CustomPanoramaViewer extends StatefulWidget {
  const CustomPanoramaViewer(
      {super.key,
      required this.imagePath,
      this.isAssetImage,
      this.height,
      this.width});

  final bool? isAssetImage;
  final String imagePath;
  final double? height;
  final double? width;

  @override
  State<CustomPanoramaViewer> createState() => _CustomPanoramaViewerState();
}

class _CustomPanoramaViewerState extends State<CustomPanoramaViewer> {
  double? width;
  double? height;
  bool? isAssetImage;
  String? imagePath;

  @override
  void initState() {
    if (widget.isAssetImage == null) {
      isAssetImage = false;
    } else {
      isAssetImage = widget.isAssetImage;
    }
    imagePath = widget.imagePath;

    width = widget.width ?? 0.0;
    height = widget.height ?? 0.0;
    super.initState();
  }

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    var deviceSize = MediaQuery.of(context).size;
    panorama = PanoramaViewer(
      animSpeed: .1,
      onViewChanged: onViewChanged,
      child:
          isAssetImage! ? Image.asset(imagePath!) : Image.network(imagePath!),
    );
    return ClipRRect(
      child: Container(
        height: height! <= 0 ? deviceSize.height : height,
        width: width! <= 0 ? deviceSize.width : width,
        color: Colors.grey.shade400,
        child: panorama,
      ),
    );
  }
}
