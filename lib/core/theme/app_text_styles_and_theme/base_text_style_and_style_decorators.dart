import 'package:flutter/material.dart';

import '../app_colors.dart';

// Abstract decorator interface
abstract class TextStyleDecorator {
  TextStyle apply(TextStyle style);
}

// Concrete decorators
class BoldTextStyleDecorator implements TextStyleDecorator {
  @override
  TextStyle apply(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.bold);
  }
}

class NormalTextStyleDecorator implements TextStyleDecorator {
  @override
  TextStyle apply(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.normal);
  }
}

class ItalicTextStyleDecorator implements TextStyleDecorator {
  @override
  TextStyle apply(TextStyle style) {
    return style.copyWith(fontStyle: FontStyle.italic);
  }
}

class UnderlineTextStyleDecorator implements TextStyleDecorator {
  @override
  TextStyle apply(TextStyle style) {
    return style.copyWith(decoration: TextDecoration.underline);
  }
}


