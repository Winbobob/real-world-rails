# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::SafeRequestStore do
  describe '.store' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'does not use RequestStore' 

    end
  end

  describe '.begin!' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'uses RequestStore' 

    end
  end

  describe '.clear!' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'uses RequestStore' 

    end
  end

  describe '.end!' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'uses RequestStore' 

    end
  end

  describe '.write' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'does not use RequestStore' 

    end
  end

  describe '.[]=' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'does not use RequestStore' 

    end
  end

  describe '.read' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'does not use RequestStore' 

    end
  end

  describe '.[]' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'does not use RequestStore' 

    end
  end

  describe '.exist?' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'does not use RequestStore' 

    end
  end

  describe '.fetch' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 

    end

    context 'when RequestStore is NOT active' do
      it 'does not use RequestStore' 

    end
  end

  describe '.delete' do
    context 'when RequestStore is active', :request_store do
      it 'uses RequestStore' 


      context 'when given a block and the key exists' do
        it 'does not execute the block' 

      end

      context 'when given a block and the key does not exist' do
        it 'yields the key and returns the block result' 

      end
    end

    context 'when RequestStore is NOT active' do
      before do
        RequestStore.write('foo', true)
      end

      after do
        RequestStore.clear! # Clean up
      end

      it 'does not use RequestStore' 


      context 'when given a block' do
        it 'yields the key and returns the block result' 

      end
    end
  end
end

