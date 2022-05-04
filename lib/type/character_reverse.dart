enum CharacterReverse { reverse, reverseCancel }

extension CharacterReverseExtension on CharacterReverse {
  String get typeName {
    switch (this) {
      case CharacterReverse.reverse:
        return 'SII_PM_REVERSE';
      case CharacterReverse.reverseCancel:
        return 'SII_PM_REVERSE_CANCEL';
    }
  }
}
