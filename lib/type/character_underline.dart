enum CharacterUnderline {
  underline1,
  underline2,
  underlineCancel,
}

extension CharacterUnderlineExtension on CharacterUnderline {
  String get typeName {
    switch (this) {
      case CharacterUnderline.underline1:
        return "SII_PM_UNDERLINE_1";
      case CharacterUnderline.underline2:
        return "SII_PM_UNDERLINE_2";
      case CharacterUnderline.underlineCancel:
        return "SII_PM_UNDERLINE_CANCEL";
    }
  }
}
