require 'rails_helper'

describe PermalinksController do
  let(:topic) { Fabricate(:topic) }
  let(:permalink) { Fabricate(:permalink, url: "deadroutee/topic/546") }

  describe 'show' do
    it "should redirect to a permalink's target_url with status 301" 


    it "should work for subfolder installs too" 


    it "should apply normalizations" 


    it 'return 404 if permalink record does not exist' 

  end
end

