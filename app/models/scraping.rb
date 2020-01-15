class Scraping
  ## 目次 ##
  # ライブラリ読み込み
  # 為替値取得(ドル)
  # 為替値取得(インド・ルピー)
  # チーム最新試合ハイライト動画取得
  # 最新選手一覧登録
  # チームランキング調整
  # Stage商品登録・更新           全体：約2600... nba：約200... 登録：（全体）...
  # BB KONG商品登録
  # ROCKERS商品登録・更新
  # Kyrie4商品登録・更新
  # LockerRoom商品登録・更新
  # SLAM商品登録・更新
  # Rakuten商品登録・更新
  # SELECTION商品登録・更新
  # XEBIO商品登録・更新
  # SPALDING商品登録・更新
  # SPORTEC商品登録・更新
  # WSS商品登録・更新
  # Yahoo!ショッピング商品登録・更新
  # NBA Store商品登録・更新
  # 既存商品（選手、チームカラム追加）

  ## ライブラリ読み込み
  # require 'open-uri'  # URLにアクセスするためのライブラリの読み込み
  # require 'nokogiri'  # Nokogiriライブラリの読み込み

  ## 為替値取得(ドル)
  # doll_agent = Mechanize.new
  # doll_page = doll_agent.get("https://info.finance.yahoo.co.jp/fx/")
  # doll_element = doll_page.search('#USDJPY_top_bid').inner_text.to_i

  ## 為替値取得(インド・ルピー)
  # rs_agent = Mechanize.new
  # rs_page = rs_agent.get("https://info.finance.yahoo.co.jp/fx/convert/?a=1&s=INR&t=JPY")
  # rs_element = rs_page.search('.price.noLine').inner_text.to_f

  ## 為替値取得(ユーロ)
  # eu_agent = Mechanize.new
  # eu_page = eu_agent.get("https://info.finance.yahoo.co.jp/fx/convert/?a=1&s=EUR&t=JPY")
  # eu_element = eu_page.search('.price.noLine').inner_text.to_i

  ## チーム最新試合ハイライト動画取得
  # Team.all.each do |team|
  #   url = 'https://www.youtube.com/results?search_query=nba+'+team.en_name
  #   charset = nil
  #   html = open(url) do |f|
  #     charset = f.charset # 文字種別を取得
  #     f.read              # htmlを読み込んで変数htmlに渡す
  #   end
  #   doc = Nokogiri::HTML.parse(html, nil, charset)
  #   doc.css(".yt-uix-sessionlink.spf-link").each do |link|
  #     if link.inner_text == team.name
  #       puts team.name+":"+link.get_attribute(:href).gsub(/.*=/,"")
  #       team.update(youtube_url:link.get_attribute(:href).gsub(/.*=/,""))
  #     end
  #   end
  # end

  ## 最新選手一覧登録
  # player_url = 
  #           {"11": "https://www.espn.com/nba/team/roster/_/name/atl/atlanta-hawks",
  #             "1": "https://www.espn.com/nba/team/roster/_/name/bos/boston-celtics",
  #             "2": "https://www.espn.com/nba/team/roster/_/name/bkn/brooklyn-nets",
  #             "12": "https://www.espn.com/nba/team/roster/_/name/cha/charlotte-hornets",
  #             "6": "https://www.espn.com/nba/team/roster/_/name/chi/chicago-bulls",
  #             "7": "https://www.espn.com/nba/team/roster/_/name/cle/cleveland-cavaliers",
  #             "16": "https://www.espn.com/nba/team/roster/_/name/dal/dallas-mavericks",
  #             "21": "https://www.espn.com/nba/team/roster/_/name/den/denver-nuggets",
  #             "8": "https://www.espn.com/nba/team/roster/_/name/det/detroit-pistons",
  #             "26": "https://www.espn.com/nba/team/roster/_/name/gs/golden-state-warriors",
  #             "17": "https://www.espn.com/nba/team/roster/_/name/hou/houston-rockets",
  #             "9": "https://www.espn.com/nba/team/roster/_/name/ind/indiana-pacers",
  #             "27": "https://www.espn.com/nba/team/roster/_/name/lac/la-clippers",
  #             "28": "https://www.espn.com/nba/team/roster/_/name/lal/los-angeles-lakers",
  #             "18": "https://www.espn.com/nba/team/roster/_/name/mem/memphis-grizzlies",
  #             "13": "https://www.espn.com/nba/team/roster/_/name/mia/miami-heat",
  #             "10": "https://www.espn.com/nba/team/roster/_/name/mil/milwaukee-bucks",
  #             "22": "https://www.espn.com/nba/team/roster/_/name/min/minnesota-timberwolves",
  #             "19": "https://www.espn.com/nba/team/roster/_/name/no/new-orleans-pelicans",
  #             "3": "https://www.espn.com/nba/team/roster/_/name/ny/new-york-knicks",
  #             "23": "https://www.espn.com/nba/team/roster/_/name/okc/oklahoma-city-thunder",
  #             "14": "https://www.espn.com/nba/team/roster/_/name/orl/orlando-magic",
  #             "4": "https://www.espn.com/nba/team/roster/_/name/phi/philadelphia-76ers",
  #             "29": "https://www.espn.com/nba/team/roster/_/name/phx/phoenix-suns",
  #             "24": "https://www.espn.com/nba/team/roster/_/name/por/portland-trail-blazers",
  #             "30": "https://www.espn.com/nba/team/roster/_/name/sac/sacramento-kings",
  #             "20": "https://www.espn.com/nba/team/roster/_/name/sa/san-antonio-spurs",
  #             "5": "https://www.espn.com/nba/team/roster/_/name/tor/toronto-raptors",
  #             "25": "https://www.espn.com/nba/team/roster/_/name/utah/utah-jazz",
  #             "15": "https://www.espn.com/nba/team/roster/_/name/wsh/washington-wizards",
  #           }
  # Player.all.update(team_id:nil)
  # player_url.each_with_index do |(key,val),i|
  #   nexturl = val
  #   agent = Mechanize.new
  #   page = agent.get(nexturl)
  #   elementname = page.search('.Table__TR.Table__TR--lg.Table__even .Table__TD:nth-of-type(2) span a')
  #   elementposition = page.search('.Table__TR.Table__TR--lg.Table__even .Table__TD:nth-of-type(3) span')
  #   elementage = page.search('.Table__TR.Table__TR--lg.Table__even .Table__TD:nth-of-type(4) span')
  #   elementsalary = page.search('.Table__TR.Table__TR--lg.Table__even .Table__TD:nth-of-type(8) span')
  #   elementimageurl = page.search('.Table__TR.Table__TR--lg.Table__even .Table__TD:nth-of-type(1) img')
  #   elementname.zip(elementposition,elementage,elementsalary,elementimageurl).each do |elename, eleposition,eleage,elesalary,eleimageurl|
  #     if elesalary.inner_text.to_s == "--" then 
  #       elesalary = nil 
  #     else
  #       elesalary = elesalary.inner_text.gsub("$","").gsub(",","").gsub(",","").to_i * doll_element
  #     end
  #     unless Player.where(name:elename.inner_text).exists?
  #       Player.create(
  #         name:elename.inner_text,
  #         position:eleposition.inner_text,
  #         age:eleage.inner_text,
  #         salary:elesalary,
  #         image_url:eleimageurl.get_attribute(:alt),
  #         team_id:key.to_s
  #       )
  #     else
  #       Player.find_by(name:elename.inner_text).update(
  #         name:elename.inner_text,
  #         position:eleposition.inner_text,
  #         age:eleage.inner_text,
  #         salary:elesalary,
  #         image_url:eleimageurl.get_attribute(:alt),
  #         team_id:key.to_s
  #       )
  #     end
  #   end
  # end
  
  # ## チームランキング調整
  # team = {
  #   "Milwaukee Bucks": "ミルウォーキー・バックス", "Boston Celtics": "ボストン・セルティックス", "Miami Heat": "マイアミ・ヒート",
  #   "Toronto Raptors": "トロント・ラプターズ", "Philadelphia 76ers": "フィラデルフィア・セブンティシクサーズ", "Indiana Pacers": "インディアナ・ペイサーズ",
  #   "Brooklyn Nets": "ブルックリン・ネッツ", "Orlando Magic": "オーランド・マジック", "Washington Wizards": "ワシントン・ウィザーズ",
  #   "Charlotte Hornets": "シャーロット・ホーネッツ", "Chicago Bulls": "シカゴ・ブルズ", "Cleveland Cavaliers": "クリーブランド・キャバリアーズ",
  #   "Detroit Pistons": "デトロイト・ピストンズ", "Atlanta Hawks": "アトランタ・ホークス", "New York Knicks": "ニューヨーク・ニックス",
  #   "Los Angeles Lakers": "ロサンゼルス・レイカーズ", "Denver Nuggets": "デンバー・ナゲッツ", "LA Clippers": "ロサンゼルス・クリッパーズ",
  #   "Dallas Mavericks": "ダラス・マーベリックス", "Utah Jazz": "ユタ・ジャズ", "Houston Rockets": "ヒューストン・ロケッツ",
  #   "Phoenix Suns": "フェニックス・サンズ", "Minnesota Timberwolves": "ミネソタ・ティンバーウルブズ", "Sacramento Kings": "サクラメント・キングス",
  #   "New Orleans Pelicans": "ニューオーリンズ・ペリカンズ", "San Antonio Spurs": "サンアントニオ・スパーズ", "Memphis Grizzlies": "メンフィス・グリズリーズ",
  #   "Oklahoma City Thunder": "オクラホマシティ・サンダー", "Portland Trail Blazers": "ポートランド・トレイルブレイザーズ", "Golden State Warriors": "ゴールデンステート・ウォリアーズ",
  # }
  # url = "https://www.espn.co.uk/nba/standings"
  # agent = Mechanize.new
  # page = agent.get(url)
  # element = page.search('.Table__TBODY tr .AnchorLink img')
  # element.each_with_index do |ele, rank|
  #   rank -= 15 if rank >= 15 
  #   team.each_with_index do |(key,val),i|
  #     if ele.get_attribute(:title) == key.to_s then
  #       Team.find_by(name:val).update(ranking:rank+1)
  #     end
  #   end
  # end

  # ## Stage商品登録・更新
  # Item.where(ecsite_id:4).update(delete_flg:1)
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
  #       unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #         Item.create(name:elename.inner_text,siteurl:elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub(",","").gsub("円",""),ecsite_id:4,imageurl:eleimage.to_s.match(/http.*jpg/))
  #       else
  #         Item.find_by(siteurl:elesiteurl.get_attribute(:href),ecsite_id:4).update(delete_flg:0)
  #       end
  #     end
  #     nexturl = "https://www.x-stage2.jp"+element.get_attribute(:href)
  #   end
  # end
  # Item.where(ecsite_id:4,delete_flg:1).destroy_all

  # ## BB KONG商品登録・更新
  # Item.where(ecsite_id:11).update(delete_flg:1)
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
  #       unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #         Item.create(name:elename.inner_text,siteurl:elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub(",","").gsub("円",""),ecsite_id:11,imageurl:"https://www.bbkong.net"+eleimage.get_attribute(:src))
  #       else
  #         Item.find_by(siteurl:elesiteurl.get_attribute(:href),ecsite_id:11).update(delete_flg:0)
  #       end
  #     end
  #     nexturl = "https://www.bbkong.net/fs/alleyoop/GoodsSearchList.html"+element.get_attribute(:href)
  #   end
  # end
  # Item.where(ecsite_id:11,delete_flg:1).destroy_all

  ## ROCKERS商品登録・更新
  # Item.where(ecsite_id:1).update(delete_flg:1)
  # nexturl = "https://jordan.co.jp/?mode=srh&sort=n&cid=&keyword=&page=1"
  # while true do
  #   begin
  #     agent = Mechanize.new
  #     page = agent.get(nexturl)
  #     element = page.search('.pagenavi td')[2].search('a').to_s.match(/\?.*\d{1,2}/)
  #     if element.nil? then
  #       break
  #     else
  #       elementsiteurl = page.search('.imgBox a')
  #       elementprice = page.search('.price .price_search')
  #       elementimage = page.search('.imgBox img')
  #       elementname = page.search('.product_list .name a')
  #       size1 = elementsiteurl.size()
  #       size2 = elementprice.size()
  #       size3 = elementimage.size()
  #       size4 = elementname.size()
  #       if size1==size2 && size1==size3 && size1==size4 && size2==size3 && size2==size4 && size3==size4 then 
  #         elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #           puts nexturl
  #           unless Item.where(siteurl:"https://jordan.co.jp/"+elesiteurl.get_attribute(:href)).exists?
  #             Item.create(name:elename.inner_text,siteurl:"https://jordan.co.jp/"+elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub(",","").gsub(",","").gsub("円(税込)",""),ecsite_id:1,imageurl:eleimage.get_attribute(:src))
  #           else
  #             Item.find_by(siteurl:"https://jordan.co.jp/"+elesiteurl.get_attribute(:href),ecsite_id:1).update(delete_flg:0)
  #           end
  #         end
  #       else
  #         puts "no"
  #       end
  #       nexturl = "https://jordan.co.jp/"+element.to_s
  #     end
  #   rescue Timeout::Error
  #     puts "  caught Timeout::Error !"
  #     false
  #     next
  #   rescue Mechanize::ResponseCodeError => e
  #     case e.response_code
  #     when "404"
  #       puts "  caught Net::HTTPNotFound !"
  #       false
  #       next # ページが見付からないときは次へ
  #     when "502"
  #       puts "  caught Net::HTTPBadGateway !"
  #       false
  #       next # 上手くアクセスできないときはもう1回！
  #     else
  #       puts "  caught Excepcion !" + e.response_code
  #       false
  #       next
  #     end
  #   end
  # end
  # Item.where(ecsite_id:1,delete_flg:1).destroy_all

  ## Kyrie4商品登録・更新
  # Item.where(ecsite_id:8).update(delete_flg:1)
  # nexturl = "http://www.kyrieirving-shoes.us.com/index.php?main_page=advanced_search_result&keyword=Enter%20search%20keywords%20here&search_in_description=1&inc_subcat=1&pfrom=0&pto=999999999&sort=20a&page=1"
  # while true do
  #   begin
  #     agent = Mechanize.new
  #     page = agent.get(nexturl)
  #     element = page.search('#productsListingListingTopLinks a')
  #     if element.nil? then
  #       break
  #     else
  #       elementsiteurl = page.search('.productimg a')
  #       elementprice = page.search('.productSpecialPrice')
  #       elementimage = page.search('.productimg a img')
  #       elementname = page.search('.itemTitle.productname a')
  #       elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #         puts nexturl
  #         unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #           Item.create(name:elename.inner_text,siteurl:elesiteurl.get_attribute(:href),price:eleprice.inner_text.gsub("$","").gsub(".00","").to_i * doll_element,ecsite_id:8,imageurl:"http://www.kyrieirving-shoes.us.com/"+eleimage.get_attribute(:src))
  #         else
  #           Item.find_by(siteurl:elesiteurl.get_attribute(:href),ecsite_id:8).update(delete_flg:0)
  #         end
  #       end
  #       if element[element.size()-1].get_attribute(:title)  == " Next Page " then
  #         nexturl = element[element.size()-1].get_attribute(:href) 
  #       else
  #         break
  #       end
  #     end
  #   rescue Timeout::Error
  #     puts "  caught Timeout::Error !"
  #     false
  #     next
  #   rescue Mechanize::ResponseCodeError => e
  #     case e.response_code
  #     when "404"
  #       puts "  caught Net::HTTPNotFound !"
  #       false
  #       next # ページが見付からないときは次へ
  #     when "502"
  #       puts "  caught Net::HTTPBadGateway !"
  #       false
  #       next # 上手くアクセスできないときはもう1回！
  #     else
  #       puts "  caught Excepcion !" + e.response_code
  #       false
  #       next
  #     end
  #   end
  # end
  # Item.where(ecsite_id:8,delete_flg:1).destroy_all
  
  ## LockerRoom商品登録・更新
  # pageNumber = 1
  # team_url = {
  #            "11": "https://www.lids.com/nba-atlanta-hawks/o-1336+t-25033806+z-93057-3658341029?pageSize=72&pageNumber=",
  #             "1": "https://www.lids.com/nba-boston-celtics/o-1314+t-03369442+z-753-2689677207?pageSize=72&pageNumber=",
  #             "2": "https://www.lids.com/nba-brooklyn-nets/o-7958+t-69474976+z-8599-3395871562?pageSize=72&pageNumber=",
  #             "12": "https://www.lids.com/nba-charlotte-hornets/o-1358+t-36032811+z-97397-2978431882?pageSize=72&pageNumber=",
  #             "6": "https://www.lids.com/nba-chicago-bulls/o-2436+t-03035134+z-95761-2210095797?pageSize=72&pageNumber=",
  #             "7": "https://www.lids.com/nba-cleveland-cavaliers/o-2469+t-58927391+z-94842-930820000?pageSize=72&pageNumber=",
  #             "16": "https://www.lids.com/nba-dallas-mavericks/o-1381+t-70254036+z-93460-1649608898?pageSize=72&pageNumber=",
  #             "21": "https://www.lids.com/nba-denver-nuggets/o-1303+t-58581771+z-98779-3142836763?pageSize=72&pageNumber=",
  #             "8": "https://www.lids.com/nba-detroit-pistons/o-3547+t-47705116+z-92029-2092700075?pageSize=72&pageNumber=",
  #             "26": "https://www.lids.com/nba-golden-state-warriors/o-2481+t-14699552+z-96875-4006188394?pageSize=72&pageNumber=",
  #             "17": "https://www.lids.com/nba-houston-rockets/o-4614+t-81588486+z-99473-4231562024?pageSize=72&pageNumber=",
  #             "9": "https://www.lids.com/nba-indiana-pacers/o-2458+t-92146265+z-98839-1905179705?pageSize=72&pageNumber=",
  #             "27": "https://www.lids.com/nba-la-clippers/o-6869+t-69369678+z-8208-4048299098?pageSize=72&pageNumber=",
  #             "28": "https://www.lids.com/nba-los-angeles-lakers/o-7936+t-58368591+z-8297-1132464865?pageSize=72&pageNumber=",
  #             "18": "https://www.lids.com/nba-memphis-grizzlies/o-2469+t-92709636+z-96246-3283194474?pageSize=72&pageNumber=",
  #             "13": "https://www.lids.com/nba-miami-heat/o-1381+t-70814137+z-93939-1789264869?pageSize=72&pageNumber=",
  #             "10": "https://www.lids.com/nba-milwaukee-bucks/o-2481+t-36149627+z-96866-3406917104?pageSize=72&pageNumber=",
  #             "22": "https://www.lids.com/nba-minnesota-timberwolves/o-4614+t-58256351+z-97942-4079700343?pageSize=72&pageNumber=",
  #             "19": "https://www.lids.com/nba-new-orleans-pelicans/o-1347+t-58704174+z-92431-269462119?pageSize=72&pageNumber=",
  #             "3": "https://www.lids.com/nba-new-york-knicks/o-3525+t-47366386+z-96537-3858685569?pageSize=72&pageNumber=",
  #             "23": "https://www.lids.com/nba-oklahoma-city-thunder/o-3536+t-81817432+z-97947-4212551096?pageSize=72&pageNumber=",
  #             "14": "https://www.lids.com/nba-orlando-magic/o-3581+t-14250855+z-98827-1195550213?pageSize=72&pageNumber=",
  #             "4": "https://www.lids.com/nba-philadelphia-76ers/o-1358+t-92585323+z-96452-3140600193?pageSize=72&pageNumber=",
  #             "29": "https://www.lids.com/nba-phoenix-suns/o-4603+t-81818624+z-96653-233883918?pageSize=72&pageNumber=",
  #             "24": "https://www.lids.com/nba-portland-trail-blazers/o-3592+t-25363192+z-94828-550147839?pageSize=72&pageNumber=",
  #             "30": "https://www.lids.com/nba-sacramento-kings/o-7969+t-70474271+z-790-2908558801?pageSize=72&pageNumber=",
  #             "20": "https://www.lids.com/nba-san-antonio-spurs/o-4614+t-47813138+z-8930-196576080?pageSize=72&pageNumber=",
  #             "5": "https://www.lids.com/nba-toronto-raptors/o-1347+t-25360839+z-98845-2874563825?pageSize=72&pageNumber=",
  #             "25": "https://www.lids.com/nba-utah-jazz/o-2414+t-58580874+z-91618-3977262962?pageSize=72&pageNumber=",
  #             "15": "https://www.lids.com/nba-washington-wizards/o-3503+t-25923131+z-98939-2702724964?pageSize=72&pageNumber=",
  #           }
  # Item.where(ecsite_id:15).update(delete_flg:1)
  # team_url.each_with_index do |(key,val),i|
  #   pageNumber = 0
  #   roop_flg = true
  #   while roop_flg == true do
  #     begin
  #       pageNumber += 1
  #       nexturl = val+pageNumber.to_s+"&sortOption=TopSellers"
  #       agent = Mechanize.new
  #       page = agent.get(nexturl)
  #       element = page.search('.pagination-list-container li')
  #       team_key = key
  #       if element[element.size()-1].get_attribute(:class) == "next-page disabled" then
  #         roop_flg = false
  #       else
  #         elementsiteurl = page.search('.product-image-container a')
  #         elementprice = page.search('.column .price-tag:first-child')
  #         elementimage = page.search('.product-image-container img')
  #         elementname = page.search('.product-card-title a')
  #         elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #           puts nexturl
  #           unless Item.where(siteurl:"https://www.lids.com/"+elesiteurl.get_attribute(:href)).exists?
  #             Item.create(
  #               name:elename.inner_text,
  #               siteurl:"https://www.lids.com/"+elesiteurl.get_attribute(:href),
  #               price:eleprice.inner_text.gsub("Sale:","").gsub("$","").to_i * doll_element,
  #               team_id:team_key.to_s ,ecsite_id:15,
  #               imageurl:"http:"+eleimage.get_attribute(:src)
  #             )
  #           else
  #             Item.find_by(siteurl:"https://www.lids.com/"+elesiteurl.get_attribute(:href),ecsite_id:15).update(delete_flg:0)
  #           end
  #         end
  #       end
  #     rescue Timeout::Error
  #       puts "  caught Timeout::Error !"
  #       false
  #       next
  #     rescue Mechanize::ResponseCodeError => e
  #       case e.response_code
  #       when "404"
  #         puts "  caught Net::HTTPNotFound !"
  #         false
  #         next # ページが見付からないときは次へ
  #       when "502"
  #         puts "  caught Net::HTTPBadGateway !"
  #         false
  #         next # 上手くアクセスできないときはもう1回！
  #       else
  #         puts "  caught Excepcion !" + e.response_code
  #         false
  #         next
  #       end
  #     end
  #   end
  # end
  # Item.where(ecsite_id:15,delete_flg:1).destroy_all

  ## SLAM商品登録・更新
  # Item.where(ecsite_id:12).update(delete_flg:1)
  # pageNumber = 0
  # while true do
  #   begin
  #     pageNumber += 1
  #     nexturl = "http://www.slamjapan.com/fs/main/GoodsSearchList.html?keyword=nba&pageno="+pageNumber.to_s
  #     agent = Mechanize.new
  #     page = agent.get(nexturl)
  #     element = page.search('.FS2_pager_link_next')
  #     if element.size() == 0 then
  #       break
  #     else
  #       elementsiteurl = page.search('.FS2_thumbnail_container a')
  #       elementprice = page.search('.FS2_itemPrice_addition')
  #       elementimage = page.search('.FS2_thumbnail_container img')
  #       elementname = page.search('.itemGroup a')
  #       elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #         puts nexturl
  #         unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #           Item.create(name:elename.inner_text,
  #           siteurl:elesiteurl.get_attribute(:href),
  #           price:eleprice.inner_text.gsub("(消費税込:","").gsub(",","").gsub("円)",""),
  #           ecsite_id:12,
  #           imageurl:"http://www.slamjapan.com"+eleimage.get_attribute(:src))
  #         else
  #           Item.find_by(siteurl:elesiteurl.get_attribute(:href),ecsite_id:8).update(delete_flg:0)
  #         end
  #       end
  #     end
  #   rescue Timeout::Error
  #     puts "  caught Timeout::Error !"
  #     false
  #     next
  #   rescue Mechanize::ResponseCodeError => e
  #     case e.response_code
  #     when "404"
  #       puts "  caught Net::HTTPNotFound !"
  #       false
  #       next # ページが見付からないときは次へ
  #     when "502"
  #       puts "  caught Net::HTTPBadGateway !"
  #       false
  #       next # 上手くアクセスできないときはもう1回！
  #     else
  #       puts "  caught Excepcion !" + e.response_code
  #       false
  #       next
  #     end
  #   end
  # end
  # Item.where(ecsite_id:12,delete_flg:1).destroy_all

  ## Rakuten商品登録・更新
  # Item.where(ecsite_id:5).update(delete_flg:1)
  # pageNumber = 0
  # while true do
  #   begin
  #     pageNumber += 1
  #     nexturl = "https://search.rakuten.co.jp/search/mall/nba/?p="+pageNumber.to_s
  #     agent = Mechanize.new
  #     page = agent.get(nexturl)
  #     element = page.search('.item.-next.nextPage')
  #     if element.size() == 0 then
  #       break
  #     else
  #       elementsiteurl = page.search('.image a')
  #       elementprice = page.search('.content.description.price .important')
  #       elementimage = page.search('.image img')
  #       elementname = page.search('.content.title a')
  #       elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #         puts nexturl
  #         unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #           Item.create(name:elename.inner_text,
  #           siteurl:elesiteurl.get_attribute(:href),
  #           price:eleprice.inner_text.gsub(",","").gsub("円",""),
  #           ecsite_id:5,
  #           imageurl:eleimage.get_attribute(:src))
  #         else
  #           Item.find_by(siteurl:elesiteurl.get_attribute(:href),ecsite_id:5).update(delete_flg:0)
  #         end
  #       end
  #     end
  #   rescue Timeout::Error
  #     puts "  caught Timeout::Error !"
  #     false
  #     next
  #   rescue Mechanize::ResponseCodeError => e
  #     case e.response_code
  #     when "404"
  #       puts "  caught Net::HTTPNotFound !"
  #       false
  #       next # ページが見付からないときは次へ
  #     when "502"
  #       puts "  caught Net::HTTPBadGateway !"
  #       false
  #       next # 上手くアクセスできないときはもう1回！
  #     else
  #       puts "  caught Excepcion !" + e.response_code
  #       false
  #       next
  #     end
  #   end
  # end
  # Item.where(ecsite_id:5,delete_flg:1).destroy_all

  ## SELECTION商品登録・更新
  # team_url ={ 
  #           "11": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Atlanta+Hawks&page=",
  #             "1": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Boston+Celtics,BostonCeltics&page=",
  #             "2": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Brooklyn+Nets,New+Jersey+Nets,New+York+Nets&page=",
  #             "12": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Charlotte+Hornets,New+Orleans+Hornets,Charlotte+Bobcats&page=",
  #             "6": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Chicago+Bulls&page=",
  #             "7": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Cleveland+Cavaliers&page=",
  #             "16": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Dallas+Mavericks&page=",
  #             "21": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Denver+Nuggets&page=",
  #             "8": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Detroit+Pistons&page=",
  #             "26": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Golden+State+Warriors&page=",
  #             "17": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Houston+Rockets&page=",
  #             "9": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Indiana+Pacers&page=",
  #             "27": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Los+Angeles+Clippers,San+Diego+Clippers&page=",
  #             "28": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Los+Angeles+Lakers&page=",
  #             "18": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Memphis+Grizzlies,Vancouver+Grizzlies&page=",
  #             "13": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Miami+Heat&page=",
  #             "10": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Milwaukee+Bucks&page=",
  #             "22": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Minnesota+Timberwolves&page=",
  #             "19": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=New+Orleans+Pelicans,New+Orleans+Pericans&page=",
  #             "3": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=New+York+Knicks&page=",
  #             "23": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Oklahoma+City+Thunder&page=",
  #             "14": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Orlando+Magic&page=",
  #             "4": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Philadelphia+76ers&page=",
  #             "29": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Phoenix+Suns&page=",
  #             "24": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Portland+Trail+Blazers&page=",
  #             "30": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Sacramento+Kings&page=",
  #             "20": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=San+Antonio+Spurs&page=",
  #             "5": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Toronto+Raptors&page=",
  #             "25": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Utah+Jazz,New+Orleans+Jazz&page=",
  #             "15": "https://www.selection-j.com/lib/zaiko/search.php?f1=item_category&k1=NBA&f2=z_team&k2=Washington+Wizards,Washington+Bullets&page=",
  #           }
  # Item.where(ecsite_id:9).update(delete_flg:1)
  # team_url.each_with_index do |(key,val),i|
  #   pageNumber = 0
  #   roop_flg = true
  #   while roop_flg == true do
  #     begin
  #       pageNumber += 1
  #       nexturl = val+pageNumber.to_s
  #       agent = Mechanize.new
  #       page = agent.get(nexturl)
  #       element = page.search('.ks-items__entry-list__column')
  #       team_key = key
  #       if element.size() == 0 then
  #         roop_flg = false
  #       else
  #         elementsiteurl = page.search('.ks-items__entry-list__itematt a')
  #         elementprice = page.search('.ks-items__entry-list__itemprice .now')
  #         elementimage = page.search('.ks-items__entry-list__itemimage img')
  #         elementname = page.search('.ks-items__entry-list__catch')
  #         eq1 = elementsiteurl.size()
  #         eq2 = elementprice.size()
  #         eq3 = elementimage.size()
  #         eq4 = elementname.size()
  #         if eq1==eq2 && eq1==eq3 && eq1==eq4 && eq2==eq3 && eq2==eq4 && eq3==eq4 then
  #           elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #             puts nexturl
  #             unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #               Item.create(
  #               name:elename.inner_text,
  #               siteurl:elesiteurl.get_attribute(:href),
  #               price:eleprice.inner_text.gsub(",","").gsub("円(税込)",""),
  #               team_id:team_key.to_s ,ecsite_id:9,
  #               imageurl:eleimage.get_attribute(:src))
  #             else
  #               Item.find_by(siteurl:elesiteurl.get_attribute(:href),ecsite_id:9).update(delete_flg:0)
  #             end
  #           end
  #         end
  #       end
  #     rescue Timeout::Error
  #       puts "  caught Timeout::Error !"
  #       false
  #       next
  #     rescue Mechanize::ResponseCodeError => e
  #       case e.response_code
  #       when "404"
  #         puts "  caught Net::HTTPNotFound !"
  #         false
  #         next # ページが見付からないときは次へ
  #       when "502"
  #         puts "  caught Net::HTTPBadGateway !"
  #         false
  #         next # 上手くアクセスできないときはもう1回！
  #       else
  #         puts "  caught Excepcion !" + e.response_code
  #         false
  #         next
  #       end
  #     end
  #   end
  # end
  # Item.where(ecsite_id:9,delete_flg:1).destroy_all
  
  ## XEBIO商品登録・更新
  # Item.where(ecsite_id:23).update(delete_flg:1)
  # pageNumber = 0
  # roop_flg = true
  # while roop_flg == true do
  #   begin
  #     pageNumber += 1
  #     nexturl = "https://ssx.xebio-online.com/ec/srDispCategoryDetail.html?categoryCd=11540000000&filteringKey=2&limit=50&sortKey=1&pageNo="+pageNumber.to_s
  #     agent = Mechanize.new
  #     page = agent.get(nexturl)
  #     element = page.search('.newSch_itemset')
  #     elementsiteurl = page.search('.newSch_itemset.cf')
  #     elementprice = page.search('.newSch_itemPrice span')
  #     elementimage = page.search('#pruductImg')
  #     elementname = page.search('#pruductImg')
  #     elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #       puts nexturl
  #       unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #         Item.create(name:elename.get_attribute(:alt),
  #         siteurl:"https://ssx.xebio-online.com"+elesiteurl.get_attribute(:href),
  #         price:eleprice.inner_text.gsub("¥","").gsub(",","").strip!,
  #         ecsite_id:23,
  #         imageurl:"https://ssx.xebio-online.com"+eleimage.get_attribute(:src))
  #       else
  #         Item.find_by(siteurl:"https://ssx.xebio-online.com"+elesiteurl.get_attribute(:href),ecsite_id:23).update(delete_flg:0)
  #       end
  #     end
  #     if roop_flg == true && element.size() < 100 then
  #       roop_flg = false
  #     end
  #   rescue Timeout::Error
  #     puts "  caught Timeout::Error !"
  #     false
  #     next
  #   rescue Mechanize::ResponseCodeError => e
  #     case e.response_code
  #     when "404"
  #       puts "  caught Net::HTTPNotFound !"
  #       false
  #       next # ページが見付からないときは次へ
  #     when "502"
  #       puts "  caught Net::HTTPBadGateway !"
  #       false
  #       next # 上手くアクセスできないときはもう1回！
  #     else
  #       puts "  caught Excepcion !" + e.response_code
  #       false
  #       next
  #     end
  #   end
  # end
  # Item.where(ecsite_id:23,delete_flg:1).destroy_all

  ## SPALDING商品登録・更新
  # Item.where(ecsite_id:24).update(delete_flg:1)
  # pageNumber = 0
  # roop_flg = true
  # while roop_flg == true do
  #   begin
  #     pageNumber += 1
  #     nexturl = "https://www.spalding.co.jp/shop/shopbrand.html?page="+pageNumber.to_s+"&search=&sort=&money1=&money2=&prize1=&company1=&content1=&originalcode1=&category=&subcategory="
  #     agent = Mechanize.new
  #     page = agent.get(nexturl)
  #     element = page.search('.imgWrap')
  #     elementsiteurl = page.search('.imgWrap a')
  #     elementprice = page.search('.detail .price')
  #     elementimage = page.search('.imgWrap img')
  #     elementname = page.search('.detail .name a')
  #     elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #       puts nexturl
  #       unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #         Item.create(name:elename.inner_text,
  #         siteurl:"https://www.spalding.co.jp"+elesiteurl.get_attribute(:href),
  #         price:eleprice.inner_text.gsub(",","").gsub("円",""),
  #         ecsite_id:24,
  #         imageurl:eleimage.get_attribute(:src))
  #       else
  #         Item.find_by(siteurl:"https://www.spalding.co.jp"+elesiteurl.get_attribute(:href),ecsite_id:24).update(delete_flg:0)
  #       end
  #     end
  #     if roop_flg == true && element.size() < 50 then
  #       roop_flg = false
  #     end
  #   rescue Timeout::Error
  #     puts "  caught Timeout::Error !"
  #     false
  #     next
  #   rescue Mechanize::ResponseCodeError => e
  #     case e.response_code
  #     when "404"
  #       puts "  caught Net::HTTPNotFound !"
  #       false
  #       next # ページが見付からないときは次へ
  #     when "502"
  #       puts "  caught Net::HTTPBadGateway !"
  #       false
  #       next # 上手くアクセスできないときはもう1回！
  #     else
  #       puts "  caught Excepcion !" + e.response_code
  #       false
  #       next
  #     end
  #   end
  # end
  # Item.where(ecsite_id:24,delete_flg:1).destroy_all

  ## SPORTEC商品登録・更新
  # search_genre = [
  #   "https://shop.sportec.jp/?mode=cate&cbid=2533877&csid=0&sort=n&page=",
  #   "https://shop.sportec.jp/?mode=cate&cbid=2533878&csid=0&sort=n&page=",
  #   "https://shop.sportec.jp/?mode=cate&cbid=2533879&csid=0&sort=n&page="
  # ]
  # Item.where(ecsite_id:25).update(delete_flg:1)
  # search_genre.each do |url|
  # root_page = 0
  #   while true do
  #     begin
  #       root_page += 1
  #       nexturl = url+root_page.to_s
  #       agent = Mechanize.new
  #       page = agent.get(nexturl)
  #       element = page.search('.col.col-sm-4.col-lg-4.productlist_list')
  #       if element.size() == 0 then
  #         break
  #       else
  #         elementsiteurl = page.search('.col.col-sm-4.col-lg-4.productlist_list a:first-of-type')
  #         elementprice = page.search('.col.col-sm-4.col-lg-4.productlist_list .item_price.show')
  #         elementimage = page.search('.col.col-sm-4.col-lg-4.productlist_list img')
  #         elementname = page.search('.col.col-sm-4.col-lg-4.productlist_list .item_name.show')
  #         eq1 = elementsiteurl.size()
  #         eq2 = elementprice.size()
  #         eq3 = elementimage.size()
  #         eq4 = elementname.size()
  #         if eq1==eq2 && eq1==eq3 && eq1==eq4 && eq2==eq3 && eq2==eq4 && eq3==eq4 then
  #           elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #             puts nexturl
  #             unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists? then
  #               Item.create(
  #                 name:elename.inner_text,
  #                 siteurl:"https://shop.sportec.jp/"+elesiteurl.get_attribute(:href),
  #                 price:eleprice.inner_text.gsub(",","").gsub("円(内税)",""),
  #                 ecsite_id:25,
  #                 imageurl:eleimage.get_attribute(:src)
  #               )
  #             else
  #               Item.find_by(siteurl:"https://shop.sportec.jp/"+elesiteurl.get_attribute(:href),ecsite_id:25).update(delete_flg:0)
  #             end
  #           end
  #         end
  #       end
  #     rescue Timeout::Error
  #       puts "  caught Timeout::Error !"
  #       false
  #       next
  #     rescue Mechanize::ResponseCodeError => e
  #       case e.response_code
  #       when "404"
  #         puts "  caught Net::HTTPNotFound !"
  #         false
  #         next # ページが見付からないときは次へ
  #       when "502"
  #         puts "  caught Net::HTTPBadGateway !"
  #         false
  #         next # 上手くアクセスできないときはもう1回！
  #       else
  #         puts "  caught Excepcion !" + e.response_code
  #         false
  #         next
  #       end
  #     end
  #   end
  # end
  # Item.where(ecsite_id:25,delete_flg:1).destroy_all

  ## WSS商品登録・更新
  # Item.where(ecsite_id:28).update(delete_flg:1)
  # pageNumber = 0
  # while true do
  #   begin
  #     pageNumber += 1
  #     nexturl = "https://www.wssmainshop.jp/SHOP/list.php?Search=NBA&Type=01&PAGE="+pageNumber.to_s
  #     agent = Mechanize.new
  #     page = agent.get(nexturl)
  #     element = page.search('.auto.itemList .layout1')
  #     if element.size() == 0 then
  #       break
  #     else
  #       elementsiteurl = page.search('.auto.itemList .item a')
  #       elementprice = page.search('.auto.itemList .price span:first-of-type')
  #       elementimage = page.search('.auto.itemList .item a img')
  #       elementname = page.search('.auto.itemList .goods a')
  #       elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #         puts nexturl
  #         unless Item.where(siteurl:elesiteurl.get_attribute(:href)).exists?
  #           Item.create(
  #           name:elename.inner_text,
  #           siteurl:"https://www.wssmainshop.jp"+elesiteurl.get_attribute(:href),
  #           price:eleprice.inner_text.gsub(",","").strip!,
  #           ecsite_id:28,
  #           imageurl:eleimage.get_attribute(:src))
  #         else
  #           Item.find_by(
  #             siteurl:"https://www.wssmainshop.jp"+elesiteurl.get_attribute(:href),
  #             ecsite_id:28
  #           ).update(delete_flg:0)
  #         end
  #       end
  #     end
  #   rescue Timeout::Error
  #     puts "  caught Timeout::Error !"
  #     false
  #     next
  #   rescue Mechanize::ResponseCodeError => e
  #     case e.response_code
  #     when "404"
  #       puts "  caught Net::HTTPNotFound !"
  #       false
  #       next # ページが見付からないときは次へ
  #     when "502"
  #       puts "  caught Net::HTTPBadGateway !"
  #       false
  #       next # 上手くアクセスできないときはもう1回！
  #     else
  #       puts "  caught Excepcion !" + e.response_code
  #       false
  #       next
  #     end
  #   end
  # end
  # Item.where(ecsite_id:28,delete_flg:1).destroy_all

  ## Yahoo!ショッピング商品登録・更新
  # search_genre = [
  #   "https://shopping.yahoo.co.jp/search?p=nba&first=1&tab_ex=commerce&sc_i=shp_pc_top_searchBox_2&ts=1576332815&mcr=a7edc6541d87a98527e575902d54ca16&sretry=1&fr=shp-prop&area=13&b=",
  #   "https://shopping.yahoo.co.jp/search?X=5&p=nba+%E3%82%B0%E3%83%83%E3%82%BA&tab_ex=commerce&rs=1&sc_i=shp_pc_search_SearchKeyword_1&utype=rel&b=",
  #   "https://shopping.yahoo.co.jp/search?X=2&p=nba&ss_first=1&tab_ex=commerce&sc_i=shp_pc_search_sort_sortitem&area=13&b=",
  #   "https://shopping.yahoo.co.jp/search?X=3&p=nba&ss_first=1&tab_ex=commerce&sc_i=shp_pc_search_sort_sortitem&area=13&b=",
  #   "https://shopping.yahoo.co.jp/search?X=8&p=nba&ss_first=1&tab_ex=commerce&sc_i=shp_pc_search_sort_sortitem&area=13&b=",
  #   "https://shopping.yahoo.co.jp/search?X=9&p=nba&ss_first=1&tab_ex=commerce&sc_i=shp_pc_search_sort_sortitem&area=13&b=",
  #   "https://shopping.yahoo.co.jp/search?X=10&p=nba&ss_first=1&tab_ex=commerce&sc_i=shp_pc_search_sort_sortitem&area=13&b="
  # ]
  # Item.where(ecsite_id:7).update(delete_flg:1)
  # search_genre.each_with_index do |url,count|
  #   pageNumber = 1
  #   while true do
  #     begin
  #       nexturl = url+pageNumber.to_s
  #       pageNumber += 30
  #       agent = Mechanize.new
  #       page = agent.get(nexturl)
  #       element = page.search('.LoopList__item')
  #       if pageNumber > 1470 || element.size() == 0 then
  #         break
  #       else
  #         elementsiteurl = page.search('.LoopList__item ._2Jq8OcJm3FsK a')
  #         elementprice = page.search('.LoopList__item ._3-CgJZLU91dR')
  #         elementimage = page.search('.LoopList__item ._2Jq8OcJm3FsK a img:nth-of-type(1)')
  #         for num in 0..elementimage.size() do
  #           if elementimage[num].to_s.include?(".gif")
  #             elementimage.delete(elementimage[num])
  #           end
  #         end
  #         elementname = elementimage
  #         len1 = elementsiteurl.size()
  #         len2 = elementprice.size()
  #         len3 = elementimage.size()
  #         len4 = elementname.size()
  #         if len1==len2 && len1==len3 && len1==len4 && len2==len3 && len2==len4 && len3==len4 then
  #           elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #             puts count.to_s+":"+(pageNumber-30).to_s
  #             unless Item.where(name:elename.get_attribute(:alt),ecsite_id:7).exists?
  #               Item.create(
  #               name:elename.get_attribute(:alt),
  #               siteurl:elesiteurl.get_attribute(:href),
  #               price:eleprice.inner_text.gsub(",",""),
  #               ecsite_id:7,
  #               imageurl:eleimage.get_attribute(:src))
  #             else
  #               Item.find_by(
  #                 name:elename.get_attribute(:alt),
  #                 ecsite_id:7
  #               ).update(delete_flg:0)
  #             end
  #           end
  #         end
  #       end
  #     rescue Timeout::Error
  #       puts "  caught Timeout::Error !"
  #       false
  #       next
  #     rescue Mechanize::ResponseCodeError => e
  #       case e.response_code
  #       when "404"
  #         puts "  caught Net::HTTPNotFound !"
  #         false
  #         next # ページが見付からないときは次へ
  #       when "502"
  #         puts "  caught Net::HTTPBadGateway !"
  #         false
  #         next # 上手くアクセスできないときはもう1回！
  #       else
  #         puts "  caught Excepcion !" + e.response_code
  #         false
  #         next
  #       end
  #     end
  #   end
  # end
  # Item.where(ecsite_id:7,delete_flg:1).destroy_all

  ## NBA Store商品登録・更新
  # 手順
  # siteurlよりiMacroで全商品表示状態にする
  # XHR内DoSearchのResponse情報をコピーし上部にペースト(変数名はitems[動的に1~])
  # 以下、コードを実行
  # count = 1
  # Item.where(ecsite_id:14).update(delete_flg:1)
  # while true do
  #   item = eval("items#{count}[:Products]")
  #   if item.size() == 0 then
  #     break
  #   else
  #     for num in 0...item.size() do
  #       unless Item.where(siteurl:"https://www.nbastore.jp/"+item[num][:Url]).exists?
  #         puts count
  #         Item.create(
  #           name:item[num][:FullName],
  #           siteurl:"https://www.nbastore.jp/"+item[num][:Url],
  #           price:item[num][:Price].gsub(",","").gsub("¥",""),
  #           ecsite_id:14,
  #           imageurl:"https:"+item[num][:ImageUrl]
  #         )
  #       else
  #         Item.find_by(
  #           siteurl:"https://www.nbastore.jp/"+item[num][:Url],
  #           ecsite_id:14
  #         ).update(delete_flg:0)
  #       end
  #     end
  #   end
  #   count += 1
  # end
  # Item.where(ecsite_id:14,delete_flg:1).destroy_all

  ## Fanatics商品登録・更新
  # search_genre = [
  #     "https://www.fanatics.com/nba/o-1370+z-938737729-293541727?pageSize=96&pageNumber=",
  #     "https://www.fanatics.com/nba/o-1370+z-938737729-293541727?pageSize=96&pageNumber=",
  #     "https://www.fanatics.com/nba/o-1370+z-938737729-293541727?pageSize=96&pageNumber=",
  #     "https://www.fanatics.com/nba/o-1370+z-938737729-293541727?pageSize=96&pageNumber="
  #   ]
  # Item.where(ecsite_id:13).update(delete_flg:1)
  # search_genre.each_with_index do |url,count|
  #   count += 2
  #   page_number = 1
  #   while true do
  #     begin
  #       nexturl = url+page_number.to_s+"&sortOption=TopSellers&p2="+count.to_s
  #       agent = Mechanize.new
  #       page = agent.get(nexturl)
  #       element = page.search('[data-talos="itemCount"]')
  #       now_count = element[0].inner_text.gsub(" ","").gsub(/.*-/,"").gsub(/of.*/,"")
  #       last_count = element[0].inner_text.gsub(" ","").gsub(/.*of/,"")
  #       elementsiteurl = page.search('.column .product-image-container a')
  #       elementprice = page.search('.column .price-tag')
  #       elementimage = page.search('.column .product-image-container a img')
  #       elementname = page.search('.product-card-title a')
  #       len1 = elementsiteurl.size()
  #       len2 = elementprice.size()
  #       len3 = elementimage.size()
  #       len4 = elementname.size()
  #       if len1==len2 && len1==len3 && len1==len4 && len2==len3 && len2==len4 && len3==len4 then
  #         elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #           puts count.to_s+":"+page_number.to_s
  #           price = eleprice.inner_text.gsub(/[a-z]*/,"").gsub(/[A-Z]*/,"").gsub(" ","").gsub(":",",").gsub("$","").split(",")
  #           if price.size() >= 3 then
  #             price.delete("")
  #             price.delete(price.min{|a, b| a.to_i <=> b.to_i })
  #             price.delete(price.max{|a, b| a.to_i <=> b.to_i })
  #             price = price[0]
  #           elsif price.size() == 2 then
  #             price.delete("")
  #             price = price.min{|a, b| a.to_i <=> b.to_i }
  #           elsif price.size() == 1 then
  #             price.delete("")
  #             price = price[0]
  #           end
  #           unless Item.where(siteurl:"https://www.fanatics.com"+elesiteurl.get_attribute(:href),ecsite_id:13).exists?
  #             Item.create(
  #               name:elename.inner_text,
  #               siteurl:"https://www.fanatics.com"+elesiteurl.get_attribute(:href),
  #               price: price.to_i * doll_element,
  #               ecsite_id:13,
  #               imageurl:"https:"+eleimage.get_attribute(:src)
  #             )
  #           else
  #             Item.find_by(
  #               siteurl:"https://www.fanatics.com"+elesiteurl.get_attribute(:href),
  #               ecsite_id:13
  #             ).update(delete_flg:0)
  #           end
  #         end
  #       end
  #       page_number += 1
  #       if now_count == last_count then
  #         break
  #       end
  #     rescue Timeout::Error
  #       puts "  caught Timeout::Error !"
  #       false
  #       next
  #     rescue Mechanize::ResponseCodeError => e
  #       case e.response_code
  #       when "404"
  #         puts "  caught Net::HTTPNotFound !"
  #         false
  #         next # ページが見付からないときは次へ
  #       when "502"
  #         puts "  caught Net::HTTPBadGateway !"
  #         false
  #         next # 上手くアクセスできないときはもう1回！
  #       else
  #         puts "  caught Excepcion !" + e.response_code
  #         false
  #         next
  #       end
  #     end
  #   end
  # end
  # Item.where(ecsite_id:13,delete_flg:1).destroy_all

  ## Zalando商品登録・更新
  # search_genre = [
  #     "https://en.zalando.de/women/?q=nba&p=",
  #     "https://en.zalando.de/men/?q=nba&p=",
  #     "https://en.zalando.de/kids/?q=nba&p="
  #   ]
  # Item.where(ecsite_id:39).update(delete_flg:1)
  # search_genre.each_with_index do |url,count|
  #   page_number = 1
  #   while true do
  #     begin
  #     urls = url+page_number.to_s
  #     charset = nil
  #     html = open(urls) do |f|
  #       charset = f.charset # 文字種別を取得
  #       f.read              # htmlを読み込んで変数htmlに渡す
  #     end
  #     doc = Nokogiri::HTML.parse(html, nil, charset)
  #     element = doc.at_css('.cat_item-25ZBj:nth-of-type(3) a')
  #     elementsiteurl = doc.css('.cat_imageLink-OPGGa')
  #     elementprice = doc.css('.cat_originalPrice-2Oy4G')
  #     elementimage = doc.css('.cat_imageCnt-2orIb img')
  #     elementname = doc.css('.cat_articleName--arFp.cat_ellipsis-MujnT')
  #     len1 = elementsiteurl.size()
  #     len2 = elementprice.size()
  #     len3 = elementimage.size()
  #     len4 = elementname.size()
  #     puts len1.to_s+":"+len2.to_s+":"+len3.to_s+":"+len4.to_s
  #     if len1==len2 && len1==len3 && len1==len4 && len2==len3 && len2==len4 && len3==len4 then
  #       elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #         puts count.to_s+":"+page_number.to_s
  #         unless Item.where(siteurl:"https://en.zalando.de"+elesiteurl.get_attribute(:href),ecsite_id:39).exists?
  #           Item.create(
  #             name:elename.inner_text,
  #             siteurl:"https://en.zalando.de"+elesiteurl.get_attribute(:href),
  #             price: eleprice.inner_text.gsub(",",".").gsub(" €","").to_i * eu_element,
  #             ecsite_id:39,
  #             imageurl:eleimage.get_attribute(:src)
  #           )
  #         else
  #           Item.find_by(
  #             siteurl:"https://en.zalando.de"+elesiteurl.get_attribute(:href),
  #             ecsite_id:39
  #           ).update(
  #             price: eleprice.inner_text.gsub(",",".").gsub(" €","").to_i * eu_element,
  #             delete_flg:0
  #           )
  #         end
  #       end
  #     end
  #     page_number += 1
  #     if element[:href] == "" then
  #       break
  #     end
  #     rescue Timeout::Error
  #       puts "  caught Timeout::Error !"
  #       false
  #       next
  #     rescue Mechanize::ResponseCodeError => e
  #       case e.response_code
  #       when "404"
  #         puts "  caught Net::HTTPNotFound !"
  #         false
  #         next # ページが見付からないときは次へ
  #       when "502"
  #         puts "  caught Net::HTTPBadGateway !"
  #         false
  #         next # 上手くアクセスできないときはもう1回！
  #       else
  #         puts "  caught Excepcion !" + e.response_code
  #         false
  #         next
  #       end
  #     end
  #   end
  # end

  ## KICKZ.COM商品登録・更新
  # Item.where(ecsite_id:45).update(delete_flg:1)
  # url = "https://www.kickz.com/en/catalog/fullTextSearch?initialQueryString=nba&selectedPage="
  # page_number = 1
  # while true do
  #   begin
  #   urls = url+page_number.to_s
  #   page_number += 1
  #   charset = nil
  #   html = open(urls) do |f|
  #     charset = f.charset # 文字種別を取得
  #     f.read              # htmlを読み込んで変数htmlに渡す
  #   end
  #   doc = Nokogiri::HTML.parse(html, nil, charset)
  #   element = doc.css('.detail_link_wrapper')
  #   if element.size() == 0 then
  #     break
  #   end
  #   elementsiteurl = doc.css('.no-h-over')
  #   elementprice = doc.css('.categoryElementPrice .price')
  #   elementimage = doc.css('img.productImage')
  #   elementname = doc.css('.catalogItemName span')
  #   len1 = elementsiteurl.size()
  #   len2 = elementprice.size()
  #   len3 = elementimage.size()
  #   len4 = elementname.size()
  #   puts len1.to_s+":"+len2.to_s+":"+len3.to_s+":"+len4.to_s
  #   if len1==len2 && len1==len3 && len1==len4 && len2==len3 && len2==len4 && len3==len4 then
  #     elementsiteurl.zip(elementprice,elementname,elementimage).each do |elesiteurl, eleprice,elename,eleimage|
  #       puts urls
  #       unless Item.where(siteurl:elesiteurl.get_attribute(:link),ecsite_id:45).exists?
  #         Item.create(
  #           name:elename.inner_text,
  #           siteurl:elesiteurl.get_attribute(:link),
  #           price: eleprice.inner_text.gsub(",",".").gsub(" €","").to_i * eu_element,
  #           ecsite_id:45,
  #           imageurl:eleimage.get_attribute(:src)
  #         )
  #       else
  #         Item.find_by(
  #           siteurl:elesiteurl.get_attribute(:link),
  #           ecsite_id:45
  #         ).update(
  #           price: eleprice.inner_text.gsub(",",".").gsub(" €","").to_i * eu_element,
  #           delete_flg:0
  #         )
  #       end
  #     end
  #   end
  #   rescue Timeout::Error
  #     puts "  caught Timeout::Error !"
  #     false
  #     next
  #   rescue Mechanize::ResponseCodeError => e
  #     case e.response_code
  #     when "404"
  #       puts "  caught Net::HTTPNotFound !"
  #       false
  #       next # ページが見付からないときは次へ
  #     when "502"
  #       puts "  caught Net::HTTPBadGateway !"
  #       false
  #       next # 上手くアクセスできないときはもう1回！
  #     else
  #       puts "  caught Excepcion !" + e.response_code
  #       false
  #       next
  #     end
  #   end
  # end

  ## 既存商品（選手、チームカラム追加）
  # Item.all.each do |item|
  #   Player.all.each do |player|
  #     if item.name.include?(player.name) || (item.name.include?(player.search_keyword.to_s.gsub(/.*・/,"")) && item.name.include?(player.search_keyword.to_s.gsub(/・.*/,"")) && player.search_keyword.to_s != "") then  
  #       item.update(player_id:player.id,team_id:player.team_id)
  #     end
  #   end
  #   Team.all.each do |team|
  #     if (item.name.include?(team.name.gsub(/・.*/,"")) && team.name.gsub(/・.*/,"") != "ロサンゼルス") || (item.name.include?(team.name.gsub(/.*・/,"")) && team.name.gsub(/・.*/,"") != "ロサンゼルス") || item.name.include?(team.en_name) then
  #       item.update(team_id:team.id)
  #     end
  #   end
  #   puts item.id
  # end
  
end
