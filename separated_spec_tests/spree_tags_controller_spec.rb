require 'spec_helper'

module Spree
  describe Api::V1::TagsController, type: :controller do
    render_views

    let!(:tag) { create(:tag) }
    let(:base_attributes) { Api::ApiHelpers.tag_attributes }

    before do
      stub_authentication!
    end

    context 'as a normal user' do
      context 'with caching enabled' do
        before do
          create(:tag) # tag_2
          ActionController::Base.perform_caching = true
        end

        it 'returns unique tags' 


        after do
          ActionController::Base.perform_caching = false
        end
      end

      it 'retrieves a list of tags' 


      it 'retrieves a list of tags by id' 


      it 'retrieves a list of tags by ids string' 


      context 'pagination' do
        before { create(:tag) } # second_tag

        it 'can select the next page of tags' 


        it 'can control the page size through a parameter' 

      end

      it 'can search for tags' 

    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'can see all tags' 

    end
  end
end

