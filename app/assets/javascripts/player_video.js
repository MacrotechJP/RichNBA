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
    {
        id: 'oX2H8vgs4Bo',
        area: 'sample01'
    }, {
        id: 'wbqOCoBkGvg',
        area: 'sample02'
    }, {
        id: 'idIHKr4GvPY',
        area: 'sample03'
    }, {
        id: 'ke8aMAvP7pk',
        area: 'sample04'
    }
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
  e.target.playVideo();
    e.target.mute();
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

  var player_image1 = {Nets54: 'https://clutchpoints.com/wp-content/uploads/2019/09/Brooklyn-to-give-away-10000-Kyrie-Irving-jerseys-at-Oct.-25-game-vs.jpg',Warriors43:'https://d.newsweek.com/en/full/1237055/gettyimages-1053195938.jpg'};
  var player_image3 = {Nets54: 'https://clutchpoints.com/wp-content/uploads/2019/07/Boston_wanted_to_offer_Kyrie_Irving_an_extension_last_summer_but_knew_he_wouldn_t_take_it_because_rules_capped_the_salary.jpg'};
  var image1_1_50 = ["aa","aa","","","","","","","","","","","","","","","","","","","","","","","","","","","","",
                     "","","","","","","","","","","","","","","","","","","","","","","","","","","",];
  var image1_51_100 = [];
  var image2_1_50 = [];
  var image2_51_100 = [];

  $(".main_top_right_team_player_left_center_star").hover(function() {
    var id = $(this).find("h3").attr("id");
    console.log($(this).find("h3").attr("id").replace(/[^0-9]/g, ''));
    $(".swiper-slide").find('img[alt="Swiper01"]').attr("src",player_image1[id]);
    // $(".swiper-slide").find('iframe').attr("src","https://www.youtube.com/embed/E6PER1dmIJU?controls=0&showinfo=0&disablekb=1&rel=0&enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A3000&widgetid=1");
    $(".swiper-slide").find('img[alt="Swiper03"]').attr("src",player_image3[id]);
    $("#sample01").hide();
    $("#sample02").show();
  }, function() {
    // $(".swiper-slide").find('img[alt="Swiper01"]').attr("src","https://www.youtube.com/embed/E6PER1dmIJU?controls=0&showinfo=0&disablekb=1&rel=0&enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A3000&widgetid=1");
    // $(".swiper-slide").find('img[alt="Swiper03"]').attr("src","http://bit.ly/2ojmdiy")
  });
  //https://www.youtube.com/embed/E6PER1dmIJU?controls=0&showinfo=0&disablekb=1&rel=0&enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A3000&widgetid=1
  //https://www.youtube.com/embed/E6PER1dmIJU
  
})

