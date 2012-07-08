require 'notams'

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
    it "should return a valid full url" do
      # icao = "lqsa"
      # icao.notams[0..6].should eq("http://")
    end

    it "should integrate the route correctly in the url" do
      # route = "egll-lowi"
      # route.gcmap.should eq("http://www.gcmap.com/map?P=egll-lowi%0d%0a&MS=wls&MR=120&MX=720x360&PM=b:disc7%2b\"%25U%25+%28N\"")
    end

  end

end

