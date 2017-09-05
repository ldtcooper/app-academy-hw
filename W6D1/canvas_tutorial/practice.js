document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('myCanvas');
  canvas.height = 500;
  canvas.width = 500;
  let ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(10, 50, 100, 100);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 360);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 2;
  ctx.fillStyle = "pink";
  ctx.fill();
  ctx.stroke();
});
