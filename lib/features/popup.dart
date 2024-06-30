import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

dynamic popup(BuildContext context) async {
  // show the modal dialog and pass some data to it
  final result = await Navigator.of(context).push(FullScreenModal());

  // print the data returned by the modal if any
  debugPrint(result.toString());
}

// this class defines the full-screen semi-transparent modal dialog
// by extending the ModalRoute class
class FullScreenModal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'ประกาศข่าวสาร',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                child: ImageSlideshow(
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  //Auto Scroll interval
                  //Do not auto scroll with null or 0
                  autoPlayInterval: 6000,
                  //Loops back to first slide
                  isLoop: true,
                  children: [
                    Image.asset(
                      'images/pro1.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/pro2.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/pro3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {
                // close the modal dialog and return some data if needed
                Navigator.pop(
                  context,
                );
              },
              icon: const Icon(Icons.close),
              label: const Text('ปิด'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        // add scale animation
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
    );
  }
}
