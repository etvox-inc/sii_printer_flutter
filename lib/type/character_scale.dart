enum CharacterScale {
  vartical1Horizontal1,
  vartical1Horizontal2,
  vartical1Horizontal3,
  vartical1Horizontal4,
  vartical2Horizontal1,
  vartical2Horizontal2,
  vartical2Horizontal3,
  vartical2Horizontal4,
  vartical2Horizontal6,
  vartical3Horizontal1,
  vartical3Horizontal2,
  vartical3Horizontal3,
  vartical3Horizontal4,
  vartical4Horizontal1,
  vartical4Horizontal2,
  vartical4Horizontal3,
  vartical4Horizontal4,
  vartical4Horizontal6,
  vartical4Horizontal8,
  vartical6Horizontal2,
  vartical6Horizontal4,
  vartical6Horizontal6,
  vartical6Horizontal8,
  vartical8Horizontal4,
  vartical8Horizontal6,
  vartical8Horizontal8,
}

extension CharacterScaleExtension on CharacterScale {
  String get typeName {
    switch (this) {
      case CharacterScale.vartical1Horizontal1:
        return 'SII_PM_VARTICAL_1_HORIZONTAL_1';
      case CharacterScale.vartical1Horizontal2:
        return 'SII_PM_VARTICAL_1_HORIZONTAL_2';
      case CharacterScale.vartical1Horizontal3:
        return 'SII_PM_VARTICAL_1_HORIZONTAL_3';
      case CharacterScale.vartical1Horizontal4:
        return 'SII_PM_VARTICAL_1_HORIZONTAL_4';
      case CharacterScale.vartical2Horizontal1:
        return 'SII_PM_VARTICAL_2_HORIZONTAL_1';
      case CharacterScale.vartical2Horizontal2:
        return 'SII_PM_VARTICAL_2_HORIZONTAL_2';
      case CharacterScale.vartical2Horizontal3:
        return 'SII_PM_VARTICAL_2_HORIZONTAL_3';
      case CharacterScale.vartical2Horizontal4:
        return 'SII_PM_VARTICAL_2_HORIZONTAL_4';
      case CharacterScale.vartical2Horizontal6:
        return 'SII_PM_VARTICAL_2_HORIZONTAL_6';
      case CharacterScale.vartical3Horizontal1:
        return 'SII_PM_VARTICAL_3_HORIZONTAL_1';
      case CharacterScale.vartical3Horizontal2:
        return 'SII_PM_VARTICAL_3_HORIZONTAL_2';
      case CharacterScale.vartical3Horizontal3:
        return 'SII_PM_VARTICAL_3_HORIZONTAL_3';
      case CharacterScale.vartical3Horizontal4:
        return 'SII_PM_VARTICAL_3_HORIZONTAL_4';
      case CharacterScale.vartical4Horizontal1:
        return 'SII_PM_VARTICAL_4_HORIZONTAL_1';
      case CharacterScale.vartical4Horizontal2:
        return 'SII_PM_VARTICAL_4_HORIZONTAL_2';
      case CharacterScale.vartical4Horizontal3:
        return 'SII_PM_VARTICAL_4_HORIZONTAL_3';
      case CharacterScale.vartical4Horizontal4:
        return 'SII_PM_VARTICAL_4_HORIZONTAL_4';
      case CharacterScale.vartical4Horizontal6:
        return 'SII_PM_VARTICAL_4_HORIZONTAL_6';
      case CharacterScale.vartical4Horizontal8:
        return 'SII_PM_VARTICAL_4_HORIZONTAL_8';
      case CharacterScale.vartical6Horizontal2:
        return 'SII_PM_VARTICAL_6_HORIZONTAL_2';
      case CharacterScale.vartical6Horizontal4:
        return 'SII_PM_VARTICAL_6_HORIZONTAL_4';
      case CharacterScale.vartical6Horizontal6:
        return 'SII_PM_VARTICAL_6_HORIZONTAL_6';
      case CharacterScale.vartical6Horizontal8:
        return 'SII_PM_VARTICAL_6_HORIZONTAL_8';
      case CharacterScale.vartical8Horizontal4:
        return 'SII_PM_VARTICAL_8_HORIZONTAL_4';
      case CharacterScale.vartical8Horizontal6:
        return 'SII_PM_VARTICAL_8_HORIZONTAL_6';
      case CharacterScale.vartical8Horizontal8:
        return 'SII_PM_VARTICAL_8_HORIZONTAL_8';
    }
  }
}
