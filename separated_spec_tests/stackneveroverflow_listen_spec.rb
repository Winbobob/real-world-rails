require 'spec_helper'

describe Listen do
  describe '#to' do
    let(:listener)       { double(Listen::Listener) }
    let(:listener_class) { Listen::Listener }
    before { listener_class.stub(:new => listener) }

    context 'with one path to listen to' do
      context 'without options' do
        it 'creates an instance of Listener' 

      end

      context 'with options' do
        it 'creates an instance of Listener with the passed params' 

      end

      context 'without a block' do
        it 'returns the listener' 

      end

      context 'with a block' do
        it 'starts the listener after creating it' 

      end
    end

    context 'with multiple paths to listen to' do
      context 'without options' do
        it 'creates an instance of Listener' 

      end

      context 'with options' do
        it 'creates an instance of Listener with the passed params' 

      end

      context 'without a block' do
        it 'returns a Listener instance created with the passed params' 

      end

      context 'with a block' do
        it 'starts a Listener instance after creating it with the passed params' 

      end
    end
  end
end

