require 'rails_helper'

describe Admin::UsersController do

    store_setting
    login_admin

    describe 'GET #edit' do
        let(:user) { subject.send(:current_user) }

        it "should assign the current_user to @user" 


        context "if the user has an attachment" do
            let!(:admin) { create(:attached_admin) }
            before(:each) do
                subject.stub(:current_user).and_return(admin)
            end

            it "should assign @attachment to be nil" 

        end

        context "if the user does not have an attachment" do

            it "should assign a new attachment to @attachment" 

        end
    end

    describe 'PATCH #update' do
        let(:user) { subject.send(:current_user) }

        it "should assign the current_user to @user" 


        context "with valid attributes" do

            it "should update the user" 


            it "should redirect the user to admin root" 

        end

        context "with invalid attributes" do

            it "should not update the user" 


            it "should re-render the :edit template" 

        end
    end
end

