import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  SVGImagePaths._init();

  final startupSVG = 'startup'.toSVG;
  final readingSVG = 'reading'.toSVG;
  final sportSVG = 'sport'.toSVG;
  final drinkSVG = 'drink'.toSVG;
  final loginSVG = 'login'.toSVG;
}
