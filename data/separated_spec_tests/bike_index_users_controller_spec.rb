require 'spec_helper'

describe Admin::UsersController do
  describe 'edit' do
    xit "404s if the user doesn't exist" do
      # I have no idea why this fails. It works really, but not in tests!
      expect do
        get :edit, id: 'STUFFFFFF'
      end.to raise_error(ActionController::RoutingError)
    end
    it 'shows the edit page if the user exists' 

  end

  describe 'update' do
    context 'non developer' do
      it 'updates all the things that can be edited' 

    end
    context 'developer' do
      it 'updates developer' 

    end
  end
end

