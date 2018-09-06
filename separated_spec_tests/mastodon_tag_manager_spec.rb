# frozen_string_literal: true

require 'rails_helper'

describe OStatus::TagManager do
  describe '#unique_tag' do
    it 'returns a unique tag' 

  end

  describe '#unique_tag_to_local_id' do
    it 'returns the ID part' 


    it 'returns nil if it is not local id' 


    it 'returns nil if it is not expected type' 


    it 'returns nil if it does not have object ID' 

  end

  describe '#local_id?' do
    it 'returns true for a local ID' 


    it 'returns false for a foreign ID' 

  end

  describe '#uri_for' do
    subject { OStatus::TagManager.instance.uri_for(target) }

    context 'comment object' do
      let(:target) { Fabricate(:status, created_at: '2000-01-01T00:00:00Z', reply: true) }

      it 'returns the unique tag for status' 

    end

    context 'note object' do
      let(:target) { Fabricate(:status, created_at: '2000-01-01T00:00:00Z', reply: false, thread: nil) }

      it 'returns the unique tag for status' 

    end

    context 'person object' do
      let(:target) { Fabricate(:account, username: 'alice') }

      it 'returns the URL for account' 

    end
  end
end

