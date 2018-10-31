# frozen_string_literal: true

require 'rails_helper'

describe JsonLdHelper do
  describe '#equals_or_includes?' do
    it 'returns true when value equals' 


    it 'returns false when value does not equal' 


    it 'returns true when value is included' 


    it 'returns false when value is not included' 

  end

  describe '#first_of_value' do
    pending
  end

  describe '#supported_context?' do
    pending
  end

  describe '#fetch_resource' do
    context 'when the second argument is false' do
      it 'returns resource even if the retrieved ID and the given URI does not match' 


      it 'returns nil if the object identified by the given URI and the object identified by the retrieved ID does not match' 

    end

    context 'when the second argument is true' do
      it 'returns nil if the retrieved ID and the given URI does not match' 

    end
  end

  describe '#fetch_resource_without_id_validation' do
    it 'returns nil if the status code is not 200' 


    it 'returns hash' 

  end
end

