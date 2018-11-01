require 'rails_helper'

RSpec.describe ActivityPub::TagManager do
  include RoutingHelper

  subject { described_class.instance }

  describe '#url_for' do
    it 'returns a string' 

  end

  describe '#uri_for' do
    it 'returns a string' 

  end

  describe '#to' do
    it 'returns public collection for public status' 


    it 'returns followers collection for unlisted status' 


    it 'returns followers collection for private status' 


    it 'returns URIs of mentions for direct status' 

  end

  describe '#cc' do
    it 'returns followers collection for public status' 


    it 'returns public collection for unlisted status' 


    it 'returns empty array for private status' 


    it 'returns empty array for direct status' 


    it 'returns URIs of mentions for non-direct status' 

  end

  describe '#local_uri?' do
    it 'returns false for non-local URI' 


    it 'returns true for local URIs' 

  end

  describe '#uri_to_local_id' do
    it 'returns the local ID' 

  end

  describe '#uri_to_resource' do
    it 'returns the local account' 


    it 'returns the remote account by matching URI without fragment part' 


    it 'returns the local status for ActivityPub URI' 


    it 'returns the local status for OStatus tag: URI' 


    it 'returns the local status for OStatus StreamEntry URL' 


    it 'returns the remote status by matching URI without fragment part' 

  end
end

