enum CharacterBold { bold, normal }

extension CharacterBoldExtension on CharacterBold {
  String get typeName {
    switch (this) {
      case CharacterBold.bold:
        return 'SII_PM_BOLD';
      case CharacterBold.normal:
        return 'SII_PM_BOLD_CANCEL';
    }
  }
}
