# ImageButton

Button composed of two images.

## About
ImageButton is simple plugin that allows you to yous your images as simple buttons with two different faces (pressed / unpressed).

## How To Use ImageButton
```dart
Widget build(BuildContext context) {
    return ImageButton(
        children: <Widget>[],
        width: 91,
        height: 36,
        paddingTop: 5,
        pressedImage: Image.asset(
          "assets/pressed.png",
        ),
        unpressedImage: Image.asset("assets/normal.png"),
        onTap: () {
          print('test');
        },
    );
}
```

## ImageButton Properties

| property              | description |
| --------------------- | ----------- |
| children              |             |
| unpressedImage        |             |
| pressedImage          |             |
| label                 |             |
| onTap                 |             |
| width                 |             |
| height                |             |
| paddingTop            |             |
| mainAxisAlignment     |             |
| crossAxisAlignment    |             |

