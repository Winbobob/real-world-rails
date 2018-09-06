require 'spec_helper'

describe Admin::HooksController do
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  describe 'POST #create' do
    it 'sets all parameters' 

  end
end

