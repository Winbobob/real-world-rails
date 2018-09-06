require 'spec_helper'
require 'json'

describe OauthController do
  fixtures :oauth_tokens

  describe "2.0 authorization code flow" do
    before(:each) do
      login
    end

    describe "authorize redirect" do
      before(:each) do
        get :authorize, :response_type=>"code",:client_id=>current_client_application.key, :redirect_uri=>"http://application/callback"
      end

      it "should render authorize" 


      it "should not create token" 

    end
    
    describe "authorize invalid client" do
      it "should render a failure page if an invalid client is used" 

    end
    
    describe "authorize invalid response type" do
      it "should render a failure page if an invalid response type is used" 

    end

    describe "authorize" do
      before(:each) do
        post :authorize, :response_type=>"code",:client_id=>current_client_application.key, :redirect_uri=>"http://application/callback",:authorize=>"1"
        @verification_token = Oauth2Verifier.last
        @oauth2_token_count= Oauth2Token.count
      end
      subject { @verification_token }

      it { should_not be_nil }
      it "should set user on verification token" 


      it "should set redirect_url" 


      it "should redirect to default callback" 


      describe "get token" do
        before(:each) do
          post :token, :grant_type=>"authorization_code", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :redirect_uri=>"http://application/callback",:code=>@verification_token.code
          @token = Oauth2Token.last
        end

        subject { @token }

        it { should_not be_nil }
        it { should be_authorized }
        it "should have added a new token" 

        
        it "should have cleared the verification token" 


        it "should set user to current user" 


        it "should return json token" 

      end
      
      describe "get token with the same verifier twice fails" do
        before(:each) do
          post :token, :grant_type=>"authorization_code", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :redirect_uri=>"http://application/callback",:code=>@verification_token.code
          post :token, :grant_type=>"authorization_code", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :redirect_uri=>"http://application/callback",:code=>@verification_token.code
        end

        it "should return incorrect_client_credentials error" 

      end
      
      describe "get token twice destroys existing access tokens" do
        before(:each) do
          post :token, :grant_type=>"authorization_code", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :redirect_uri=>"http://application/callback",:code=>@verification_token.code
          @token = Oauth2Token.last
          post :authorize, :response_type=>"code",:client_id=>current_client_application.key, :redirect_uri=>"http://application/callback",:authorize=>"1"
          @verification_token = Oauth2Verifier.last
          post :token, :grant_type=>"authorization_code", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :redirect_uri=>"http://application/callback",:code=>@verification_token.code
          @new_token = Oauth2Token.last
        end

        it "should generate a new token" 

        
        it "should destroy the old token" 

      end

      describe "get token with wrong secret" do
        before(:each) do
          post :token, :grant_type=>"authorization_code", :client_id=>current_client_application.key,:client_secret=>"fake", :redirect_uri=>"http://application/callback",:code=>@verification_token.code
        end

        it "should not create token" 


        it "should return incorrect_client_credentials error" 

      end

      describe "get token with wrong code" do
        before(:each) do
          post :token, :grant_type=>"authorization_code", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :redirect_uri=>"http://application/callback",:code=>"fake"
        end

        it "should not create token" 


        it "should return incorrect_client_credentials error" 

      end

      describe "get token with wrong redirect_url" do
        before(:each) do
          post :token, :grant_type=>"authorization_code", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :redirect_uri=>"http://evil/callback",:code=>@verification_token.code
        end

        it "should not create token" 


        it "should return incorrect_client_credentials error" 

      end

    end

    describe "scopes on authorize" do
      def auth_with_scope(scope)
        post :authorize, :response_type=>"code",:client_id=>current_client_application.key, :redirect_uri=>"http://application/callback",:authorize=>"1", :scope => scope
        @verification_token = Oauth2Verifier.last
      end
      
      it "should only allow OauthToken::ALLOWED_SCOPES" 

      
      it "should allow the scope to be further restricted on token" 

      
    end
    
    describe "redirect_uri on authorize" do
      def auth_with_redirect(url)
        post :authorize, :response_type=>"code",:client_id=>current_client_application.key, :redirect_uri=>url,:authorize=>"1"
        @verification_token = Oauth2Verifier.last
      end
      
      it "should not allow a blank uri" 

      
      it "should allow http://application/callback" 

      
      it "should not allow http://other-application/callback" 

      
      it "should not allow http://other-application/callback on GET" 

    end
    
    describe "deny" do
      before(:each) do
        post :authorize, :response_type=>"code", :client_id=>current_client_application.key, :redirect_uri=>"http://application/callback",:authorize=>"0"
      end

      it { Oauth2Verifier.last.should be_nil }

      it "should redirect to default callback" 

    end

  end


  describe "2.0 authorization token flow" do
    before(:each) do
      login
      current_client_application # load up so it creates its own token
      @oauth2_token_count= Oauth2Token.count
    end

    describe "authorize redirect" do
      before(:each) do
        get :authorize, :response_type=>"token",:client_id=>current_client_application.key, :redirect_uri=>"http://application/callback"
      end

      it "should render authorize" 


      it "should not create token" 

    end

    describe "authorize" do
      before(:each) do
        post :authorize, :response_type=>"token",:client_id=>current_client_application.key, :redirect_uri=>"http://application/callback",:authorize=>"1"
        @token = Oauth2Token.last
      end
      subject { @token }
      it "should redirect to default callback" 


      it "should not have a scope" 

      it { should_not be_nil }
      it { should be_authorized }

      it "should set user to current user" 


      it "should have added a new token" 

    end

    describe "deny" do
      before(:each) do
        post :authorize, :response_type=>"token", :client_id=>current_client_application.key, :redirect_uri=>"http://application/callback",:authorize=>"0"
      end

      it { Oauth2Verifier.last.should be_nil }

      it "should redirect to default callback" 

    end
  end

  describe "oauth2 token for basic credentials" do
    before(:each) do
      current_client_application
      @oauth2_token_count = Oauth2Token.count
      current_user.should_not == nil
      post :token, :grant_type=>"password", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :username=>current_user.login, :password=>"dragons"
      @token = Oauth2Token.last
    end

    it { @token.should_not be_nil }
    it { @token.should be_authorized }
    
    it "should set user to client_applications user" 

    it "should have added a new token" 


    it "should return json token" 

  end

  describe "oauth2 token for basic credentials with wrong password" do
    before(:each) do
      current_client_application
      @oauth2_token_count = Oauth2Token.count
      post :token, :grant_type=>"password", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :username=>current_user.login, :password=>"bad"
    end

    it "should not have added a new token" 


    it "should return json token" 

  end

  describe "oauth2 token for basic credentials with unknown user" do
    before(:each) do
      current_client_application
      @oauth2_token_count = Oauth2Token.count
      post :token, :grant_type=>"password", :client_id=>current_client_application.key,:client_secret=>current_client_application.secret, :username=>"non existent", :password=>"dragons"
    end

    it "should not have added a new token" 


    it "should return json token" 

  end

end



