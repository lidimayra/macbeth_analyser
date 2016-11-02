require 'rspec'
require_relative '../lib/macbeth_analyser'

describe 'Macbeth Analyser' do
  let(:macbeth_analyser) { MacbethAnalyser.new }

  before do
    allow(macbeth_analyser).to receive(:open_file)
      .and_return(Nokogiri::HTML open('spec/dummy_file.xml'))
  end

  context 'when opening Macbeth file' do
    subject { macbeth_analyser.open_file }
    it { is_expected.to be_a Nokogiri::XML::Document }
  end

  context 'when reading speakers' do
    subject(:speakers) { macbeth_analyser.speakers }
    it { is_expected.to eq Set.new ['John Doe', 'Jane Doe', 'Joe Sixpack'] }
  end

  context 'when counting lines per speaker' do
    subject { macbeth_analyser.lines_per speaker }

    context 'for John Doe' do
      let(:speaker) { 'John Doe' }
      it { is_expected.to eq 2 }
    end

    context 'for Jane Doe' do
      let(:speaker) { 'Jane Doe' }
      it { is_expected.to eq 5 }
    end

    context 'for Joe Sixpack' do
      let(:speaker) { 'Joe Sixpack' }
      it { is_expected.to eq 2 }
    end
  end

  context 'when listing every line count per speaker' do
    subject(:lines_per_each_speaker) do
      macbeth_analyser.lines_per_each_speaker
    end

    let(:output_message) do
      "2 John Doe\n5 Jane Doe\n2 Joe Sixpack\n"
    end

    it 'presents line count side by side with speaker name' do
      expect { lines_per_each_speaker }.to output(output_message).to_stdout
    end
  end
end
