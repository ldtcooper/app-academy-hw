function isPrime(num) {
  if (num === 2) {
    return true;
  }
  else if (num % 2 === 0) {
    return false;
  }
  for (var i = 3; i < Math.sqrt(num) ; i+=2) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}
isPrime(2);

isPrime(10);

isPrime(15485863);

isPrime(3548563);

function sumOfNPrimes(n) {
  var primesArr = [];
  var i = 2;
  var sum = 0;
  while (primesArr.length < n) {
    if (isPrime(i)) {
      primesArr.push(i);
      sum += i;
      i += 2;
    }
  }
  return sum;
}

sumOfNPrimes(0);
sumOfNPrimes(1);
sumOfNPrimes(4);
