require 'spec_helper'
require 'rails_helper'

describe LocalesHelper do
  let(:http_no_lang) { { 'HTTP_ACCEPT_LANGUAGE' => '' } }
  let(:http_accept_lang) { {'HTTP_ACCEPT_LANGUAGE' => 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2'} }
  let(:http_accept_lang_zh) { {'HTTP_ACCEPT_LANGUAGE' => 'zh-CN,pt;q=0.8,en-US;q=0.6,en;q=0.4,es;q=0.2'} }
  let(:http_accept_lang_fallback) {{ 'HTTP_ACCEPT_LANGUAGE' => 'fr-fr;q=0.8'}}
  let(:http_accept_lang_bad) {{ 'HTTP_ACCEPT_LANGUAGE' => 'notagoodone' }}
  let(:user) { create :user }

  before do
    helper.stub(:request).and_return(OpenStruct.new(env: http_no_lang))
    helper.stub(:current_user).and_return(user)
  end

  describe 'preferred_locale' do
    subject do
      helper.preferred_locale.to_sym
    end
    it 'can set via query parameter' 


    it 'does not set a bad locale via query param' 


    it 'can set via user preference' 


    it 'can set via browser http header' 


    it 'has robust fallbacks from browser http headers' 


    it 'does not set a bad locale via http header' 


    it 'uses default_locale by default' 

  end
end

