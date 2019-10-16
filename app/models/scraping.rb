class Scraping

  # for num in 1..3 do
  #   agent = Mechanize.new
  #   page = agent.get("https://jordan.co.jp/?mode=srh&sort=n&cid=&keyword=")
  #   element = page.search('.imgBox a')
  #   if element.size() > 0 then
  #     puts "存在する"
  #   else
  #     puts "存在しない"
  #   end
  #   puts element.size()
  # end
    
  # puts Item.all.siteurl

  # Item.all.each do |item|
    agent = Mechanize.new
    page = agent.get(Item.find(9).siteurl)
    element = page.search('body')
    element.each do |ele|
      puts ele.get_attribute(:src)
    end
    puts element
    

    # puts item.siteurl
  # end

  
    # element.each_with_index do |ele,i|
    #   Item.create(url:"https://jordan.co.jp/"+ele.get_attribute(:href))
    #   puts "#{i}:https://jordan.co.jp/#{ele.get_attribute(:href)}"
    # end
    
end
