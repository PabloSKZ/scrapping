require_relative "../lib/dark_trader"

describe "the crypto_scrapper method" do
    it "should return an array" do
        expect(crypto_scrapper.class).to eq(Array)
    end
    it "should return an array of hashes" do
        expect(crypto_scrapper[0].class).to eq(Hash)
    end
    it "should be an entry called 'BTC'" do
        expect(crypto_scrapper.any? {|h| h['BTC']}).to eq(true)
    end
    it "should be an entry called 'ETH'" do
        expect(crypto_scrapper.any? {|h| h['ETH']}).to eq(true)
    end
    it "should be more than 20 entries" do
        expect(crypto_scrapper.length > 20).to eq(true)
    end
    it "should return float in values" do
        expect(crypto_scrapper[0].fetch("BTC").class).to eq(Float)
    end
end