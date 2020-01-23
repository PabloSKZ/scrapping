require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open(townhall_url))
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    return email
end

def get_townhall_urls
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    urls_array = []
    page.xpath("//*[contains(@class, 'lientxt')]/@href").each do |i|
        urls_array << "http://annuaire-des-mairies.com" + i.to_s.delete_prefix('.')
    end
    return urls_array
end

#get_townhall_urls.each_index {|i| puts get_townhall_email(get_townhall_urls[i])}
