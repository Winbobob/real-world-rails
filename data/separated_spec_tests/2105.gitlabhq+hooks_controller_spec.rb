require 'spec_helper'

describe Projects::HooksController do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_maintainer(user)
    sign_in(user)
  end

  describe '#index' do
    it 'redirects to settings/integrations page' 

  end

  describe '#create' do
    it 'sets all parameters' 

  end
end

