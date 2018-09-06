require 'spec_helper'

describe Projects::GraphsController do
  let(:project) { create(:project, :repository) }
  let(:user)    { create(:user) }

  before do
    sign_in(user)
    project.add_master(user)
  end

  describe 'GET languages' do
    it "redirects_to action charts" 

  end

  describe 'GET commits' do
    it "redirects_to action charts" 

  end
end

