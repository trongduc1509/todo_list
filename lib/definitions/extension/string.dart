extension DiacriticsAwareString on String {
  static const diacritics =
      'ÀÁÂÃÄÅẦàáâãäåầÒÓÔÕÕÖØỔòóôõöøổÈÉÊËẸèéêẹëðÇçÐđÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  static const nonDiacritics =
      'AAAAAAAaaaaaaaOOOOOOOOoooooooEEEEEeeeeeeCcDdIIIIiiiiUUUUuuuuNnSsYyyZz';

  String get withoutDiacriticalMarks => splitMapJoin('',
      onNonMatch: (char) => char.isNotEmpty && diacritics.contains(char)
          ? nonDiacritics[diacritics.indexOf(char)]
          : char);
}
