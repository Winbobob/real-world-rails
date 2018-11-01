# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe ElementsController do
    routes { Alchemy::Engine.routes }

    let(:public_page)         { create(:alchemy_page, :public) }
    let(:element)             { create(:alchemy_element, page: public_page, name: 'download') }
    let(:restricted_page)     { create(:alchemy_page, :public, restricted: true) }
    let(:restricted_element)  { create(:alchemy_element, page: restricted_page, name: 'download') }

    describe '#show' do
      it "should render available elements" 


      it "should raise ActiveRecord::RecordNotFound error for trashed elements" 


      it "should raise ActiveRecord::RecordNotFound error for unpublished elements" 


      context "for guest user" do
        it "should raise ActiveRecord::RecordNotFound error for elements of restricted pages" 

      end

      context "for member user" do
        before { authorize_user(build(:alchemy_dummy_user)) }

        it "should render elements of restricted pages" 

      end
    end
  end
end

