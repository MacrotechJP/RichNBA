class Scraping

  # Item.all.each do |item|
    # Item.where(id:item.id).update(player_id:nil,team_id:nil,ecsite_id:nil)
  # end 

  ## Stage商品一覧より各商品URLをDBに保存
  # nexturl = "https://www.x-stage2.jp/product-list?keyword=&Submit=&page=1"
  # while true do
  #   agent = Mechanize.new
  #   page = agent.get(nexturl)
  #   element = page.search('.to_next_page.pager_btn')[0]
  #   if element.nil? then
  #     break
  #   else
  #     elementsiteurl = page.search('.item_data a')
  #     elementprice = page.search('.selling_price span')
  #     elementname = page.search('.goods_name')
  #     elementimage = page.search('.global_photo.item_image_box')
  #     elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #       Item.create(name:elename.inner_text,siteurl:elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub(",","").gsub("円",""),ecsite_id:4,imageurl:eleimage.to_s.match(/http.*jpg/))
  #     end
  #     nexturl = "https://www.x-stage2.jp"+element.get_attribute(:href)
  #   end
  # end
  ## Stage各商品URLの画像を複数保存
  # Item.all.where(ecsite_id:4).each do |item|

  #   agent = Mechanize.new
  #   page = agent.get(item.siteurl)
  #   element = page.search('.slider_image_box img')
  #   element.each do |ele|
  #     puts ele.get_attribute(:src)
  #     Itemimage.create(url:ele.get_attribute(:src),item_id:item.id)
  #   end
    
  # end


  ## BB KONG商品一覧より各商品URLをDBに保存
  # nexturl = "https://www.bbkong.net/fs/alleyoop/GoodsSearchList.html?pageno=1"
  # while true do
  #   agent = Mechanize.new
  #   page = agent.get(nexturl)
  #   element = page.search('.FS2_pager_link_next')[0]
  #   if element.nil? then
  #     break
  #   else
  #     elementsiteurl = page.search('.FS2_thumbnail_container a')
  #     elementprice = page.search('.itemPrice')
  #     elementimage = page.search('.FS2_thumbnail_container img')
  #     elementname = page.search('.itemGroup a')
  #     elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #       Item.create(name:elename.inner_text,siteurl:elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub(",","").gsub("円",""),ecsite_id:11,imageurl:"https://www.bbkong.net"+eleimage.get_attribute(:src))
  #     end
        
  #     nexturl = "https://www.bbkong.net/fs/alleyoop/GoodsSearchList.html"+element.get_attribute(:href)
  #   end
  # end
  ## BB KONG各商品URLの画像を複数保存
  # Item.all.each do |item|
  #   agent = Mechanize.new
  #   page = agent.get(item.siteurl)
  #   element = page.search('.FS2_additional_image_thumbnail_container img')
  #   element.each do |ele|
  #     puts ele.get_attribute(:src)
  #     Itemimage.create(url:ele.get_attribute(:src),item_id:item.id)
  #   end
  # end

  ## ROCKERS商品一覧より各商品URLをDBに保存
  # nexturl = "https://jordan.co.jp/?mode=srh&sort=n&cid=&keyword=&page=1"
  # while true do
  #   agent = Mechanize.new
  #   page = agent.get(nexturl)
  #   element = page.search('.pagenavi td')[2].search('a').to_s.match(/\?.*\d{1,2}/)
  #   if element.nil? then
  #     break
  #   else
  #     elementsiteurl = page.search('.imgBox a')
  #     elementprice = page.search('.price .price_search')
  #     elementimage = page.search('.imgBox img')
  #     elementname = page.search('.product_list .name a')
  #     elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #       Item.create(name:elename.inner_text,siteurl:"https://jordan.co.jp/"+elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub(",","").gsub(",","").gsub("円(税込)",""),ecsite_id:1,imageurl:eleimage.get_attribute(:src))
  #     end
  #     nexturl = "https://jordan.co.jp/"+element.to_s
  #   end
  # end

  # 為替値取得
  doll_agent = Mechanize.new
  doll_page = doll_agent.get("https://info.finance.yahoo.co.jp/fx/")
  doll_element = doll_page.search('#USDJPY_top_bid').inner_text.to_i
  ## Kyrie4商品一覧より各商品URLをDBに保存
  nexturl = "http://www.kyrieirving-shoes.us.com/index.php?main_page=advanced_search_result&search_in_description=1&keyword=.&inc_subcat=0&sort=20a&page=1"
  while true do
    agent = Mechanize.new
    page = agent.get(nexturl)
    element = page.search('#productsListingListingTopLinks a')
    if element.nil? then
      break
    else
      elementsiteurl = page.search('.colBorder .productimg a')
      elementprice = page.search('.productSpecialPrice')
      elementimage = page.search('.listingProductImage')
      elementname = page.search('.itemTitle.productname a')
      elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
        Item.create(name:elename.inner_text,siteurl:elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub("$","").gsub(".00","").to_i * doll_element,ecsite_id:8,imageurl:"http://www.kyrieirving-shoes.us.com/"+eleimage.get_attribute(:src))
      end
      nexturl = element[element.size()-1].get_attribute(:href)
    end
  end
  
end
