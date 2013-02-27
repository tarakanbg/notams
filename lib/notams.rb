%w{notams/version notams/notam_fetcher notams/notam}.each { |lib| require lib }

class String
  def notams(args={})
    Notams.notams(self, args)
  end
end

module Notams

  def self.notams(icao, args)
    NotamFetcher.new(icao, args).fetch
  end

end
