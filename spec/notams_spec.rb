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

    it "should process params" do
      "lqsa".notams(:objects => false).should eq("lqsa".notams)
      "lqsa".notams(:objects => false).should_not eq("lqsa".notams(:objects => true))
    end

    it "should return objects when argument is set" do
      icao = "lqsa"
      icao.notams(:objects => true).class.should eq(Array)
      Notams::NotamFetcher.new(icao, :objects => true).obj_list.should eq(true)
      Notams::NotamFetcher.new(icao, :objects => true).notams.should_not eq(Notams::NotamFetcher.new(icao, :objects => true).string_notams)
      icao.notams(:objects => true).first.class.should_not eq(String)
      icao.notams(:objects => true).first.class.should eq(Notams::Notam)
    end

    it "should properly return the notam object message" do
      icao = "lqsa"
      Notams::NotamFetcher.new(icao, :objects => true).fetch.first.message.should eq(icao.notams(:objects => true).first.message)
      icao.notams(:objects => true).first.message.class.should eq(String)
      # "lqsb".notams(:objects => true).first.message.should eq("moo")
    end

    it "should properly return the notam object icao" do
      icao = "lqsa"
      Notams::NotamFetcher.new(icao, :objects => true).fetch.first.icao.should eq(icao.notams(:objects => true).first.icao)
      icao.notams(:objects => true).first.icao.class.should eq(String)
      icao.notams(:objects => true).first.icao.should eq("LQSA")
      icao.notams(:objects => true).first.icao.should eq(icao.upcase)
      "lqsb".notams(:objects => true).first.icao.should eq("LQSB")
    end


  end

describe Notams::NotamFetcher do

  describe "raw_list" do
    it "should execute open uri request via Nokogiri" do
      icao = "lqsa"
      Notams::NotamFetcher.new(icao).raw_list.class.should eq(Nokogiri::HTML::Document)
      Notams::NotamFetcher.new(icao).raw_list.css("title").text.should eq("PilotWeb: Results Page ")
    end
  end

end


end
