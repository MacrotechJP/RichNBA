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
  # search_genre = ["http://www.kyrieirving-shoes.us.com/kyrie-irving-shoes-c-106.html?page=1&sort=20a",
  #   "http://www.kyrieirving-shoes.us.com/kevin-durant-shoes-c-98.html?page=1&sort=20a",
  #   "http://www.kyrieirving-shoes.us.com/kobe-bryant-shoes-c-101.html?page=1&sort=20a",
  #   "http://www.kyrieirving-shoes.us.com/lebron-james-shoes-c-111.html?page=1&sort=20a",
  #   "http://www.kyrieirving-shoes.us.com/paul-george-shoes-c-120.html?page=1&sort=20a",
  #   "http://www.kyrieirving-shoes.us.com/russell-westbrook-shoes-c-124.html?page=1&sort=20a",
  #   "http://www.kyrieirving-shoes.us.com/air-jordan-shoes-c-74.html?page=1&sort=20a",
  #   "http://www.kyrieirving-shoes.us.com/women-c-128.html?page=1&sort=20a"]
  # nexturl = "http://www.kyrieirving-shoes.us.com/index.php?main_page=advanced_search_result&keyword=Enter%20search%20keywords%20here&search_in_description=1&inc_subcat=1&pfrom=0&pto=999999999&sort=20a&page=1"
  # while true do
  #   agent = Mechanize.new
  #   page = agent.get(nexturl)
  #   element = page.search('#productsListingListingTopLinks a')
  #   if element.nil? then
  #     break
  #   else
  #     elementsiteurl = page.search('.productimg a')
  #     elementprice = page.search('.productSpecialPrice')
  #     elementimage = page.search('.productimg a img')
  #     elementname = page.search('.itemTitle.productname a')
  #     elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #       Item.create(name:elename.inner_text,siteurl:elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub("$","").gsub(".00","").to_i * doll_element,ecsite_id:8,imageurl:"http://www.kyrieirving-shoes.us.com/"+eleimage.get_attribute(:src))
  #     end
  #     if element[element.size()-1].get_attribute(:title)  == " Next Page " then
  #       nexturl = element[element.size()-1].get_attribute(:href) 
  #     else
  #       break
  #     end
  #   end
  # end
  
  ## LockerRoom商品一覧より各商品URLをDBに保存
  #アトランタホークス商品保存
  pageNumber = 1
  team_url = {"11": "https://www.lids.com/nba-atlanta-hawks/o-1336+t-25033806+z-93057-3658341029?pageSize=72&pageNumber=",
              "1": "https://www.lids.com/nba-boston-celtics/o-1314+t-03369442+z-753-2689677207?pageSize=72&pageNumber=",
              "2": "https://www.lids.com/nba-brooklyn-nets/o-7958+t-69474976+z-8599-3395871562?pageSize=72&pageNumber=",
              "12": "https://www.lids.com/nba-charlotte-hornets/o-1358+t-36032811+z-97397-2978431882?pageSize=72&pageNumber=",
              "6": "https://www.lids.com/nba-chicago-bulls/o-2436+t-03035134+z-95761-2210095797?pageSize=72&pageNumber=",
              "7": "https://www.lids.com/nba-cleveland-cavaliers/o-2469+t-58927391+z-94842-930820000?pageSize=72&pageNumber=",
              "16": "https://www.lids.com/nba-dallas-mavericks/o-1381+t-70254036+z-93460-1649608898?pageSize=72&pageNumber=",
              "21": "https://www.lids.com/nba-denver-nuggets/o-1303+t-58581771+z-98779-3142836763?pageSize=72&pageNumber=",
              "8": "https://www.lids.com/nba-detroit-pistons/o-3547+t-47705116+z-92029-2092700075?pageSize=72&pageNumber=",
              "26": "https://www.lids.com/nba-golden-state-warriors/o-2481+t-14699552+z-96875-4006188394?pageSize=72&pageNumber=",
              "17": "https://www.lids.com/nba-houston-rockets/o-4614+t-81588486+z-99473-4231562024?pageSize=72&pageNumber=",
              "9": "https://www.lids.com/nba-indiana-pacers/o-2458+t-92146265+z-98839-1905179705?pageSize=72&pageNumber=",
              "27": "https://www.lids.com/nba-la-clippers/o-6869+t-69369678+z-8208-4048299098?pageSize=72&pageNumber=",
              "28": "https://www.lids.com/nba-los-angeles-lakers/o-7936+t-58368591+z-8297-1132464865?pageSize=72&pageNumber=",
              "18": "https://www.lids.com/nba-memphis-grizzlies/o-2469+t-92709636+z-96246-3283194474?pageSize=72&pageNumber=",
              "13": "https://www.lids.com/nba-miami-heat/o-1381+t-70814137+z-93939-1789264869?pageSize=72&pageNumber=",
              "10": "https://www.lids.com/nba-milwaukee-bucks/o-2481+t-36149627+z-96866-3406917104?pageSize=72&pageNumber=",
              "22": "https://www.lids.com/nba-minnesota-timberwolves/o-4614+t-58256351+z-97942-4079700343?pageSize=72&pageNumber=",
              "19": "https://www.lids.com/nba-new-orleans-pelicans/o-1347+t-58704174+z-92431-269462119?pageSize=72&pageNumber=",
              "3": "https://www.lids.com/nba-new-york-knicks/o-3525+t-47366386+z-96537-3858685569?pageSize=72&pageNumber=",
              "23": "https://www.lids.com/nba-oklahoma-city-thunder/o-3536+t-81817432+z-97947-4212551096?pageSize=72&pageNumber=",
              "14": "https://www.lids.com/nba-orlando-magic/o-3581+t-14250855+z-98827-1195550213?pageSize=72&pageNumber=",
              "4": "https://www.lids.com/nba-philadelphia-76ers/o-1358+t-92585323+z-96452-3140600193?pageSize=72&pageNumber=",
              "29": "https://www.lids.com/nba-phoenix-suns/o-4603+t-81818624+z-96653-233883918?pageSize=72&pageNumber=",
              "24": "https://www.lids.com/nba-portland-trail-blazers/o-3592+t-25363192+z-94828-550147839?pageSize=72&pageNumber=",
              "30": "https://www.lids.com/nba-sacramento-kings/o-7969+t-70474271+z-790-2908558801?pageSize=72&pageNumber=",
              "20": "https://www.lids.com/nba-san-antonio-spurs/o-4614+t-47813138+z-8930-196576080?pageSize=72&pageNumber=",
              "5": "https://www.lids.com/nba-toronto-raptors/o-1347+t-25360839+z-98845-2874563825?pageSize=72&pageNumber=",
              "25": "https://www.lids.com/nba-utah-jazz/o-2414+t-58580874+z-91618-3977262962?pageSize=72&pageNumber=",
              "15": "https://www.lids.com/nba-washington-wizards/o-3503+t-25923131+z-98939-2702724964?pageSize=72&pageNumber=",
            }
  team_url.each_with_index do |(key,val),i|
    pageNumber = 0
    roop_flg = true
    while roop_flg == true do
      pageNumber += 1
      nexturl = val+pageNumber.to_s+"&sortOption=TopSellers"
      agent = Mechanize.new
      page = agent.get(nexturl)
      element = page.search('.pagination-list-container li')
      team_key = key
      if element[element.size()-1].get_attribute(:class) == "next-page disabled" then
        roop_flg = false
      else
        elementsiteurl = page.search('.product-image-container a')
        elementprice = page.search('.column .price-tag span:first-child')
        elementimage = page.search('.product-image-container img')
        elementname = page.search('.product-card-title a')
        elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
          Item.create(name:elename.inner_text,
            siteurl:"https://www.lids.com/"+elesiteurl.get_attribute(:href),
            price:eleprice.inner_text.gsub("Sale:","").gsub("$","").to_i * doll_element,
            team_id:team_key.to_s ,ecsite_id:15,
            imageurl:"http:"+eleimage.get_attribute(:src))
        end
      end
    end
  end
  
end
