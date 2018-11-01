require 'spec_helper'

describe Org::TagsController do
  let!(:organization) { create(:organization) }
  let!(:tag) { create(:tag, name: 'foo', organization: organization) }
  let(:user) { create(:confirmed_user, organization: organization)}


  before(:each) do
    allow(controller).to receive(:current_organization).and_return( organization )
    sign_in user
  end

  describe 'index' do
    it 'should render' 

  end

  describe 'show' do
    it 'should render' 

  end
end

