require 'spec_helper'

describe "Expired user token", reset: true do
  after :each do
    page.set_rack_session(expires_in: nil)
    page.set_rack_session(access_token: nil)
    page.set_rack_session(refresh_token: nil)
  end

  context "Successful refreshing" do
    let(:return_json) {urs_tokens['edsc']['prod']}
    let(:access_token) {return_json['access_token']}

    before :each do
      Capybara.reset_sessions!

      Echo::Client.any_instance.stub(:refresh_token).and_return(OpenStruct.new(body: return_json))
    end

    context 'when loading the page with an expired token' do
      before :each do
        #login without loading a page first
        be_logged_in_as 'expired_token'

        load_page :root
      end

      it "refreshes the token" 

    end

    context 'when calling an ajax request with an expired token' do
      before :each do
        #login without loading a page first
        be_logged_in_as 'expired_token'
        page.set_rack_session(expires_in: 500)

        load_page :root
        wait_for_xhr

        script = "window.tokenExpiresIn = -1;"
        page.execute_script script

        fill_in 'keywords', with: 'AST_L1AE'
        wait_for_xhr
      end

      it 'refreshes the token' 

    end
  end

  context "Unsuccessful refreshing" do
    let(:return_json) {nil}

    before :each do
      Capybara.reset_sessions!

      Echo::Client.any_instance.stub(:refresh_token).and_return(OpenStruct.new(body: return_json))
    end

    context 'when loading the page with an expired token' do
      before :each do
        #login without loading a page first
        be_logged_in_as 'expired_token'
        page.set_rack_session(refresh_token: 'invalid')

        load_page :root
      end

      it "sends the user to login" 

    end

    context 'when calling an ajax request with an expired token' do
      before :each do
        #login without loading a page first
        be_logged_in_as 'expired_token'
        page.set_rack_session(expires_in: 500)
        page.set_rack_session(refresh_token: 'invalid')

        load_page :root
        wait_for_xhr

        script = "window.tokenExpiresIn = -1;"
        page.execute_script script

        fill_in 'keywords', with: 'AST_L1AE'
        wait_for_xhr
      end

      it 'refreshes the token' 

    end
  end
end

