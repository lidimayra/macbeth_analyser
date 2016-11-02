require 'rspec'
require_relative '../lib/macbeth_analyser'

describe 'Macbeth Analyser' do
  subject(:macbeth_analyser) { MacbethAnalyser.new }

  context 'when opening Macbeth file' do
    subject(:file) { macbeth_analyser.open_file }
    it { is_expected.to be_a Nokogiri::XML::Document }
  end

end
