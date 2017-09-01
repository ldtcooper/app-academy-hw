const hammerTime = function(time) {
  window.setTimeout( function() {
    //  gotta define the function inside an anonymous function!
    alert(`${time} is hammetime!`);
  },
     time);
};
