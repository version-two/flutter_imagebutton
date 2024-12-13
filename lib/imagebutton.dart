import 'package:flutter/material.dart';

class ImageButton extends StatefulWidget {
  @Deprecated('Use child instead')
  final List<Widget> children;
  final Widget? child;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Image unpressedImage;
  final Image pressedImage;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Widget? label;
  final bool isEnabled;
  final bool isLoading;
  final Widget? loadingWidget;
  final Color? loadingColor;
  final double pressOffset;

  const ImageButton({
    super.key,
    @Deprecated('Use child instead') this.children = const [],
    this.child,
    required this.unpressedImage,
    required this.pressedImage,
    this.label,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isEnabled = true,
    this.isLoading = false,
    this.loadingWidget,
    this.loadingColor,
    this.pressOffset = 0.0,
  });

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  double strokeWidth = 3;
  bool isPressed = false;
  late Image currentImage;
  late VoidCallback action;
  Widget? displayedChild;

  @override
  void initState() {
    super.initState();
    currentImage = widget.unpressedImage;
    action = widget.onTap ?? _doNothing;
    _updateDisplayedChild();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(widget.pressedImage.image, context);
    precacheImage(widget.unpressedImage.image, context);
  }

  @override
  void didUpdateWidget(covariant ImageButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateDisplayedChild();
  }

  void _updateDisplayedChild() {
    double loadingSquareSize = (widget.height ?? 0.0) -
        (widget.padding?.bottom ?? 0.0) -
        (widget.padding?.top ?? 0.0) -
        (widget.pressOffset) -
        (widget.pressOffset + 16.0 + strokeWidth);
    setState(() {
      displayedChild = widget.isLoading
          ? Center(
              child: Padding(
              padding: EdgeInsets.only(bottom: widget.pressOffset + 8.0, top: 8.0),
              child: Center(
                child: SizedBox(
                  height: loadingSquareSize.clamp(0, double.infinity),
                  width: loadingSquareSize.clamp(0, double.infinity),
                  child: widget.loadingWidget ??
                      CircularProgressIndicator(
                        color: widget.loadingColor,
                        strokeWidth: strokeWidth,
                      ),
                ),
              ),
            ))
          : widget.child ?? _buildChildren();
    });
  }

  Widget _buildChildren() {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: widget.children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled ? action : null,
      onTapCancel: widget.isEnabled
          ? () {
              setState(() {
                isPressed = false;
                currentImage = widget.unpressedImage;
              });
            }
          : null,
      onTapDown: widget.isEnabled
          ? (_) {
              setState(() {
                isPressed = true;
                currentImage = widget.pressedImage;
              });
            }
          : null,
      onTapUp: widget.isEnabled
          ? (_) {
              setState(() {
                isPressed = false;
                currentImage = widget.unpressedImage;
              });
            }
          : null,
      child: Semantics(
        button: true,
        enabled: widget.isEnabled,
        label: widget.label?.toString(),
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    image: currentImage.image,
                  ),
                ),
              ),
              Positioned(
                bottom: isPressed ? 0 : widget.pressOffset,
                top: isPressed ? widget.pressOffset : 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: widget.padding,
                  child: displayedChild,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doNothing() {}
}
