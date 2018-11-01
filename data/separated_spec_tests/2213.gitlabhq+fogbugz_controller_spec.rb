require 'spec_helper'

describe Import::FogbugzController do
  include ImportSpecHelper

  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET status' do
    before do
      @repo = OpenStruct.new(name: 'vim')
      stub_client(valid?: true)
    end

    it 'assigns variables' 


    it 'does not show already added project' 

  end
end

