# require 'net/http'
# require 'uri'
# require 'mechanize'

# def url_exist?(uri)
#   agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36"
#   begin
#     url = URI.parse(uri)
#     Net::HTTP.new(url.host).get(url.path, {"User-Agent": agent})
#   rescue
#     return false
#   else
#     return true
#   end
# end

# puts url_exist?("http://blog.nogizaou/?d=2080512")
# puts url_exist?("http://blog.nogizaka46.com/karin.itou/?d=20180000")

# Item.all.each do |item|
#   agent = Mechanize.new
#   # if url_exist?(item.siteurl) then
    
#     page = agent.get(item.siteurl)
#     element = page.search('.carousel.large-pdp-image.transition img')
#     element.each do |ele|
#       puts "https:#{ele.get_attribute(:src)}"
#     end
#   # end
#   # puts element
  

#   # puts item.siteurl
# end



agent = Mechanize.new
Item.all.each do |item|
  begin
    page = agent.get(item.siteurl)
    element = page.search('.carousel.large-pdp-image.transition img')
    element.each do |ele|
      # puts "https:#{ele.get_attribute(:src)}"


      agent = Mechanize.new
      for num in 1..10 do
        begin
          
          # puts "https:#{ele.get_attribute(:src).sub(/alt._/,"alt#{num}_")}"
          page = agent.get("https:#{ele.get_attribute(:src).sub(/alt._/,"alt#{num}_")}")
          puts "item.id:#{item.id}"
          puts "https:#{ele.get_attribute(:src).sub(/alt._/,"alt#{num}_")}"

        rescue Mechanize::ResponseCodeError => e
          puts e.response_code 
          break
        end
      end



    end
  rescue Mechanize::ResponseCodeError => e
    puts e.response_code 
  end
end

