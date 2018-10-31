require 'rails_helper'

describe StaticController do

  context '#favicon' do
    let(:png) { Base64.decode64("R0lGODlhAQABALMAAAAAAIAAAACAAICAAAAAgIAAgACAgMDAwICAgP8AAAD/AP//AAAA//8A/wD//wBiZCH5BAEAAA8ALAAAAAABAAEAAAQC8EUAOw==") }

    before { FinalDestination.stubs(:lookup_ip).returns("1.2.3.4") }

    it 'returns the default favicon for a missing download' 


    it 'can proxy a favicon correctly' 

  end

  context '#brotli_asset' do
    it 'returns a non brotli encoded 404 if asset is missing' 


    it 'can handle fallback brotli assets' 


    it 'has correct headers for brotli assets' 

  end

  context '#show' do
    before do
      post = create_post
      SiteSetting.tos_topic_id = post.topic.id
      SiteSetting.guidelines_topic_id = post.topic.id
      SiteSetting.privacy_topic_id = post.topic.id
    end

    context "with a static file that's present" do
      it "should return the right response" 

    end

    [
      ['tos', :tos_url, I18n.t('terms_of_service.title')],
      ['privacy', :privacy_policy_url, I18n.t('privacy')]
    ].each do |id, setting_name, text|

      context "#{id}" do
        context "when #{setting_name} site setting is NOT set" do
          it "renders the #{id} page" 

        end

        context "when #{setting_name} site setting is set" do
          before do
            SiteSetting.public_send("#{setting_name}=", 'http://example.com/page')
          end

          it "redirects to the #{setting_name}" 

        end
      end
    end

    context "with a missing file" do
      it "should respond 404" 

    end

    it 'should redirect to / when logged in and path is /login' 


    it "should display the login template when login is required" 


    context "when login_required is enabled" do
      before do
        SiteSetting.login_required = true
      end

      it 'faq page redirects to login page for anon' 


      it 'guidelines page redirects to login page for anon' 


      it 'faq page loads for logged in user' 


      it 'guidelines page loads for logged in user' 

    end
  end

  describe '#enter' do
    context 'without a redirect path' do
      it 'redirects to the root url' 

    end

    context 'with a redirect path' do
      it 'redirects to the redirect path' 

    end

    context 'with a full url' do
      it 'redirects to the correct path' 

    end

    context 'with a period to force a new host' do
      it 'redirects to the root path' 

    end

    context 'with a full url to someone else' do
      it 'redirects to the root path' 

    end

    context 'with an invalid URL' do
      it "redirects to the root" 

    end

    context 'when the redirect path is the login page' do
      it 'redirects to the root url' 

    end
  end
end

