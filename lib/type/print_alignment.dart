enum PrintAlignment {
  alignmentLeft,
  alignmentCenter,
  alignmentRight,
}

extension PrintAlignmentExtension on PrintAlignment {
  String get typeName {
    switch (this) {
      case PrintAlignment.alignmentLeft:
        return "SII_PM_ALIGNMENT_LEFT";
      case PrintAlignment.alignmentCenter:
        return "SII_PM_ALIGNMENT_CENTER";
      case PrintAlignment.alignmentRight:
        return "SII_PM_ALIGNMENT_RIGHT";
    }
  }
}
