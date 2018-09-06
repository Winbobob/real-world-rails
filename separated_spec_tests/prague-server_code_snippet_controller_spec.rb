require 'spec_helper'

describe Api::CodeSnippetController do
  let(:organization) { create(:organization) }
  let(:token) { double :accessible? => true, :acceptable? => true, resource_owner_id: organization.id }

  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  describe '#show' do
    it 'responds with 200' 


    it 'includes the specified tags in the code snippet' 


    it 'raises an error if passed invalid tags' 

  end

  describe '#parameters' do
    it 'responds with 200' 


    it 'includes the specified tags in the code snippet' 


    it 'raises an error if passed invalid tags' 

  end
end

