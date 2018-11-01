require 'spec_helper'

describe AnnouncementsController do

  describe '#destroy' do

    context 'valid announcement' do
      let(:announcement) { FactoryBot.create(:announcement) }

      context 'logged in' do
        let(:user) { FactoryBot.create(:user) }
        before { session[:user_id] = user.id }

        it 'creates dismissal' 


        it 'returns 200 status' 


      end

      context 'logged out' do

        it 'stores announcement ID in session' 


        it 'returns 200 status' 


      end

    end

    context 'invalid announcement' do

      it 'returns 403 status' 


    end

  end

end

