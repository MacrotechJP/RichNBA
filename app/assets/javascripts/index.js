$(function(){

  //flashメッセージ自動非表示
  $(".notifications").fadeOut(6000);

  //新規登録・ログインボタンアニメーション//
  var animateButton = function(e) {

    e.preventDefault;
    //reset animation
    e.target.classList.remove('animate');
    
    e.target.classList.add('animate');
    setTimeout(function(){
      e.target.classList.remove('animate');
    },700);
  };
  
  var bubblyButtons = document.getElementsByClassName("log-button");
  
  for (var i = 0; i < bubblyButtons.length; i++) {
    bubblyButtons[i].addEventListener('click', animateButton, false);
  }

  //nbaマップ図ホバーアニメーション//
  $('area').hover(
    function() {
      $("#"+$(this).attr("class")).css("background-color","#FDBD19");
    },
    function() {
      $("#"+$(this).attr("class")).css("background-color","white");
    }
  );

  //トップ画面ポップアップ非表示・非同期
  $(".top_popup i").on("click",function(){
    $(".top_popup").fadeOut(1000);
    if ($(".top_popup_bottom input").prop("checked") == true) {
      var flg = true;
    } else {
      var flg = false;
    }
    $.ajax({
      url: '/item/popupcheck',
      type: 'GET',
      data: {
        check_flg: flg
      },
      dataType: 'json'
    }).fail(function(data){
        /* 通信失敗時 */
        alert("非同期通信失敗");
    });
  })
})