$(function(){
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
  //nbaマップ図サイドホバーアニメーション//
  $('li[id^="nba_map"]').hover(
    function() {
      $(this).css("background-color","#FDBD19");
    },
    function() {
      $(this).css("background-color","white");
    }
  );
})