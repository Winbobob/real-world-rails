require 'rails_helper'

describe UsersEmailController do

  describe '#confirm' do
    it 'errors out for invalid tokens' 


    context 'valid old address token' do
      let(:user) { Fabricate(:moderator) }
      let(:updater) { EmailUpdater.new(user.guardian, user) }

      before do
        updater.change_to('new.n.cool@example.com')
      end

      it 'confirms with a correct token' 

    end

    context 'valid new address token' do
      let(:user) { Fabricate(:user) }
      let(:updater) { EmailUpdater.new(user.guardian, user) }

      before do
        updater.change_to('new.n.cool@example.com')
      end

      it 'confirms with a correct token' 


      it 'automatically adds the user to a group when the email matches' 


      context 'second factor required' do
        let!(:second_factor) { Fabricate(:user_second_factor, user: user) }

        it 'requires a second factor token' 


        it 'adds an error on a second factor attempt' 


        it 'confirms with a correct second token' 

      end
    end
  end

  describe '#update' do
    let(:user) { Fabricate(:user) }
    let(:new_email) { 'bubblegum@adventuretime.ooo' }

    it "requires you to be logged in" 


    context 'when logged in' do
      before do
        sign_in(user)
      end

      it 'raises an error without an email parameter' 


      it "raises an error if you can't edit the user's email" 


      context 'when the new email address is taken' do
        let!(:other_user) { Fabricate(:coding_horror) }

        context 'hide_email_address_taken is disabled' do
          before do
            SiteSetting.hide_email_address_taken = false
          end

          it 'raises an error' 


          it 'raises an error if there is whitespace too' 

        end

        context 'hide_email_address_taken is enabled' do
          before do
            SiteSetting.hide_email_address_taken = true
          end

          it 'responds with success' 

        end
      end

      context 'when new email is different case of existing email' do
        let!(:other_user) { Fabricate(:user, email: 'case.insensitive@gmail.com') }

        it 'raises an error' 

      end

      it 'raises an error when new email domain is present in email_domains_blacklist site setting' 


      it 'raises an error when new email domain is not present in email_domains_whitelist site setting' 


      context 'success' do
        it 'has an email token' 

      end
    end

  end

end

