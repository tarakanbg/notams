require "notams/version"

class String
  def notams(args={})
    Notams.notams(self, args)
  end
end

module Notams
  def self.notams(icao, args)
    NotamFetcher.new(icao, args).fetch
  end

  class NotamFetcher
    require 'nokogiri'
    require 'open-uri'

    attr_accessor :icao, :obj_list, :notams, :string_notams

    def initialize(icao, args = nil)
      @icao = icao
      process_arguments(args) if args.class == Hash
      @notams = []; @string_notams = []
      notams_object_list
      notams_string_list
    end

    def raw_list
      Nokogiri::HTML(open("https://pilotweb.nas.faa.gov/PilotWeb/notamRetrievalByICAOAction.do?method=displayByICAOs&reportType=RAW&formatType=DOMESTIC&retrieveLocId=#{@icao}&actionType=notamRetrievalByICAOs"))
    end

    def fetch
      @obj_list == true ? @notams : @string_notams
    end

    private

    def notams_string_list
      @notams.each {|n| @string_notams << n.to_s}
    end

    def notams_object_list
      raw_list.css("pre").each {|n| @notams << Notam.new(n.text)}
    end

    def process_arguments(args)
      args[:objects] == true ? @obj_list = true : @obj_list = false
    end

  end

  class Notam

    attr_accessor :raw, :message, :icao

    def initialize(text)
      @raw = text
      @message = get_message
      @icao = get_icao
    end

    def to_s
      @raw
    end

    private

    def get_message
      starts = @raw.index('E)') + 3
      @raw.index('F)') ? ends = @raw.index('F)') : ends = @raw.length
      @raw[starts..ends]
    end

    def get_icao
      starts = @raw.index('A)') + 3
      ends = @raw.index('B)') - 2
      @raw[starts..ends]
    end

  end

end
