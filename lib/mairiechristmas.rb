require 'open-uri'
require 'nokogiri'

def get_city
    cities = []
    doc = Nokogiri::HTML(open("https://annuaire-des-mairies.com/95/"))
  	doc.xpath('///html[1]/body[1]/pre[1]/a').each do |node|
  	  cities << node.text
  	end
    puts cities
end

def get_city_name
    cities_name = []
    doc = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
  	doc.xpath('//div[1]/main[1]/section[1]/div[1]/div[1]/div[1]/p[1]/strong[1]/a[1]').each do |node|
  	  cities_name << node.text
  	end
    puts cities_name
end

def get_email
      emails = []
    doc = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
  	doc.xpath('//div[1]/main[1]/section[2]/div[1]/table[1]/tbody[1]/tr[4]/td[2]').each do |node|
  	  emails << node.text
  	end
    puts emails
end


get_city
#get_city_name
#get_email
