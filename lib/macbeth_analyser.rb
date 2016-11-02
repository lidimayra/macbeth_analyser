class MacbethAnalyser

require 'nokogiri'
require 'open-uri'

  def lines_per(speaker)
    speeches = []
    lines = 0

    open_file.css("speech").each do |speech|
      if speech.css('speaker').text == speaker
        lines += speech.css('line').count
      end
    end

    lines
  end

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
