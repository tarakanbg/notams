require 'spec_helper.rb'

describe String do

  describe "input" do
    it "is a string" do
      input = "lqsa"
      input.class.should eq(String)
      input = "lqsa, lqsb"
      input.class.should eq(String)
    end
  end

  describe ".notams" do
    it "should return an array" do
      icao = "lqsa"
      icao.notams.class.should eq(Array)
    end

    it "length should be more than 0" do
      icao = "lqsa"
      icao.notams.length.should be > 0
    end

    it "array should include strings" do
      icao = "lqsa"
      icao.notams.first.class.should eq(String)
    end

    it "string should contain icao" do
      icao = "LQSA"
      icao.notams.first.should include icao
    end

    it "should handle multiple icaos" do
      "lqsa".notams.length.should_not eq("lqsa,lqsb".notams.length)
    end

  end

describe Notams do

  describe "get_raw_page" do
    it "should execute open uri request via Nokogiri" do
      icao = "lqsa"
      Notams.get_raw_page(icao).class.should eq(Nokogiri::HTML::Document)
      Notams.get_raw_page(icao).css("title").text.should eq("PilotWeb: Results Page ")
    end
  end

end


end
