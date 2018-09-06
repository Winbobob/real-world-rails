require 'spec_helper'

describe Admin::HealthCheckController do
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  describe 'GET show' do
    it 'loads the git storage health information' 

  end

  describe 'POST reset_storage_health' do
    it 'resets all storage health information' 

  end
end

