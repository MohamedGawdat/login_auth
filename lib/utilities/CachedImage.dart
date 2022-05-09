import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImageView extends StatelessWidget {
  final String imageUrl;
  final double itemWidth;
  final double itemHight;
  final String title;
  const AppImageView(
      {required this.imageUrl,
      required this.itemWidth,
      required this.itemHight,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          dialogBackgroundColor: Colors.transparent,
          dialogTheme: const DialogTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          applyElevationOverlayColor: true),
      child: Builder(
        builder: (context) => InkWell(
          onTap: () {
            showMyDialogImage(context: context, imgUrl: imageUrl, title: title);
          },
          //     NavigateUtil.navigate(context, AppPhotoViewWithZoom(
          //   imgUrl:imageUrl,
          //   // heroId: widget.personData.id,
          // )),
          child: CachedNetworkImage(
            width: itemWidth,
            height: itemHight,
            fit: BoxFit.fill,
            imageUrl:
                'https://gawayez.e-postserv.com/Images/Prizes/' + imageUrl,
            placeholder: (context, url) => SizedBox(
              width: itemWidth,
              height: itemHight,
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  width: itemWidth,
                  height: itemHight,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageFullScreen extends StatelessWidget {
  final String url;
  const ImageFullScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Hero(tag: url, child: PhotoView(imageProvider: NetworkImage(url))));
  }
}

class AppPhotoViewWithZoom extends StatelessWidget {
  final String imgUrl;
  // final heroId;

  const AppPhotoViewWithZoom({
    Key? key,
    required this.imgUrl,
    // required this.heroId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (v) => Navigator.pop(context),
      child: SizedBox(
        height: 0.9.sh,
        width: double.infinity,
        // color: Colors.green,
        child:
            // Hero(
            // tag: heroId,
            // child:
            PhotoView(
          imageProvider: NetworkImage(
            'https://gawayez.e-postserv.com/Images/Prizes/' + imgUrl,
          ),
          backgroundDecoration: const BoxDecoration(color: Colors.white),
        ),
      ),
      // ),
    );
  }
}

Future<void> showMyDialogImage(
    {required BuildContext context,
    required String imgUrl,
    required String title}) async {
  return showDialog<void>(
    context: context,

    barrierColor: Colors.transparent,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        // title:  Text(title,style: AppTextStyle.mainTextStyle,),
        content: SizedBox(
          height: 0.3.sh,
          width: 0.8.sw,
          child: GestureDetector(
            onVerticalDragEnd: (v) => Navigator.pop(context),
            child: PhotoView(
              imageProvider: NetworkImage(
                'https://gawayez.e-postserv.com/Images/Prizes/' + imgUrl,
              ),
              backgroundDecoration:
                  const BoxDecoration(color: Colors.transparent),
            ),
          ),
        ),
        // actions: <Widget>[
        //   TextButton(
        //     child: const Text('الموافقة'),
        //     onPressed: () {
        //       // Provider.of<RegisterProvider>(context, listen: false)
        //       //     .changeRulesAcception(true);
        //       // callBack();
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      );
    },
  );
}
