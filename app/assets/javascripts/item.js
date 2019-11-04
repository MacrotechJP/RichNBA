$(function(){

  //トップページスクロール時非同期商品読込
  var site_page = 1
  $(window).on('load scroll', function () {
    var scrollHeight= $(document).height(),
        scrollPosition = $(window).height() + $(window).scrollTop(),
        scrollRatio = (scrollHeight - scrollPosition) / scrollHeight;
    if (scrollRatio <= 0.01) {
      site_page += 1
      $.ajax({
        url: '/item/additem',
        type: 'GET',
        data: {
          url: site_page
        },
        dataType: 'json'
      }).done(function(data){
          /* 通信成功時 */
          // alert(data.length);
          $.each(data, function(index, item){
            var add_item = 
                          '<div class="main_category_items add">'+
                            '<a href='+item.siteurl+' target="_blank">'+
                              '<img src='+item.imageurl+'>'+
                            '</a>'+
                            '<div class="main_category_items_detail">'+
                            '¥'+item.price.toLocaleString()+
                            '</div>'+
                          '</div>'
            $('.main_category.2').append(add_item);
          }) 
      }).fail(function(data){
          /* 通信失敗時 */
          alert("失敗");
      });
    }
  });

  //商品クリック数非同期増加
  $(document).on("click", ".main_category_items a", function () {
    alert($(this).attr("href"))
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