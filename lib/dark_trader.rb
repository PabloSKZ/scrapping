require 'nokogiri'
require 'open-uri'

def crypto_scrapper
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

    tr_nb = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr').to_s.scan(/(<tr)/).count
    crypto_name = []
    crypto_price = []
    (1..tr_nb).each do |i|
        crypto_name << page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div").text
        crypto_price << page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/a").text.delete_prefix('$').delete(',').to_f
    end

    crypto_hash = {}
    crypto_hash_array = []
    crypto_name.each do |i|
        crypto_hash[i] = crypto_price[crypto_name.rindex(i)]
    end


    crypto_hash.each {|k,v| crypto_hash_array << {k => v}} 

    return crypto_hash_array
end


#print crypto_scrapper
