enum CharacterFont { fontA, fontB }

extension CharacterFontExtension on CharacterFont {
  String get typeName {
    switch (this) {
      case CharacterFont.fontA:
        return 'SII_PM_FONT_A';
      case CharacterFont.fontB:
        return 'SII_PM_FONT_B';
    }
  }
}
