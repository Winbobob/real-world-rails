require 'rails_helper'

describe PrintableDirectoriesController, type: :controller do
  let(:user) { FactoryGirl.create(:person) }

  describe '#create' do
    before do
      allow(PrintableDirectoryJob).to receive(:perform_later)
      post :create,
           session: { logged_in_id: user.id }
    end

    it 'calls perform_later on PrintableDirectoryJob' 


    it 'redirects to the show action' 

  end
end

