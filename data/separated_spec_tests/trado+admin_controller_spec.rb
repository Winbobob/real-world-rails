require 'rails_helper' 

describe Admin::AdminController do

    store_setting
    login_admin

    describe 'GET #settings' do

        it "should assign the current store settings to @settings" 


        it "should render the :settings template" 

    end

    describe 'PATCH #update' do
        let(:store_setting) { create(:store_setting, tax_rate: '1.22') }
        before(:each) do
            StoreSetting.destroy_all
            store_setting
            Store.settings
        end

        it "should assign the current store settings to @settings" 


        context "with valid attributes" do

            it "should update the current store settings" 


            it "should redirect to the admin root" 

        end

        context "with invalid attributes" do

            it "should not update the current store settings" 


            it "should re-render the settings template" 

        end
    end
end

