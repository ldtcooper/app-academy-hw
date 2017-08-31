function fizzbuzz(arr) {
  var fbArr = [];
  for (var i = 0; i <= arr.length; i++) {
    if (i % 5 === 0 || i % 3 === 0) {
      fbArr.push(arr[i]);
    }
  }
  return fbArr;
}

fizzbuzz([4, 7, 3, 9, 15, 5, 21, 30]);
