require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::RedirectToMatcher, type: :controller do
  context 'a controller that redirects' do
    it 'accepts redirecting to that url' 


    it 'rejects redirecting to a different url' 


    it 'accepts redirecting to that url in a block' 


    it 'rejects redirecting to a different url in a block' 


    def controller_redirecting_to(url)
      build_fake_response { redirect_to url }
    end
  end

  context 'a controller that does not redirect' do
    it 'rejects redirecting to a url' 

  end

  it 'provides the correct description when provided a block' 

end

