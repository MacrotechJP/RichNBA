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
                              '<div class="main_category_items_cover">'+
                                '<div class="main_category_items_cover_item">'+
                                  '<div class="main_category_items_cover_item_name">'+
                                    '<p>'+item.name+'</p>'+
                                  '</div>'+
                                  '<div class="main_category_items_cover_item_check">'+
                                    '<div class="main_category_items_cover_item_check_circle">'+
                                      '<i class="far fa-clipboard not_check"></i>'+
                                    '</div>'+
                                  '</div>'+
                                '</div>'+
                                '<div class="main_category_items_cover_bottom"><i class="fas fa-bars"></i></div>'+
                              '</div>'+
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

  //個別商品取り置きボタン押下時非同期通信
  $(document).on("click",".main_category_items_cover_item_check_circle",function(){
    event.preventDefault();
    // alert($(this).parent().parent().parent().parent().parent().find("a").attr("href"))
    $(this).find("i").attr("class","fas fa-clipboard-check yet_check")
  })

  //「商品名を表示する」押下で全商品名表示
  $('.main_category p input').change(function() {
    var judge = $(this).prop('checked');
    if(judge == true){
      $(".main_category_items_cover_item").css("transition","0.5s ease-in-out");
      $(".main_category_items_cover_item").css("opacity","1.0");
      $(".main_category_items_cover_item").css("height","92%");
    }else{
      $(".main_category_items_cover_item").css("opacity","0");
      $(".main_category_items_cover_item").css("height","0px");
    }
    
})

  //商品ホバー時商品名表示
  $(document).on('mouseenter','.main_category_items_cover',function(){
    $(this).find(".main_category_items_cover_item").css("transition","0.5s ease-in-out");
    $(this).find(".main_category_items_cover_item").css("opacity","1.0");
    $(this).find(".main_category_items_cover_item").css("height","92%");
  });
  $(document).on('mouseleave','.main_category_items_cover',function(){
    $(this).find(".main_category_items_cover_item").css("opacity","0");
    $(this).find(".main_category_items_cover_item").css("height","0px");
  });
  
})