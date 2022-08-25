function Carousel(params) {
  const html = document.querySelector('html');
  const carousel = params.el;
  const wrapper = carousel.querySelector('.wrapper');
  const slides = carousel.querySelectorAll('.item');
  const length = slides.length;
  var raf = window.requestAnimationFrame || window.webkitRequestAnimationFrame;
  var caf = window.cancelAnimationFrame || window.webkitCancelAnimationFrame;
  var req;
  var gap = 20;
  var ww;
  var mouseX = 0;
  var xPos = 0;
  var posX = 0;
  var oldX = 0;
  var dX = 0;
  var num = 0;
  var slideW;
  var maxPos;
  //var cols;

  const resize = () => {
    //cols = getComputedStyle(carousel).getPropertyValue('--cols');
    slideW = slides[0].clientWidth;
    ww = window.innerWidth;
    maxPos = -(length * (slideW + gap)) + carousel.clientWidth - slideW;
  };

  const animate = () => {
    dX = mouseX - xPos;
    xPos += dX / 5;
    wrapper.style.transform = `matrix3d(1,0,0,0,0,1,0,0,0,0,1,0,${xPos},0,0,1)`;
    params.onSwipe(xPos / maxPos);
    req = raf(animate);
  };

  const _mouseDown = value => posX = value + oldX;

  const _mouseMove = e => mouseX = e - posX;

  const _mouseUp = value => {
    document.body.onmousemove = null;
    document.body.onmouseup = null;
    html.onmouseleave = null;
    oldX = posX - value;
    if (xPos > 0) {
      mouseX = posX = oldX = 0;
    }
    if (xPos < maxPos) {
      mouseX = posX = maxPos;
      oldX = -maxPos;
    }
    //
    //	num = Math.floor((ww - (xPos + (ww - (slideW + gap)) - ww/(2 * cols)))/(slideW + gap)) - 1;
    //if(num < 0) num = 0;
    //	if(num > length - 3) num = length - 3;
    /*mouseX = -(num * (slideW + gap));
    posX =  -(num * (slideW + gap));
    oldX = (num * (slideW + gap));*/
  };

  const _mouseLeave = e => {
    const X = e.clientX;
    const Y = e.clientY;
    if (Y <= 0 || X <= 0 || X >= ww || Y >= window.innerHeight) {
      _mouseUp(e.clientX);
    }
  };

  const onViewport = () => {
    window.addEventListener('resize', resize);
    resize();
    animate();
  };

  wrapper.onmousedown = e => {
    _mouseDown(e.clientX);
    document.body.onmousemove = e => _mouseMove(e.clientX);
    document.body.onmouseup = e => _mouseUp(e.clientX);
    html.onmouseleave = e => _mouseLeave(e);
    return false;
  };

  onViewport();

  const goto = () => {
    if (num == 5) {
      mouseX = posX = maxPos;
      oldX = -maxPos;
    } else {
      mouseX = posX = -(num * (slideW + gap));
      oldX = -mouseX;
    }
  };
  this.prev = () => {
    num--;
    if (num <= 0) {
      num = 0;
    }
    goto();
  };
  this.next = () => {
    num++;
    if (num > 5) {
      num = 5;
    }
    goto();
  };
}

/**/
const carousel = document.querySelector('.carousel');
const timeline = carousel.querySelector('.timeline');
const timeline_cursor = timeline.querySelector('.cursor');
const btn_prev = carousel.querySelector('.btn-prev');
const btn_next = carousel.querySelector('.btn-next');
var mycarousel = new Carousel({
  el: carousel,
  onSwipe(percent) {
    timeline_cursor.style.width = percent * 100 + "%";
  } });

btn_prev.onclick = () => {
  mycarousel.prev();
};
btn_next.onclick = () => {
  mycarousel.next();
};