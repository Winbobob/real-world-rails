require 'rails_helper'

describe Administration::DashboardsController, type: :controller do
  render_views

  before do
    stub_request(:get, 'https://api.github.com/repos/churchio/onebody/releases')
      .to_return(body: File.read(fixture_path.join('releases.json')))
  end

  context 'an unauthorized user' do
    let!(:person) { FactoryGirl.create(:person) }

    it 'should return unauthorized' 

  end

  context 'an authorized user' do
    let!(:admin) { FactoryGirl.create(:person, :admin_manage_updates) }

    it 'should render the dashboard' 

  end
end

