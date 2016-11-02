require 'rspec'
require_relative '../lib/macbeth_analyser'

describe 'Macbeth Analyser' do
  let(:macbeth_analyser) { MacbethAnalyser.new }

  context 'when opening Macbeth file' do
    subject { macbeth_analyser.open_file }
    it { is_expected.to be_a Nokogiri::XML::Document }
  end

  context 'when reading speakers' do
    subject(:speakers) { macbeth_analyser.speakers }

    it 'returns distinct speakers' do
      expect(speakers.count).to eq 40
    end
  end
end
