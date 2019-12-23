import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      color: Colors.red,
      decoration: BoxDecoration(),
    );
  }
}

class ErrorRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: Rect(),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return ErrorContainer();
          },
        ));
    ;
  }
}

class ErrorTriangle extends StatelessWidget {
  final Direction direction;

  const ErrorTriangle(this.direction, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: Triangle(direction),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return ErrorContainer();
          },
        ));
  }
}

enum Direction { Left, Right }

class Triangle extends CustomClipper<Path> {
  final Direction direction;
  Triangle(this.direction);

  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    switch (direction) {
      case Direction.Left:
        path.lineTo(0, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);
        break;
      case Direction.Right:
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);
        break;
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Rect extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}