import 'package:flutter/material.dart';
///
/// The code below demonstrates the use of the Decorator Design Pattern to apply various text styles in Flutter.
/// The pattern allows for dynamic addition of responsibilities to objects. Here, it is used to modify TextStyle objects.
// Abstract Decorator Interface: TextStyleDecorator defines a method apply that takes a TextStyle and returns a modified TextStyle.
// Concrete Decorators: Several classes implement TextStyleDecorator to apply specific styles:
    // BoldTextStyleDecorator: Applies bold weight to the text.
    // NormalTextStyleDecorator: Applies normal weight to the text.
    // ItalicTextStyleDecorator: Applies italic style to the text.
    // UnderlineTextStyleDecorator: Applies underline decoration to the text.
///

// Abstract decorator interface
abstract class TextStyleDecorator {
  TextStyle apply(TextStyle style);
}

// Concrete decorators
class BoldTextStyleDecorator implements TextStyleDecorator {
  @override
  TextStyle apply(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.w600);
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


