var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    height: '360',
    width: '640',
    videoId: '3XFX5zax5bM',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    },
    playerVars: {
      controls: 0, //再生ボタンとか出さない
      showinfo: 0, //動画名とか出さない
      disablekb: 1, //ショートカットキー無効
      rel: 0 //関連動画出さない
    }
  });
}

function onPlayerReady(event) {
  event.target.playVideo();
  event.target.mute();
}
//ココまではほぼサンプルと同じ

var loopCount = 0;
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.ENDED) {//動画が停止したら
    if(loopCount < 20) {//ループ上限
      event.target.seekTo(0,true);//動画の初めにシーク
      event.target.playVideo();//動画を再生
      loopCount++;
    }
  }
}