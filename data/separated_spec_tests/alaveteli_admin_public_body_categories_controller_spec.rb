# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AdminPublicBodyCategoriesController do

  describe 'GET index' do

    it 'responds successfully' 


    it 'uses the current locale by default' 


    it 'finds all category headings' 


    it 'finds all categories without their headings' 


    it 'renders the index template' 


  end

  describe 'GET new' do

    it 'responds successfully' 


    it 'builds a new PublicBodyCategory' 


    it 'builds new translations for all locales' 


    it 'renders the new template' 


  end

  describe 'POST create' do

    context 'on success' do

      before(:each) do
        PublicBodyCategory.destroy_all
        @params = { :category_tag => 'new_test_category',
                    :translations_attributes => {
          'en' => { :locale => 'en',
                    :title => 'New Category',
                    :description => 'New category for testing stuff' }
        } }
      end

      it 'creates a new category in the default locale' 


      it 'can create a category when the default locale is an underscore locale' 


      it "saves the public body category's heading associations" 


      it 'notifies the admin that the category was created' 


      it 'redirects to the categories index' 


    end

    context 'on success for multiple locales' do

      before(:each) do
        PublicBodyCategory.destroy_all
        @params = { :category_tag => 'new_test_category',
                    :translations_attributes => {
          'en' => { :locale => 'en',
                    :title => 'New Category',
                    :description => 'New category for testing stuff' },
                    'es' => { :locale => 'es',
                              :title => 'Mi Nuevo Category',
                              :description => 'ES Description' }
        } }
      end

      it 'saves the category' 


      it 'saves the default locale translation' 


      it 'saves the alternative locale translation' 


    end

    context 'on failure' do

      it 'renders the form if creating the record was unsuccessful' 


      it 'is rebuilt with the given params' 


    end

    context 'on failure for multiple locales' do

      before(:each) do
        @params = { :category_tag => 'new_test_category',
                    :translations_attributes => {
          'en' => { :locale => 'en',
                    :title => 'Need a description',
                    :description => nil },
                    'es' => { :locale => 'es',
                              :title => 'Mi Nuevo Category',
                              :description => 'ES Description' }
        } }
      end

      it 'is rebuilt with the default locale translation' 


      it 'is rebuilt with the alternative locale translation' 


    end

  end

  describe 'GET edit' do

    before do
      @category = FactoryGirl.create(:public_body_category)
      AlaveteliLocalization.with_locale('es') do
        @category.title = 'Los category'
        @category.description = 'ES Description'
        @category.save!
      end
    end

    it 'responds successfully' 


    it 'finds the requested category' 


    it 'builds new translations if the body does not already have a translation in the specified locale' 


    it 'finds the public bodies tagged with the category tag' 


    it 'renders the edit template' 


  end

  describe 'PUT update' do

    before do
      @heading = FactoryGirl.create(:public_body_heading)
      @category = FactoryGirl.create(:public_body_category)
      link = FactoryGirl.create(:public_body_category_link,
                                :public_body_category => @category,
                                :public_body_heading => @heading,
                                :category_display_order => 0)
      @tag = @category.category_tag
      AlaveteliLocalization.with_locale('es') do
        @category.title = 'Los category'
        @category.description = 'ES Description'
        @category.save!
      end

      @params = { :category_tag => @category.category_tag,
                  :translations_attributes => {
        'en' => { :id => @category.translation_for(:en).id,
                  :locale => 'en',
                  :title => @category.title(:en),
                  :description => @category.description(:en) },
        'es' => { :id => @category.translation_for(:es).id,
                  :locale => 'es',
                  :title => @category.title(:es),
                  :description => @category.description(:es) }
      } }
    end

    it 'finds the category to update' 


    it 'finds the public bodies tagged with the category tag' 


    it "saves edits to a public body category's heading associations" 


    context 'when the category has associated bodies' do

      it 'does not save edits to category_tag' 


      it 'notifies the user that the category_tag could not be updated' 


      it 'renders the edit action' 


    end

    context 'on success' do

      before(:each) do
        @params = { :id => @category.id,
                    :public_body_category => {
          :translations_attributes => {
            'en' => { :id => @category.translation_for(:en).id,
                      :title => 'Renamed' }
          }
        }
        }
      end

      it 'saves edits to a public body category' 


      it 'notifies the admin that the category was created' 


      it 'redirects to the category edit page' 


      it 'saves edits to category_tag if the category has no associated bodies' 


      it "creates a new translation if there isn't one for the default_locale" 


    end

    context 'on success for multiple locales' do

      it "saves edits to a public body category in another locale" 


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
        @params = { :category_tag => 'new_test_category',
                    :translations_attributes => {
          'en' => { :id => @category.translation_for(:en).id,
                    :locale => 'en',
                    :title => 'Need a description',
                    :description => '' },
                    'es' => { :id => @category.translation_for(:es).id,
                              :locale => 'es',
                              :title => 'Mi Nuevo Category',
                              :description => 'ES Description' }
        } }
      end

      it 'is rebuilt with the default locale translation' 


      it 'is rebuilt with the alternative locale translation' 


    end

  end

  describe 'DELETE destroy' do

    it 'destroys empty public body categories' 


    it 'destroys non-empty public body categories' 


    it 'notifies the admin that the category was destroyed' 


    it 'redirects to the categories index' 


  end
end

