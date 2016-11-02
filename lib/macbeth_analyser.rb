class MacbethAnalyser

require 'nokogiri'
require 'open-uri'

  def open_file
    url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
    Nokogiri::HTML open(url)
  end

end
