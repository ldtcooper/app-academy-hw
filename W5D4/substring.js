function isSubstring(searchString, subString) {
  var place = searchString.indexOf(subString);
  if (place >= 0) {
    return true;
  }
  else {
    return false;
  }
}

isSubstring("time to program", "time");
isSubstring("jump for joy", "joys");
