$(function(){
  //商品クリック数非同期増加
  $(".main_category_items a").on("click",function(){

    var siteurl = $(this).attr("href");
    $.ajax({
      url: '/item/click',
      type: 'GET',
      data: {
        url: siteurl
      },
      dataType: 'json'
    }).done(function(data){
        /* 通信成功時 */

      }).fail(function(data){
        /* 通信失敗時 */

      });

  })

})