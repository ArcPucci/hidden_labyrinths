import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_drawing/path_drawing.dart';

class PuzzlePiece extends StatelessWidget {
  final String imagePath;
  final String maskPath;
  final Size size;

  const PuzzlePiece({
    super.key,
    required this.imagePath,
    required this.maskPath,
    required this.size,
  });

  Future<Path> _loadSvgPath(String assetPath) async {
    final svgString = await rootBundle.loadString(assetPath);
    final pathString = _extractPath(svgString);
    return parseSvgPathData(pathString);
  }

  String _extractPath(String svg) {
    final regExp = RegExp(r'd="([^"]+)"');
    final match = regExp.firstMatch(svg);
    return match?.group(1) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Path>(
      future: _loadSvgPath(maskPath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final path = snapshot.data!;
          return ClipPath(
            clipper: _PuzzleClipper(path),
            child: Image.asset(
              imagePath,
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return SizedBox(
            width: size.width,
            height: size.height,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

class _PuzzleClipper extends CustomClipper<Path> {
  final Path originalPath;

  _PuzzleClipper(this.originalPath);

  @override
  Path getClip(Size size) {
    final matrix4 = Matrix4.identity();
    matrix4.scale(size.width / 100, size.height / 100);
    return originalPath.transform(matrix4.storage);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
