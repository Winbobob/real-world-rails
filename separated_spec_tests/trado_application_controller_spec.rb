require 'rails_helper'

describe ApplicationController do

    describe 'current_cart' do

        context "if there is a cart_id value in the session store" do
            let!(:cart) { create(:cart) }
            before(:each) do
                session[:cart_id] = cart.id
            end

            it "should set current_cart as the associated cart item" 

        end

        context "if there is no cart_id value in the session store" do
            let(:current_cart) { subject.send(:current_cart) }

            it "should save a new cart item to the database" 


            it "should set the session cart_id value as the new cart item" 

        end 
    end
end

