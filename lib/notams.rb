require "notams/version"
require 'nokogiri'
require 'open-uri'


class String
  def notams
    Notams.notams(self)
  end
end

module Notams
  def self.notams(icao)
    notams = []
    get_raw_page(icao).css("pre").each {|n| notams << n.text }
    return notams
  end

private

  def self.get_raw_page(icao)
    Nokogiri::HTML(open("https://pilotweb.nas.faa.gov/PilotWeb/notamRetrievalByICAOAction.do?method=displayByICAOs&reportType=RAW&formatType=DOMESTIC&retrieveLocId=#{icao}&actionType=notamRetrievalByICAOs"))
  end

end
