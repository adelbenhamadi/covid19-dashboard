bool textContainsAny(String s, List<String> charsToSearchFor) {
  var chars = Set<int>();
  charsToSearchFor.forEach((word) {
    if (word != null) chars.addAll(word.codeUnits);
  });
  if (chars.isEmpty || s.isEmpty) return false;
  var it = s.codeUnits.iterator;
  while (it.moveNext()) {
    if (chars.contains(it.current)) return true;
  }
  return false;
}

class MyCSVConverter {
  
  static String convertMap(List<Map<String,dynamic>> mapList){
    StringBuffer sb = StringBuffer();
    var keys = mapList.first.keys;
    convertSingleRow(keys.toList(),sb:sb);
    mapList.forEach((row){
      convertSingleRow(row.values.toList(),sb:sb);
    });
    return sb.toString();
  }

  static String convertSingleRow(List rowValues,
      {
      StringBuffer sb,
      String fieldDelimiter,
      String textDelimiter,
      String textEndDelimiter,
      String eol,
      bool delimitAllFields}) {
    if (rowValues == null || rowValues.isEmpty) return '';

    fieldDelimiter ??= ',';
    textDelimiter ??= '"';
    textEndDelimiter ??= textDelimiter;
    eol ??= '\r\n';
    delimitAllFields ??= false;

    if (fieldDelimiter == null || textDelimiter == null) {
      throw ArgumentError(
          'Field Delimiter ($fieldDelimiter) and Text Delimiter ($textDelimiter) must not be null.');
    }

    if (fieldDelimiter == textDelimiter) {
      throw ArgumentError(
          'Field Delimiter ($fieldDelimiter) and Text Delimiter ($textDelimiter) must not be equal.');
    }

    var fieldDel = '';
    sb ??= StringBuffer();
    // Comments assume field and text delimiter are default.
    // [val] _in the comments changes_ depending on the operation after the comment.
    rowValues.forEach((val) {

      String valString = val == null || val is Map ? "" : val.toString();
      if (val is String || delimitAllFields ||
          textContainsAny(valString,
              [fieldDelimiter, textDelimiter, textEndDelimiter, eol])) {
        // ab"cd => ab""cd
        if (textContainsAny(valString, [textEndDelimiter])) {
          var newEndDelimiter = "$textEndDelimiter$textEndDelimiter";
          valString = valString.replaceAll(textEndDelimiter, newEndDelimiter);
        }

        sb
          ..write(fieldDel) // ,
          ..write(textDelimiter) // "
          ..write(valString) // 5,3
          ..write(textEndDelimiter); // "
      } else {
        sb.write(fieldDel);
        sb.write(valString);
      }
      fieldDel = fieldDelimiter;
    });
    sb.write(eol);
    return sb.toString();
  }
}
