import 'package:flutter/material.dart';

class ImageButton extends StatefulWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Image unpressedImage;
  final Image pressedImage;
  final double paddingTop;
  final double width;
  final double height;
  final onTap;
  final Widget label;

  const ImageButton(
      {Key key,
      @required this.children,
      @required this.unpressedImage,
      @required this.pressedImage,
      this.label,
      this.onTap,
      this.width,
      this.height,
      this.paddingTop = 5,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center})
      : super(key: key);

  @override
  _ImageButtonState createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  double paddingTop;
  ImageProvider imagePressed;
  ImageProvider imageUnPressed;
  Image currentImage;
  Function _action;
  bool preloaded = false;
  List<Widget> _children;
  List<Widget> _label = [];

  @override
  void initState() {
    super.initState();

    imagePressed = widget.pressedImage.image;
    imageUnPressed = widget.pressedImage.image;
    currentImage = widget.unpressedImage;
    paddingTop = 0.0;

    _action = widget.onTap;
    if (widget.onTap == null) {
      _action = _doNothing;
    }

    if (widget.label != null) {
      _label.add(widget.label);
    }
    _children = widget.children;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(imagePressed, context);
    precacheImage(imageUnPressed, context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _action,
      onTapCancel: () {
        setState(() {
          currentImage = widget.unpressedImage;
          paddingTop = 0.0;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          currentImage = widget.pressedImage;
          paddingTop = widget.paddingTop ?? 0.0;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          currentImage = widget.unpressedImage;
          paddingTop = 0.0;
        });
      },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
                Container(
                  height: widget.height,
                  width: widget.width,
                  padding: EdgeInsets.only(top: paddingTop),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          alignment: Alignment(0, 0),
                          image: currentImage.image)),
                  child: Row(
                    mainAxisAlignment: widget.mainAxisAlignment,
                    crossAxisAlignment: widget.crossAxisAlignment,
                    children: _children,
                  ),
                )
              ] +
              _label),
    );
  }

  _doNothing() {}
}
