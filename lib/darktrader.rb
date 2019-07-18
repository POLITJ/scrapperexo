#require 'rubygems'
#require 'nokogiri'
#require 'open-uri'
#require 'httparty'
#require 'byebug'

#def scraper
 #   url = "https://coinmarketcap.com/all/views/all/"
  #  unparsed_page = HTTParty.get(url)
   # parsed_page = Nokogiri::HTML(unparsed_page)
    #currency_listings = parsed_page.css("div.odd")
#    currency_listings.each do |currency_listing|
 #       currency = {
  #          name:currency_listing.css("td.text-left").text,
   #         price:currency_listing.css("a.price").text
    #}
#    end
 #   byebug  
#end

require 'open-uri'
require 'nokogiri'
​
def get_symbols
      symbols = []
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  	doc.xpath('//td[3]').each do |node|
  	  symbols << node.text
  	end
    symbols
end
​
def get_prices
      prices = []
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  	doc.xpath('//td[5]/a').each do |node|
  	  prices << node.text
  	end
    prices
end

                                                  
​
def combine
​
  myhash = Hash[get_symbols.zip get_prices]
​
  Hash.class_eval do
    def split_into(divisions)
      count = 0
      inject([]) do |final, key_value|
        final[count%divisions] ||= {}
        final[count%divisions].merge!({key_value[0] => key_value[1]})
        count += 1
        final
      end
    end
  end
    a = [myhash.split_into(get_symbols.size)]
    puts a
end
​
combine