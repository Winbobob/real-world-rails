require 'rails_helper'

describe Admin::Products::TagsController do

    describe 'GET #index' do

        store_setting
        login_admin

        describe 'GET #index' do
            let!(:tags) { create_list(:tag, 3) }

            it "should assign all Tag records to @tags" 


            it "should render a JSON object of tag names" 

        end
    end
end

