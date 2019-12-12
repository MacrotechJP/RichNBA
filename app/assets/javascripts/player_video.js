$(function(){

  // トップページチーム名ホバー時slider動画・画像追加
  $('.youtube_logo').on("click",function(){
    $(this).parent().find("#video_cover").hide()
    $(this).hide()
    src_data = $(this).parent().find("div:first-of-type iframe").attr("src_data");
    $(this).parent().find("div:first-of-type iframe").attr("src",src_data);
    $(this).parent().find("div:first-of-type iframe").removeAttr("src_data");
  })

  //チームホバー時チーム商品非同期読み込み
  $(".main_top_left_team,.main_top_right_team").hover(
    function() {
      team_name = $(this).attr("alt");
      $.ajax({
        url: '/item/team_item_autoscroll',
        type: 'GET',
        data: {
          name: team_name
        },
        dataType: 'json'
      }).done(function(data){
          /* 通信成功時 */
          $.each(data[0], function(index, item){
            if(gon.current_user == false){
              var checkitem = ""
            }else if(data[1].indexOf(item.id) >= 0){
              var checkitem = '<i class="fas fa-clipboard-check yet_check"></i>'
            }else{
              var checkitem = '<i class="far fa-clipboard not_check"></i>'
            }
            var additem_teamscroll = 
                '<li>'+
                  '<div class="main_category_items autoscroll">'+
                    '<a href="'+item.siteurl+'" target="_blank">'+
                      '<img src="'+item.imageurl+'">'+
                        '<div class="main_category_items_cover">'+
                          '<div class="main_category_items_cover_item">'+
                            '<div class="main_category_items_cover_item_name">'+
                              '<p>'+item.name+'</p>'+
                            '</div>'+
                            '<div class="main_category_items_cover_item_check">'+
                              '<div class="main_category_items_cover_item_check_circle">'+checkitem+'</div>'+
                            '</div>'+
                          '</div>'+
                          '<div class="main_category_items_cover_bottom"><i class="fas fa-bars"></i></div>'+
                        '</div>'+
                    '</a>'+
                    '<div class="main_category_items_detail">'+
                    '¥'+item.price.toLocaleString()+
                    '<img src="'+data[2][item.ecsite_id-1]+'">'+
                    '</div>'+
                  '</div>'+
                '</li>'
            $("#main_top_right_team_player_right_item"+team_name).append(additem_teamscroll);
          }) 
      }).fail(function(data){
          /* 通信失敗時 */
          alert("通信失敗！")
      });
    },
    function() {
      //ホバー解除時は何もしない
    }
  );

})