require 'spec_helper'

describe 'Help Pages' do
  describe 'Get the main help page' do
    shared_examples_for 'help page' do |prefix: ''|
      it 'prefixes links correctly' 

    end

    context 'without a trailing slash' do
      before do
        visit help_path
      end

      it_behaves_like 'help page'
    end

    context 'with a trailing slash' do
      before do
        visit help_path + '/'
      end

      it_behaves_like 'help page'
    end

    context 'with a relative installation' do
      before do
        stub_config_setting(relative_url_root: '/gitlab')
        visit help_path
      end

      it_behaves_like 'help page', prefix: '/gitlab'
    end

    context 'quick link shortcuts', :js do
      before do
        visit help_path
      end

      it 'focuses search bar' 


      it 'opens shortcuts help dialog' 

    end
  end

  context 'in a production environment with version check enabled', :js do
    before do
      allow(Rails.env).to receive(:production?) { true }
      stub_application_setting(version_check_enabled: true)
      allow_any_instance_of(VersionCheck).to receive(:url) { '/version-check-url' }

      sign_in(create(:user))
      visit help_path
    end

    it 'has a version check image' 


    it 'hides the version check image if the image request fails' 

  end

  describe 'when help page is customized' do
    before do
      stub_application_setting(help_page_hide_commercial_content: true,
                               help_page_text: 'My Custom Text',
                               help_page_support_url: 'http://example.com/help')

      sign_in(create(:user))
      visit help_path
    end

    it 'should display custom help page text' 


    it 'should hide marketing content when enabled' 


    it 'should use a custom support url' 

  end
end

