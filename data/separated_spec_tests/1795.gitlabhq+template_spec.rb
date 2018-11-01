require 'spec_helper'

describe Gitlab::Badge::Pipeline::Template do
  let(:badge) { double(entity: 'pipeline', status: 'success') }
  let(:template) { described_class.new(badge) }

  describe '#key_text' do
    it 'is always says pipeline' 

  end

  describe '#value_text' do
    it 'is status value' 

  end

  describe 'widths and text anchors' do
    it 'has fixed width and text anchors' 

  end

  describe '#key_color' do
    it 'is always the same' 

  end

  describe '#value_color' do
    context 'when status is success' do
      it 'has expected color' 

    end

    context 'when status is failed' do
      before do
        allow(badge).to receive(:status).and_return('failed')
      end

      it 'has expected color' 

    end

    context 'when status is running' do
      before do
        allow(badge).to receive(:status).and_return('running')
      end

      it 'has expected color' 

    end

    context 'when status is unknown' do
      before do
        allow(badge).to receive(:status).and_return('unknown')
      end

      it 'has expected color' 

    end

    context 'when status does not match any known statuses' do
      before do
        allow(badge).to receive(:status).and_return('invalid')
      end

      it 'has expected color' 

    end
  end
end

