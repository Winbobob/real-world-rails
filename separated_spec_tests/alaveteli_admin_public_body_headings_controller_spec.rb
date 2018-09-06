# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AdminPublicBodyHeadingsController do

  describe 'GET new' do

    it 'responds successfully' 


    it 'builds a new PublicBodyHeading' 


    it 'builds new translations for all locales' 


    it 'renders the new template' 


  end

  describe 'POST create' do

    context 'on success' do

      before(:each) do
        PublicBodyHeading.destroy_all
        @params = { :translations_attributes => {
                      'en' => { :locale => 'en',
                                :name => 'New Heading' }
        } }
      end

      it 'creates a new heading in the default locale' 


      it 'can create a heading when the default locale is an underscore locale' 


      it 'notifies the admin that the heading was created' 


      it 'redirects to the categories index' 


    end

    context 'on success for multiple locales' do

      before(:each) do
        PublicBodyHeading.destroy_all
        @params = { :translations_attributes => {
                      'en' => { :locale => 'en',
                                :name => 'New Heading' },
                      'es' => { :locale => 'es',
                                :name => 'Mi Nuevo Heading' }
        } }
      end

      it 'saves the heading' 


      it 'saves the default locale translation' 


      it 'saves the alternative locale translation' 


    end

    context 'on failure' do

      it 'renders the form if creating the record was unsuccessful' 


      it 'is rebuilt with the given params' 


    end

    context 'on failure for multiple locales' do

      before(:each) do
        @params = { :translations_attributes => {
                      'en' => { :locale => 'en',
                                :name => 'Need a description' },
                      'es' => { :locale => 'es',
                                :name => 'Mi Nuevo Heading' }
        } }
      end

      it 'is rebuilt with the default locale translation' 


      it 'is rebuilt with the alternative locale translation' 


    end

  end

  describe 'GET edit' do

    before do
      @heading = FactoryGirl.create(:public_body_heading)
      AlaveteliLocalization.with_locale('es') do
        @heading.name = 'Los heading'
        @heading.save!
      end
    end

    it 'responds successfully' 


    it 'finds the requested heading' 


    it 'builds new translations if the body does not already have a translation in the specified locale' 


    it 'renders the edit template' 


  end

  describe 'PUT update' do

    before do
      @heading = FactoryGirl.create(:public_body_heading)
      AlaveteliLocalization.with_locale('es') do
        @heading.name = 'Los heading'
        @heading.save!
      end
      @params = { :translations_attributes => {
                    'en' => { :id => @heading.translation_for(:en).id,
                              :locale => 'en',
                              :name => @heading.name(:en) },
                    'es' => { :id => @heading.translation_for(:es).id,
                              :locale => 'es',
                              :title => @heading.name(:es) }
      } }
    end

    it 'finds the heading to update' 


    context 'on success' do

      before(:each) do
        @params = { :id => @heading.id,
                    :public_body_heading => {
                      :translations_attributes => {
                        'en' => { :id => @heading.translation_for(:en).id,
                                  :name => 'Renamed' }
                      }
                    }
                    }
      end

      it 'saves edits to a public body heading' 


      it 'notifies the admin that the heading was updated' 


      it "creates a new translation if there isn't one for the default_locale" 


      it 'redirects to the heading edit page' 


    end

    context 'on success for multiple locales' do

      it 'saves edits to a public body heading in another locale' 


      it 'adds a new translation' 


      it 'adds new translations' 


      it 'updates an existing translation and adds a third translation' 


      it "redirects to the edit page after a successful update" 


    end

    context 'on failure' do

      it 'renders the form if creating the record was unsuccessful' 


      it 'is rebuilt with the given params' 


    end

    context 'on failure for multiple locales' do

      before(:each) do
        @params = { :translations_attributes => {
                      'en' => { :id => @heading.translation_for(:en).id,
                                :locale => 'en',
                                :name => '' },
                      'es' => { :id => @heading.translation_for(:es).id,
                                :locale => 'es',
                                :name => 'Mi Nuevo Heading' }
        } }
      end

      it 'is rebuilt with the default locale translation' 


      it 'is rebuilt with the alternative locale translation' 


    end

  end

  describe 'DELETE destroy' do

    it 'destroys the public body heading' 


    it 'destroys a heading that has associated categories' 


    it 'notifies the admin that the heading was destroyed' 


    it 'redirects to the categories index' 


  end

  context 'when reordering public body headings' do

    render_views

    before do
      @first = FactoryGirl.create(:public_body_heading, :display_order => 0)
      @second = FactoryGirl.create(:public_body_heading, :display_order => 1)
      @default_params = { :headings => [@second.id, @first.id] }
    end

    def make_request(params=@default_params)
      post :reorder, params
    end

    context 'when handling valid input' do

      it 'should reorder headings according to their position in the submitted params' 


      it 'should return a "success" status' 

    end

    context 'when handling invalid input' do

      before do
        @params = { :headings => [@second.id, @first.id, @second.id + 1]}
      end

      it 'should return an "unprocessable entity" status and an error message' 


      it 'should not reorder headings' 


    end
  end

  context 'when reordering public body categories' do

    render_views

    before do
      @heading = FactoryGirl.create(:public_body_heading)
      @first_category = FactoryGirl.create(:public_body_category)
      @first_link = FactoryGirl.create(:public_body_category_link,
                                       :public_body_category => @first_category,
                                       :public_body_heading => @heading,
                                       :category_display_order => 0)
      @second_category = FactoryGirl.create(:public_body_category)
      @second_link = FactoryGirl.create(:public_body_category_link,
                                        :public_body_category => @second_category,
                                        :public_body_heading => @heading,
                                        :category_display_order => 1)
      @default_params = { :categories => [@second_category.id, @first_category.id],
                          :id => @heading }
      @old_order = [@first_category, @second_category]
      @new_order = [@second_category, @first_category]
    end

    def make_request(params=@default_params)
      post :reorder_categories, params
    end

    context 'when handling valid input' do

      it 'should reorder categories for the heading according to their position \
                in the submitted params' do

        expect(@heading.public_body_categories).to eq(@old_order)
        make_request
        expect(@heading.public_body_categories(reload=true)).to eq(@new_order)
      end

      it 'should return a success status' 

    end

    context 'when handling invalid input' do

      before do
        @new_category = FactoryGirl.create(:public_body_category)
        @params = @default_params.merge(:categories => [@second_category.id,
                                                        @first_category.id,
                                                        @new_category.id])
      end

      it 'should return an "unprocessable entity" status and an error message' 


      it 'should not reorder the categories for the heading' 

    end

  end
end

