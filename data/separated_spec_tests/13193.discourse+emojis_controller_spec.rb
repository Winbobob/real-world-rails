require 'rails_helper'

RSpec.describe Admin::EmojisController do
  let(:admin) { Fabricate(:admin) }
  let(:upload) { Fabricate(:upload) }

  before do
    sign_in(admin)
  end

  describe '#index' do
    it "returns a list of custom emojis" 

  end

  describe "#create" do
    describe 'when upload is invalid' do
      it 'should publish the right error' 

    end

    describe 'when emoji name already exists' do
      it 'should publish the right error' 

    end

    it 'should allow an admin to add a custom emoji' 

  end

  describe '#destroy' do
    it 'should allow an admin to delete a custom emoji' 

  end
end

