// var player;
// function onYouTubeIframeAPIReady() {
//   player = new YT.Player('sample01', {
//     height: '313',
//     videoId: '3XFX5zax5bM',
//     events: {
//       'onReady': onPlayerReady,
//       'onStateChange': onPlayerStateChange
//     },
//     playerVars: {
//       controls: 0, //再生ボタンとか出さない
//       showinfo: 0, //動画名とか出さない
//       disablekb: 1, //ショートカットキー無効
//       rel: 0 //関連動画出さない
//     }
//   });
// }

// function onPlayerReady(event) {
//   event.target.playVideo();
//   event.target.mute();
// }
// //ココまではほぼサンプルと同じ

// var loopCount = 0;
// function onPlayerStateChange(event) {
//   if (event.data == YT.PlayerState.ENDED) {//動画が停止したら
//     if(loopCount < 20) {//ループ上限
//       event.target.seekTo(0,true);//動画の初めにシーク
//       event.target.playVideo();//動画を再生
//       loopCount++;
//     }
//   }
// }

// 各プレーヤーの格納
var ytPlayer = [];
// プレーヤーのサイズ
var ytWidth = 640;
var ytHeight = 313;
// 各動画情報
var ytData = [
  {id: 'MQs0F-9IwT0',area: 'teamvideo_Celtics'}, {id: 'K0vdUSOge4Y',area: 'teamvideo_Nets'}, {id: 'MQs0F-9IwT0',area: 'teamvideo_Knicks'}, 
    {id: 'MQs0F-9IwT0',area: 'teamvideo_76ers'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Raptors'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Bulls'},
      {id: 'MQs0F-9IwT0',area: 'teamvideo_Cavaliers'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Pistons'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Pacers'},
        {id: 'MQs0F-9IwT0',area: 'teamvideo_Bucks'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Hawks'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Hornets'},
          {id: 'MQs0F-9IwT0',area: 'teamvideo_Heat'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Magic'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Wizards'},
  {id: 'MQs0F-9IwT0',area: 'teamvideo_Mavericks'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Rockets'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Grizzlies'},
    {id: 'MQs0F-9IwT0',area: 'teamvideo_Pelicans'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Spurs'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Nuggets'},
      {id: 'MQs0F-9IwT0',area: 'teamvideo_Timberwolves'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Thunder'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Blazers'},
        {id: 'MQs0F-9IwT0',area: 'teamvideo_Jazz'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Warriors'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Clippers'},
          {id: 'MQs0F-9IwT0',area: 'teamvideo_Lakers'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Suns'},{id: 'MQs0F-9IwT0',area: 'teamvideo_Kings'},
    {id: 'MQs0F-n5S5Sa6uDnM',area: 'playervideo_Antetokounmpo'},{id: 'E6PER1dmIJU',area: 'playervideo_Stephen Curry'},
    {id: 'MQs0F-9IwT0',area: 'teamvideo_Kings'}
];
 
// 各プレーヤーの埋め込み
function onYouTubeIframeAPIReady() {
    for(var i = 0; i < ytData.length; i++) {
        ytPlayer[i] = new YT.Player(ytData[i]['area'], {
            width: ytWidth,
            height: ytHeight,
            videoId: ytData[i]['id'],
            playerVars: {
                rel: 0
            },
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
}
 
// 各プレーヤー準備完了後の処理
function onPlayerReady(e) {
  // e.target.playVideo();
  //   e.target.mute();
}
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










//選手ホバー時、画像・動画変更
$(function(){

  var team_image1 = {"nba_map1":"https://00m.in/20O2d","nba_map2":"https://00m.in/XJaYe","nba_map3":"https://00m.in/FUn5T",
  "nba_map4":"https://00m.in/kJaCn","nba_map5":"https://00m.in/lnT1j","nba_map6":"https://00m.in/5FY88","nba_map7":"https://00m.in/GRrnn",
  "nba_map8":"https://00m.in/whlG8","nba_map9":"https://00m.in/REj9c","nba_map10":"https://00m.in/OkHKw","nba_map11":"https://00m.in/YHAsK",
  "nba_map12":"https://00m.in/Bcofl","nba_map13":"https://00m.in/lGNP9","nba_map14":"https://00m.in/LtlHo","nba_map15":"https://00m.in/wpYQN",
  "nba_map16":"","nba_map17":"https://00m.in/9VKew","nba_map18":"","nba_map19":"",
  "nba_map20":"","nba_map21":"","nba_map22":"","nba_map23":"",
  "nba_map24":"","nba_map25":"","nba_map26":"","nba_map27":"",
  "nba_map28":"","nba_map29":"","nba_map30":"https://00m.in/judFZ"}
  
  var team_image2 = {"nba_map1":"https://00m.in/FlV7Z","nba_map2":"https://00m.in/FXPlx","nba_map3":"https://00m.in/7lveV",
  "nba_map4":"https://00m.in/3GgTY","nba_map5":"https://00m.in/ccnpc","nba_map6":"https://00m.in/LlMhf","nba_map7":"https://00m.in/zIrSg",
  "nba_map8":"https://00m.in/vnh34","nba_map9":"https://00m.in/h7hZG","nba_map10":"https://00m.in/L7AFM","nba_map11":"https://00m.in/pePtv",
  "nba_map12":"https://00m.in/NQri6","nba_map13":"https://00m.in/ECJlp","nba_map14":"https://00m.in/lW9fZ","nba_map15":"https://00m.in/Yj0Q2",
  "nba_map16":"","nba_map17":"","nba_map18":"","nba_map19":"",
  "nba_map20":"","nba_map21":"","nba_map22":"","nba_map23":"",
  "nba_map24":"","nba_map25":"","nba_map26":"","nba_map27":"",
  "nba_map28":"","nba_map29":"","nba_map30":""}

  $(".main_top_left_team").hover(function(){
    var hover_team = $(this).find("li").attr("id");
    $(".swiper-slide").find('img[alt="Swiper01"]').attr("src",team_image1[hover_team]);
    $(".swiper-slide").find('img[alt="Swiper03"]').attr("src",team_image2[hover_team]);
  },function(){

  });
  $(".main_top_right_team").hover(function(){
    var hover_team = $(this).find("li").attr("id");
    $(".swiper-slide").find('img[alt="Swiper01"]').attr("src",team_image1[hover_team]);
    $(".swiper-slide").find('img[alt="Swiper03"]').attr("src",team_image2[hover_team]);
  },function(){

  });

  
  
  
})

