# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HelpController do
  render_views

  describe 'GET #index' do

    it 'redirects to the about page' 


  end

  describe 'GET #unhappy' do
    let(:info_request){ FactoryBot.create(:info_request) }

    it 'shows the unhappy template' 


    it 'does not assign an info_request' 


    context 'when a url_title param is supplied' do

      it 'assigns the info_request' 


      it 'raises an ActiveRecord::RecordNotFound error if the InfoRequest
          is not found' do
        expect{ get :unhappy, :url_title => 'something_not_existing' }
          .to raise_error ActiveRecord::RecordNotFound
      end

      it 'raises an ActiveRecord::RecordNotFound error if the InfoRequest
          is embargoed' do
        info_request = FactoryBot.create(:embargoed_request)
        expect{ get :unhappy, :url_title => info_request.url_title }
          .to raise_error ActiveRecord::RecordNotFound
      end
    end

  end

  describe 'GET #about' do

    it 'shows the about page' 


  end

  describe 'GET #contact' do

    it 'shows contact form' 


    context 'when the user is a pro' do
      let(:pro_user) { FactoryBot.create(:pro_user) }

      before do
        session[:user_id] = pro_user.id
      end

      it 'sets @contact_email to the pro contact address' 

    end

    context 'when the user is a normal user' do
      let(:user) { FactoryBot.create(:user) }

      before do
        session[:user_id] = user.id
      end

      it 'sets @contact_email to the normal contact address' 

    end

    context 'when the user is logged out' do
      it 'sets @contact_email to the normal contact address' 

    end

    describe 'when requesting a page in a supported locale' do

      before do
        # Prepend our fixture templates
        fixture_theme_path = File.join(Rails.root, 'spec', 'fixtures', 'theme_views', 'theme_one')
        controller.prepend_view_path fixture_theme_path
      end

      it 'should render the locale-specific template if available' 


    end

    context 'when a last_request_id cookie is set' do
      let(:info_request){ FactoryBot.create(:info_request) }

      context "when the user can access the specified request" do
        it 'assigns @last_request' 

      end

      context "when the user can't access the specified request" do
        it 'sets @last_request to nil' 

      end

      context "when the request cannot be found" do
        it 'sets @last_request to nil' 

      end
    end

    context 'when a last_body_id cookie is set' do
      let(:body){ FactoryBot.create(:public_body) }

      it 'assigns @last_body' 


      context "when the body cannot be found" do
        it 'sets @last_body to nil' 

      end
    end

  end

  describe 'POST #contact' do

    it 'sends a contact message' 


    it 'has rudimentary spam protection' 


    it 'renders the form when no params are supplied' 


    it 'does not accept a form without a comment param' 


  end

end

