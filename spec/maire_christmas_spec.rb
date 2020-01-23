require_relative "../lib/maire_christmas"

describe "the get_townhall_email method" do
    it "should return a string" do
        expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html").class).to eq(String)
    end
    it "should return an email" do
        expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html").include?('@')).to eq(true)
    end
end

describe "the get_townhall_urls method" do
    it "should return an array" do
        expect(get_townhall_urls.class).to eq(Array)
    end
    it "should return URLs" do
        expect(get_townhall_urls[0].include?('html')).to eq(true)
    end
    it "should return more than 3 URLs" do
        expect(get_townhall_urls.length > 3).to eq(true)
    end
end