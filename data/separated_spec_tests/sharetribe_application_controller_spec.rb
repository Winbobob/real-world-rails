require 'spec_helper'

describe ApplicationController, type: :controller do
  controller do
    # a mock method to be able to call index without route
    def index
      # do nothing as we are testing the filters here only
    end
  end

  describe "handling wrong requests coming to login domain" do
    if APP_CONFIG.login_domain
      controller do
        # a mock method to be able to call index without route
        def index
          # do nothing as we are testing the filters here only
        end
      end

      describe "HTTP_REFERER is blank" do

        it "shows error an page" 


        it "redirects to aalto community if longer request path (to keep legacy email links working)" 


      end

      describe "HTTP_REFERER is known but action is wrong for login domain" do

        it "redirects back to the referer domain and shows error" 

      end
    end
  end

  describe "#check_auth_token" do
    it "logs person in when auth_token is valid" 

  end
end

