module Notams

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