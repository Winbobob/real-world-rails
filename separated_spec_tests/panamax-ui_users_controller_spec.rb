require 'spec_helper'

describe UsersController do

  let(:user) { double(:user) }
  let(:update_params) { { 'email' => 'test@example.com' } }

  before do
    allow(User).to receive(:find).and_return(user)
  end

  describe 'put #update' do
    before do
      allow(user).to receive(:update_attributes)
      request.env['HTTP_REFERER'] = '/some/origin'
    end

    it 'updates the user' 


    it 'redirects to the previous page' 


    it 'sets a flash message indicating successful update' 


    it 'sets a flash alert if the token could not be saved' 


    context 'when an error occurs' do

      before do
        allow(user).to receive(:update_attributes).and_raise('oops')
      end

      it 'flashes an error message' 


      it 'redirects to the previous page' 

    end
  end
end

