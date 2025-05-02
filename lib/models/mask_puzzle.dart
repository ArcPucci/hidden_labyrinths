import 'dart:ui';

import 'package:hidden_labyrinths/models/models.dart';

class MaskPuzzle {
  final Size size;
  final String image;
  final String infoImage;
  final List<MaskPiece> pieces;

  MaskPuzzle({
    required this.size,
    required this.image,
    required this.infoImage,
    required this.pieces,
  });
}
