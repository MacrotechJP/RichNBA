$(function(){
  $('.search_result_head_sort').each(function() {
    $(this).children('select').css('display', 'none');
    
    var $current = $(this);
    
    $(this).find('option').each(function(i) {
      if (i == 0) {
        $current.prepend($('<div>', {
          class: $current.attr('class').replace(/search_result_head_sort/g, 'sel__box')
        }));
        
        var placeholder = $(this).text();
        $current.prepend($('<span>', {
          class: $current.attr('class').replace(/search_result_head_sort/g, 'sel__placeholder'),
          text: placeholder,
          'data-placeholder': placeholder
        }));
        
        return;
      }
      
      $current.children('div').append($('<span>', {
        class: $current.attr('class').replace(/search_result_head_sort/g, 'sel__box__options'),
        text: $(this).text()
      }));
    });
  });
  
  // Toggling the `.active` state on the `.sel`.
  $('.search_result_head_sort').click(function() {
    $(this).toggleClass('active');
  });
  
  // Toggling the `.selected` state on the options.
  $('.sel__box__options').click(function() {
    var txt = $(this).text();
    var index = $(this).index();
    
    $(this).siblings('.sel__box__options').removeClass('selected');
    $(this).addClass('selected');
    
    var $currentSel = $(this).closest('.search_result_head_sort');
    $currentSel.children('.sel__placeholder').text(txt);
    $currentSel.children('select').prop('selectedIndex', index + 1);

    // 検索商品並び替え    
    var select_text = $(this).text();
    var select_sort = ["並び替える","人気の高い順","価格の高い順","価格の安い順"];
    $.each(select_sort, function(index, value) {
      if(select_text == value){
        $("#q_sorts option").eq(index).attr('selected',"selected");
        $("#item_search").submit();
      }
    })
  });

  // 現状並び替え条件を反映
  $(".sel__placeholder").text($(".search_result_head_sort").find('[selected=selected]').text())
})
