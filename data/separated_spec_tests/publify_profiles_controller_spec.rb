require 'rails_helper'

describe Admin::ProfilesController, type: :controller do
  render_views
  let!(:blog) { create(:blog) }
  let(:alice) { create(:user, :as_publisher, login: 'alice') }

  before do
    sign_in alice
  end

  describe '#index' do
    it 'should render index' 

  end

  describe '#update' do
    it 'redirects to profile page' 


    it 'does not allow updating your own profile' 


    it 'skips blank passwords' 

  end
end

