# encoding: utf-8

describe Locomotive::Dragonfly::Processors::SmartThumb do

  let(:thumb) { described_class.new }

  describe '#args_for_geometry' do

    let(:geometry) { '3840x5760|1920x320+10+10' }

    subject { thumb.send(:args_for_geometry, geometry) }

    it 'returns ImageMagick instructions to resize and then crop manually an image' 


    context 'another geometry' do

      let(:geometry) { '3840x2968|1920x320-583+845' }

      it 'returns ImageMagick instructions to resize and then crop manually an image' 
    it 'returns a content entry' 


    context 'no public submission allowed' do

      let(:enabled) { false }

      it { expect(subject).to eq nil }

    end

  end #

  describe '#to_json' do

    let(:entry) { content_type.entries.build(_id: 42, name: 'John Doe', message: 'Hello') }

    subject { service.to_json(entry) }

    it 'includes _id and fields' 


  end

end

