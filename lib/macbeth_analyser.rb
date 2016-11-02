class MacbethAnalyser

require 'nokogiri'
require 'open-uri'

  def speakers
    speakers = Set.new

    open_file.css("speaker").each do |speaker|
      speakers.add(speaker.text) unless speaker.text == 'ALL'
    end

    speakers
  end

  def open_file
    url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
    Nokogiri::HTML open(url)
  end

end
