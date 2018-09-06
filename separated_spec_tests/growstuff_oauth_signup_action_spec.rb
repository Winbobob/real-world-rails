require 'rails_helper'
require './lib/actions/oauth_signup_action'

describe 'Growstuff::OauthSignupAction' do
  before :each do
    @action = Growstuff::OauthSignupAction.new
  end

  context 'with a valid authentication' do
    before :each do
      @auth = OmniAuth::AuthHash.new('provider' => 'facebook',
                                     'uid' => '123545',
                                     'info' => {
                                       'name' => "John Testerson's Brother",
                                       'nickname' => 'JohnnyB',
                                       'email' => 'example.oauth.facebook@example.com',
                                       'image' => 'http://findicons.com/files/icons/1072/face_avatars/300/i04.png'
                                     },
                                     'credentials' => {
                                       'token' => "token",
                                       'secret' => "donttell"
                                     })
    end

    context 'no existing user' do
      before :each do
        @auth['info']['email'] = 'no.existing.user@gmail.com'

        Member.where(email: @auth['info']['email']).delete_all

        @member = @action.find_or_create_from_authorization(@auth)
        @authentication = @action.establish_authentication(@auth, @member)
      end

      after :each do
        @member.delete
        @authentication.delete
      end

      it 'should create a new user' 


      it 'should set the right email' 


      it 'should generate a login_name' 


      it 'should set an avatar' 


      it 'should generate a random password' 


      it 'should not agree to the tos' 


      it 'should store the uid and provider for the member' 

    end

    context 'an existing user' do
      context 'who has never used oauth' do
        before :each do
          @auth['info']['email'] = 'never.used.oauth@yahoo.com'

          Member.where(email: @auth['info']['email']).delete_all
          @existing_member = create :member,             email: @auth['info']['email'],
                                                         login_name: 'existing',
                                                         preferred_avatar_uri: 'http://cl.jroo.me/z3/W/H/K/e/a.baa-very-cool-hat-you-.jpg'

          @member = @action.find_or_create_from_authorization(@auth)
          @authentication = @action.establish_authentication(@auth, @member)
        end

        after :each do
          @existing_member.delete
          @member.delete
          @authentication.delete
        end

        it 'should not create a new user' 


        it 'should locate the existing member by email' 


        it 'should not generate a login_name' 


        it 'should not change the avatar' 


        it 'should store the uid and provider for the member' 

      end

      context 'who has used oauth' do
        before :each do
          @auth['info']['email'] = 'i.used.oauth.once@coolemail.com'

          Member.where(email: @auth['info']['email']).delete_all
          Authentication.delete_all

          @existing_member = create :member, email: @auth['info']['email'],
                                             login_name: 'schrodingerscat',
                                             preferred_avatar_uri: 'http://cl.jroo.me/z3/W/H/K/e/a.baa-very-cool-hat-you-.jpg'

          @existing_authentication = @existing_member.authentications.create(provider: 'facebook',
                                                                             uid: '123545',
                                                                             name: "John Testerson's Brother",
                                                                             member_id: @existing_member.id)

          @member = @action.find_or_create_from_authorization(@auth)
          @authentication = @action.establish_authentication(@auth, @member)
        end

        after :each do
          @existing_member.delete
          @member.delete
          @existing_authentication.delete
          @authentication.delete
        end

        it 'should not create a new user' 


        it 'should locate the existing member by uid and provider' 


        it 'should not generate a login_name' 


        it 'should not change the avatar' 


        it 'should locate the existing uid and provider for the member' 

      end
    end
  end
end

