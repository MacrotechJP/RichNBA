class Scraping

  ## Stage商品一覧より各商品URLをDBに保存
  nexturl = "https://www.x-stage2.jp/product-list?keyword=&Submit=&page=1"
  while true do
    agent = Mechanize.new
    page = agent.get(nexturl)
    element = page.search('.to_next_page.pager_btn')[0]
    if element.nil? then
      break
    else
      elementsiteurl = page.search('.item_data a')
      elementprice = page.search('.selling_price span')
      elementname = page.search('.goods_name')
      elementimage = page.search('.global_photo.item_image_box')
      elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
        Item.create(name:elename.inner_text,siteurl:elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub(",","").gsub("円",""),ecsite_id:4,imageurl:eleimage.to_s.match(/http.*jpg/))
      end
      nexturl = "https://www.x-stage2.jp"+element.get_attribute(:href)
    end
  end
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
  #     elementimage = page.search('.FS2_thumbnail_container a')
  #     elementprice = page.search('.itemPrice')
  #     elementimage.zip(elementprice).each do |eleimage, eleprice|
  #       Item.create(siteurl:eleimage.get_attribute(:href),price:eleprice.inner_text.gsub(",","").gsub("円",""),ecsite_id:11)
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

    
end
