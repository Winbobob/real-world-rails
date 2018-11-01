require_relative '../spec_helper'

describe AccountTokensController do

  describe 'token validation' do

    it 'returns 404 for nonexisting tokens' 


    describe 'account validation' do

      before(:each) do
        CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
        @user = FactoryGirl.create(:valid_user)
      end

      after(:each) do
        @user.destroy
      end

      it 'cleans existing tokens from users' 


    end

    describe 'resend validation mail' do

      it 'returns 404 for nonexisting users' 


      describe 'valid user behaviour' do

        before(:each) do
          CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
          @user = FactoryGirl.create(:valid_user)
        end

        after(:each) do
          @user.destroy
        end

        it 'triggers a NewOrganizationUser job with user_id' 


      end

    end

  end

end

