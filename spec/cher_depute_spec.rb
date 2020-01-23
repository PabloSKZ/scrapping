require_relative "../lib/cher_depute"

describe "the get_depute_email method" do
    it "should return a string" do
        expect(get_depute_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA1012").class).to eq(String)
    end
    it "should return an email" do
        expect(get_depute_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA1012").include?('@')).to eq(true)
    end
end

describe "the get_depute_urls method" do
    it "should return an array" do
        expect(get_depute_urls.class).to eq(Array)
    end
    it "should return URLs" do
        expect(get_depute_urls[0].include?('http')).to eq(true)
    end
    it "should return more than 3 URLs" do
        expect(get_depute_urls.length > 3).to eq(true)
    end
end