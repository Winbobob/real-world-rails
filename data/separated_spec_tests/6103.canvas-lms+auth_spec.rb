#
# Copyright (C) 2011 - 2014 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')
require 'imperium/testing'

describe "API Authentication", type: :request do

  before :once do
    @key = DeveloperKey.create!
    enable_developer_key_account_binding!(@key)
  end

  before :each do
    @client_id = @key.id
    @client_secret = @key.api_key
    consider_all_requests_local(false)
    enable_forgery_protection
  end

  after do
    consider_all_requests_local(true)
  end

  if Canvas.redis_enabled? # eventually we're going to have to just require redis to run the specs
    it "should require a valid client id" 


    it "should require a valid code to get an access_token" 


    describe "session authentication" do
      before :once do
        user_with_pseudonym(:active_user => true, :username => 'test1@example.com', :password => 'test1234')
        course_with_teacher(:user => @user)
      end

      before :each do
        # Trust the referer
        allow_any_instance_of(Account).to receive(:trusted_referer?).and_return(true)
        post '/login/canvas', params: {'pseudonym_session[unique_id]' => 'test1@example.com', 'pseudonym_session[password]' => 'test1234'}
      end

       it "should not need developer key when we have an actual application session" 
       it "should have anti-crsf meausre in normal session" 
      it "should not allow post without authenticity token in application session" 


      it "should allow post with cookie authenticity token in application session" 


      it "should not allow replacing the authenticity token with api_key without basic auth" 

    end

    describe "basic authentication" do
      before :once do
        user_with_pseudonym(:active_user => true, :username => 'test1@example.com', :password => 'test1234')
        course_with_teacher(:user => @user)
      end

      it "should not allow basic auth with api key" 

    end

    describe "oauth2 native app flow" do
      def flow(opts = {})
        enable_forgery_protection do
          user_with_pseudonym(:active_user => true, :username => 'test1@example.com', :password => 'test1234')
          course_with_teacher(:user => @user)

          # step 1
          get "/login/oauth2/auth", params: {:response_type => 'code', :client_id => @client_id, :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob', :purpose => 'fun'}
          expect(response).to redirect_to(login_url)

          yield

          # step 3
          expect(response).to be_redirect
          expect(response['Location']).to match(%r{/login/oauth2/confirm$})
          get response['Location']
          expect(response).to render_template("oauth2_provider/confirm")

          post "/login/oauth2/accept", params: { :authenticity_token => cookies['_csrf_token'] }

          expect(response).to be_redirect
          expect(response['Location']).to match(%r{/login/oauth2/auth\?})
          code = response['Location'].match(/code=([^\?&]+)/)[1]
          expect(code).to be_present

          # we have the code, we can close the browser session
          post "/login/oauth2/token", params: {:client_id => @client_id, :client_secret => @client_secret, :code => code}
          expect(response).to be_successful
          expect(response.header[content_type_key]).to eq 'application/json; charset=utf-8'
          json = JSON.parse(response.body)
          token = json['access_token']
          expect(json['user']).to eq({ 'id' => @user.id, 'global_id' => @user.global_id.to_s, 'name' => 'test1@example.com' })
          reset!

          # try an api call
          get "/api/v1/courses.json?access_token=1234"
          expect(response.response_code).to eq 401

          get "/api/v1/courses.json?access_token=#{token}"
          expect(response).to be_successful
          json = JSON.parse(response.body)
          expect(json.size).to eq 1
          expect(json.first['enrollments']).to eq [{'type' => 'teacher', 'role' => 'TeacherEnrollment', 'role_id' => teacher_role.id, 'user_id' => @user.id, 'enrollment_state' => 'invited'}]
          expect(AccessToken.authenticate(token)).to eq AccessToken.last
          expect(AccessToken.last.purpose).to eq 'fun'

          # post requests should work with nothing but an access token
          post "/api/v1/courses/#{@course.id}/assignments.json?access_token=1234", params: { :assignment => { :name => 'test assignment', :points_possible => '5.3', :grading_type => 'points' } }
          expect(response.response_code).to eq 401
          post "/api/v1/courses/#{@course.id}/assignments.json?access_token=#{token}", params: { :assignment => { :name => 'test assignment', :points_possible => '5.3', :grading_type => 'points' } }
          expect(response).to be_successful
          expect(@course.assignments.count).to eq 1
          expect(@course.assignments.first.title).to eq 'test assignment'
          expect(@course.assignments.first.points_possible).to eq 5.3
        end
      end

      it "should not prepend the csrf protection even if the post has a session" 


      it "should execute for password/ldap login" 


      it "should execute for saml login" 


      it "should execute for cas login" 


      it "should not require logging in again, or log out afterwards" 


      it "should redirect with access_denied if the user doesn't accept" 


      it "should require the correct client secret" 


      it "works when the user logs in via a session_token" 


      context "sharding" do
        specs_require_sharding

        it "should create the access token on the same shard as the user" 

      end
    end

    describe "oauth2 web app flow" do
      it "should require the developer key to have a redirect_uri" 


      it "should require the redirect_uri domains to match" 


      context "untrusted developer key" do
        def login_and_confirm(create_token=false)
          enable_forgery_protection do
            enable_cache do
              user_with_pseudonym(:active_user => true, :username => 'test1@example.com', :password => 'test1234')
              course_with_teacher(:user => @user)
              @key.update_attribute :redirect_uri, 'http://www.example.com/oauth2response'
              if create_token
                @user.access_tokens.create!(developer_key: @key)
              end

              get "/login/oauth2/auth", params: {:response_type => 'code', :client_id => @client_id, :redirect_uri => "http://www.example.com/my_uri"}
              expect(response).to redirect_to(login_url)

              follow_redirect!
              expect(response).to be_redirect
              follow_redirect!
              expect(response).to be_successful
              allow_any_instance_of(Account).to receive(:trusted_referer?).and_return(true)
              post "/login/canvas", params: {:pseudonym_session => {:unique_id => 'test1@example.com', :password => 'test1234'}}

              expect(response).to be_redirect
              expect(response['Location']).to match(%r{/login/oauth2/confirm$})
              get response['Location']
              post "/login/oauth2/accept", params: {:authenticity_token => cookies['_csrf_token']}

              expect(response).to be_redirect
              expect(response['Location']).to match(%r{http://www.example.com/my_uri?})
              code = response['Location'].match(/code=([^\?&]+)/)[1]
              expect(code).to be_present

              # exchange the code for the token
              post "/login/oauth2/token", params: {:code => code},
                headers: {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(@client_id, @client_secret)}
              expect(response).to be_successful
              expect(response.header[content_type_key]).to eq 'application/json; charset=utf-8'
              json = JSON.parse(response.body)
              token = json['access_token']
              reset!

              # try an api call
              get "/api/v1/courses.json?access_token=#{token}"
              expect(response).to be_successful
              json = JSON.parse(response.body)
              expect(json.size).to eq 1
              expect(json.first['enrollments']).to eq [{'type' => 'teacher', 'role' => 'TeacherEnrollment', 'role_id' => teacher_role.id, 'user_id' => @user.id, 'enrollment_state' => 'invited'}]
              expect(AccessToken.last).to eq AccessToken.authenticate(token)
            end
          end
        end

        it "should enable the web app flow" 


        it "should enable the web app flow if token already exists" 


        it "Shouldn't allow an account level dev key to auth with other account's user" 

      end

      context "trusted developer key" do
        def trusted_exchange(create_token=false)
          @key.trusted = true
          @key.save!

          enable_forgery_protection do
            enable_cache do
              user_with_pseudonym(:active_user => true, :username => 'test1@example.com', :password => 'test1234')
              course_with_teacher_logged_in(:user => @user)
              @key.update_attribute :redirect_uri, 'http://www.example.com/oauth2response'
              if create_token
                @user.access_tokens.create!(developer_key: @key)
              end

              get "/login/oauth2/auth", params: {:response_type => 'code', :client_id => @client_id, :redirect_uri => "http://www.example.com/my_uri"}
              expect(response).to be_redirect
              expect(response['Location']).to match(%r{http://www.example.com/my_uri?})
              code = response['Location'].match(/code=([^\?&]+)/)[1]
              expect(code).to be_present

              # exchange the code for the token
              post "/login/oauth2/token", params: {:code => code},
                headers: {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(@client_id, @client_secret)}
              expect(response).to be_successful
              expect(response.header[content_type_key]).to eq 'application/json; charset=utf-8'
              JSON.parse(response.body)
            end
          end
        end

        it "should give first token" 


        it "should give second token if not force_token_reuse" 


        it "should not give second token if force_token_reuse" 

      end
    end
  end

  describe "services JWT" do
    include_context "JWT setup"

    before :once do
      user_params = {
        active_user: true,
        username: 'test1@example.com',
        password: 'test1234'
      }
      user_obj = user_with_pseudonym(user_params)
      course_with_teacher(user: user_obj)
    end

    def wrapped_jwt_from_service(payload={sub: @user.global_id})
      services_jwt = Canvas::Security::ServicesJwt.generate(payload, false)
      payload = {
        iss: "some other service",
        user_token: services_jwt
      }
      wrapped_jwt = Canvas::Security.create_jwt(payload, nil, fake_signing_secret)
      Canvas::Security.base64_encode(wrapped_jwt)
    end

    it "allows API access with a wrapped JWT" 


    it "allows access for a JWT masquerading user" 


    it "errors if the JWT is expired" 


    it "requires an active pseudonym" 


    it "falls through to checking access token for non-JWT but JWT-like strings" 


  end

  describe "access token" do
    before :once do
      user_with_pseudonym(:active_user => true, :username => 'test1@example.com', :password => 'test1234')
      course_with_teacher(:user => @user)
      @token = @user.access_tokens.create!(developer_key: @key)
    end

    def check_used
      expect(@token.last_used_at).to be_nil
      yield
      expect(response).to be_successful
      expect(@token.reload.last_used_at).not_to be_nil
    end

    it "should allow passing the access token in the query string" 


    it "should allow passing the access token in the authorization header" 


    it "recovers gracefully if consul is missing encryption data" 


    it "should allow passing the access token in the post body" 


    it "should error if the access token is expired or non-existent" 


    it "should error if the developer key is inactive" 


    it "should require an active pseudonym for the access token user" 


    it "should error if no access token is given and authorization is required" 


    it "should be able to log out" 


    context "account access" do
      before :once do
        @account = Account.create!

        @sub_account1 = @account.sub_accounts.create!
        @sub_account2 = @account.sub_accounts.create!

        @not_sub_account = Account.create!
        @key = DeveloperKey.create!(:redirect_uri => "http://example.com/a/b", account: @account)
      end

      it "Should allow a token previously linked to a dev key same account to work" 


      it "Should allow a token previously linked to a dev key allowed sub account to work" 


      it "Shouldn't allow a token previously linked to a dev key on foreign account to work" 

    end

    context "sharding" do
      specs_require_sharding

      it "should work for an access token from a different shard with the developer key on the default shard" 


      it "shouldn't work for an access token from the default shard with the developer key on the different shard" 

    end
  end

  describe "as_user_id" do
    before :once do
      course_with_teacher(:active_all => true)
      @course1 = @course
      course_with_student(:user => @user, :active_all => true)
      user_with_pseudonym(:user => @student, :username => "blah@example.com")
      @student_pseudonym = @pseudonym
      @course2 = @course
    end

    it "should allow as_user_id" 


    it "should allow sis_user_id as an as_user_id" 


    it "should allow integration_id as an as_user_id" 


    it "should not be silent about an unknown as_user_id" 


    it "should not allow non-admins to become other people" 

  end

  describe "CSRF protection" do
    before :once do
      course_with_teacher(:active_all => true)
      @course1 = @course
      course_with_student(:user => @user, :active_all => true)
      @course2 = @course
    end

    it "should not prepend the CSRF protection to API requests" 


    it "should prepend the CSRF protection for API endpoints, when session auth is used" 

  end
end

