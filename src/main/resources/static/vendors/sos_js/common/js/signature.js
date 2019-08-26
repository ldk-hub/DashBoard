// window가 load 될 때 Event Listener를 등록
if(window.addEventListener) {
  window.addEventListener('load', InitEvent, false);
}

var canvas, context, tool;
function InitEvent () {
  // Canvas 객체 탐색
  canvas = document.getElementById('drawSignature');
  if (!canvas) {
    alert('캔버스 객체를 찾을 수 없음');
    return;
  }

  if (!canvas.getContext) {
    alert(' Drawing Contextf를 찾을 수 없음');
    return;
  }

  // 2D canvas context를 가져옴
  context = canvas.getContext('2d');
  if (!context) {
    alert('getContext() 함수를 호출 할 수 없음');
    return;
  }
  context.strokeStyle = "#a10c3b";
  context.lineWith = 2;

  // 마우스 이벤트 설정
  var drawing = false;
  var mousePos = { x:0, y:0 };
  var lastPos = mousePos;
  canvas.addEventListener('mousedown', function (e) {
    drawing = true;
    lastPos = getMousePos(canvas, e);
  }, false);
  canvas.addEventListener('mouseup', function (e) {
    drawing = false;
  }, false);
  canvas.addEventListener('mousemove', function (e) {
    mousePos = getMousePos(canvas, e);
  }, false);

  // 캔버스에 마우스 이벤트 발생시 X, Y 영역 좌표를 가져옴
  // canvasDom = drawSignature
  function getMousePos(canvasDom, mouseEvent) {
    var rect = canvasDom.getBoundingClientRect();
    return {
      x: mouseEvent.clientX - rect.left,
      y: mouseEvent.clientY - rect.top
    };
  }

  // 서명이 그려질 때, setTimeout으로 실행주기 설정
  window.requestAnimFrame = (function (callback) {
    return window.requestAnimationFrame ||
           window.webkitRequestAnimationFrame ||
           window.mozRequestAnimationFrame ||
           window.oRequestAnimationFrame ||
           window.msRequestAnimaitonFrame ||
           function (callback) {
             window.setTimeout(callback, 1000/60);
           };
  })();

  // 서명 그리기
  function renderCanvas() {
    if (drawing) {
      context.moveTo(lastPos.x, lastPos.y);
      context.lineTo(mousePos.x, mousePos.y);
      context.stroke();
      lastPos = mousePos;
    }
  }

  // setTimeout으로 그리기 반복
  (function drawLoop () {
    requestAnimFrame(drawLoop);
    renderCanvas();
  })();

  // 터치 이벤트 설정
  // dispatchEvent는 터치시 마우스를 누른 것처럼 강제 이벤트 발생시킴
  canvas.addEventListener("touchstart", function (e) {
    mousePos = getTouchPos(canvas, e);
    var touch = e.touches[0];
    var mouseEvent = new MouseEvent("mousedown", {
      clientX: touch.clientX,
      clientY: touch.clientY
    });
    canvas.dispatchEvent(mouseEvent);
  }, false);
  canvas.addEventListener("touchend", function (e) {
    var mouseEvent = new MouseEvent("mouseup", {});
    canvas.dispatchEvent(mouseEvent);
  }, false);
  canvas.addEventListener("touchmove", function (e) {
    var touch = e.touches[0];
    var mouseEvent = new MouseEvent("mousemove", {
      clientX: touch.clientX,
      clientY: touch.clientY
    });
    canvas.dispatchEvent(mouseEvent);
  }, false);

  // 캔버스에 터치 이벤트 발생시 X, Y 영역 좌표를 가져옴
  // canvasDom = drawSignature
  function getTouchPos(canvasDom, touchEvent) {
    var rect = canvasDom.getBoundingClientRect();
    return {
      x: touchEvent.touches[0].clientX - rect.left,
      y: touchEvent.touches[0].clientY - rect.top
    };
  }

  // 터치 이벤트 발생시 화면 스크롤 막기
  document.body.addEventListener("touchstart", function (e) {
    if (e.target == canvas) {
      e.preventDefault();
    }
  }, false);
  document.body.addEventListener("touchend", function (e) {
    if (e.target == canvas) {
      e.preventDefault();
    }
  }, false);
  document.body.addEventListener("touchmove", function (e) {
    if (e.target == canvas) {
      e.preventDefault();
    }
  }, false);
} // InitEvent END


function fpayinfo_check(f) {
  var canvas = document.getElementById("drawSignature");
  var dataURL = canvas.toDataURL("image/png");
  f.imgSignature.value = dataURL;

  // java 서명 이미지 decode
  // private void saveImage(byte[] pngData) {
  //   String png = new String(dataURL);
  //   String find = "base64%2C";
  //   String tokens = png.substring(png.indexOf(find) + find.length());
  //   String decoded = StringUtils.replace(tokens, "%2F", "/");
  //   byte[] bytes = new Base64Encoder().decode(decoded);
  //
  //   BufferedImage image = ImageIO.read(new ByteArrayInputStream(bytes));
  // }

  alert(dataURL);
  alert('출동 내역 form(이미지 파일 3개, 서명) 넘겨서 완료되면 결제페이지(44.html)로 이동');
  window.location.href = '44.html';

  document.getElementById("btn_submit").disabled = "disabled";
  return false;
}
