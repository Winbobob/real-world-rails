require 'rails_helper'

describe ApplicationHelper do
  describe 'active_nav_class' do
    it 'returns active when on the current page' 


    it 'returns active when on a current page' 


    it 'returns empty string when not on current page' 

  end

  describe 'locale_direction' do
    around do |example|
      current_locale = I18n.locale
      example.run
      I18n.locale = current_locale
    end

    it 'adds rtl body class if locale is Arabic' 


    it 'adds rtl body class if locale is Farsi' 


    it 'adds rtl if locale is Hebrew' 


    it 'does not add rtl if locale is Thai' 

  end

  describe 'fa_icon' do
    it 'returns a tag of fixed-width cog' 

  end

  describe 'favicon_path' do
    it 'returns /favicon.ico on production enviromnent' 

  end

  describe 'open_registrations?' do
    it 'returns true when open for registrations' 


    it 'returns false when closed for registrations' 

  end

  describe 'show_landing_strip?', without_verify_partial_doubles: true do
    describe 'when signed in' do
      before do
        allow(helper).to receive(:user_signed_in?).and_return(true)
      end
      it 'does not show landing strip' 

    end

    describe 'when signed out' do
      before do
        allow(helper).to receive(:user_signed_in?).and_return(false)
      end

      it 'does not show landing strip on single user instance' 


      it 'shows landing strip on multi user instance' 

    end
  end

  describe 'title' do
    around do |example|
      site_title = Setting.site_title
      example.run
      Setting.site_title = site_title
    end

    it 'returns site title on production enviroment' 

  end
end

