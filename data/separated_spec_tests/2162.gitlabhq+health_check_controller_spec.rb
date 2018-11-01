require 'spec_helper'

describe Admin::HealthCheckController do
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  describe 'GET show' do
    it 'loads the health information' 

  end
end

