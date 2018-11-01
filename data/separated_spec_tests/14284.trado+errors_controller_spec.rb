require 'rails_helper'

describe ErrorsController do

    store_setting

    describe 'GET #show' do

        context "if it is a 404 error" do

            it "should render the 404 template" 

        end

        context "if it is a 500 error" do

            it "should render the 500 template" 

        end

        context "if it is a 422 error" do

            it "should render the 422 template" 

        end
    end
end

