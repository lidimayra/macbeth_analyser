class MacbethAnalyser

require 'nokogiri'
require 'open-uri'
require 'set'

  def lines_per_each_speaker
    speakers.each do |speaker|
      puts "#{lines_per speaker} #{speaker}"
    end
  end

  def lines_per(speaker)
    count = 0

    open_file.css('speech').each do |speech|
      speech.css('speaker').each do |speech_speaker|
        count += speech.css('line').count if speech_speaker.text == speaker
      end
    end

    count
  end

  def speakers
    speakers = Set.new

    open_file.css('speaker').each do |speaker|
      speakers.add(speaker.text) unless speaker.text == 'ALL'
    end

    speakers
  end

  def open_file
    url = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'
    @content ||= Nokogiri::HTML open(url)
  end

end
