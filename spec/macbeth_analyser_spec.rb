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

  context 'when counting lines per speaker' do
    subject { macbeth_analyser.lines_per speaker }

    context 'for Soldiers' do
      let(:speaker) { 'Soldiers' }
      it { is_expected.to eq 1 }
    end

    context 'for Lord' do
      let(:speaker) { 'Lord' }
      it { is_expected.to eq 21 }
    end

    context 'for Gentlewoman' do
      let(:speaker) { 'Gentlewoman' }
      it { is_expected.to eq 23 }
    end
  end

  context 'when listing every line count per speaker' do
    subject { macbeth_analyser.lines_per_each_speaker }

    let(:output) do
      macbeth_analyser.speakers.each do |speaker|
        "#{macbeth_analyser.lines_per speaker} #{speaker}"
      end
    end

    it { is_expected.to eq output }
  end
end
