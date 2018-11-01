# frozen_string_literal: true

require 'rails_helper'

describe PagesController do
  let(:user) { instance_double('User', id: '1') }
  let(:default_language) { instance_double(Language, code: :en) }
  let(:language) { instance_double(Language, code: :fr) }
  let(:page) { instance_double('Page', published?: true, featured?: true, to_param: 'foo', id: '1', liquid_layout: '3', follow_up_liquid_layout: '4', language: default_language) }
  let(:renderer) do
    instance_double(
      'LiquidRenderer',
      render: 'my rendered html',
      render_follow_up: 'my rendered html',
      personalization_data: { some: 'data' }
    )
  end

  include_examples 'session authentication'

  before do
    ActionController::Parameters.permit_all_parameters = true
    allow(request.env['warden']).to receive(:authenticate!) { user }
    allow(controller).to receive(:current_user) { user }
    allow_any_instance_of(ActionController::TestRequest).to receive(:location).and_return({})
    Settings.home_page_url = 'http://example.com'
  end

  describe 'GET #index' do
    it 'renders index and uses default localization' 

    it 'resets localization if a non-default localization is used' 

  end

  describe 'POST #create' do
    let(:page) { instance_double(Page, valid?: true, language: default_language, id: 1) }

    before do
      allow(PageBuilder).to receive(:create) { page }
      post :create, params: { page: { title: 'Foo Bar' } }
    end

    it 'authenticates session' 


    it 'creates page' 


    context 'successfully created' do
      it 'redirects to edit_page' 

    end

    context 'successfully created' do
      let(:page) { instance_double(Page, valid?: false, language: default_language) }

      it 'redirects to edit_page' 

    end
  end

  describe 'PUT #update' do
    let(:page) { instance_double(Page, language: default_language) }

    before do
      allow(Page).to receive(:find) { page }
      allow(page).to receive(:update)
      allow(LiquidRenderer).to receive(:new) {}
      allow(QueueManager).to receive(:push)
    end

    subject { put :update, params: { id: '1', page: { title: 'bar' } } }

    it 'authenticates session' 


    it 'finds page' 


    it 'updates page' 


    context 'successfully updates' do
      before do
        allow(page).to receive(:update) { true }
      end

      it 'posts to queue' 

    end

    context 'unsuccessfully updates' do
      it 'posts to queue' 

    end
  end

  shared_examples 'show and follow-up' do
    it 'finds campaign page' 


    it 'assigns @data to personalization_data' 


    it 'assigns campaign' 


    it 'redirects to homepage if user not logged in and page unpublished' 


    it 'does not redirect to homepage if user not logged in and page published' 


    it 'does not redirect to homepage if user logged in and page unpublished' 


    it 'does not redirect to homepage if user logged in and page published' 

  end

  describe 'GET #show' do
    subject { get :show, params: { id: '1' } }

    before do
      allow(Page).to            receive(:find) { page }
      allow(page).to            receive(:update)
      allow(page).to            receive(:language_code).and_return('en')
      allow(LiquidRenderer).to  receive(:new) { renderer }
    end

    include_examples 'show and follow-up'

    it 'finds page by un-altered slug' 


    it 'finds page with downcased version of slug' 


    it 'renders show template' 


    it 'redirects to homepage if page is not found' 


    it 'instantiates a LiquidRenderer and calls render' 


    context 'on pages with localization' do
      let(:french_page) do
        instance_double(Page, valid?: true, published?: true, language_code: language.code, id: '42', liquid_layout: '5')
      end
      let(:english_page) do
        instance_double(Page, valid?: true, published?: true, language_code: default_language.code, id: '66', liquid_layout: '5')
      end

      context 'with french' do
        subject { french_page }
        before { allow(Page).to receive(:find) { french_page } }

        it 'sets the locality to :fr' 


        context 'with default (en)' do
          subject { english_page }
          before { allow(Page).to receive(:find) { english_page } }

          it 'sets the locality to :en' 

        end
      end
    end
  end

  describe 'GET #follow-up' do
    before do
      allow(Page).to receive(:find) { page }
      allow(page).to receive(:update)
      allow(page).to receive(:language_code).and_return('en')
      allow(LiquidRenderer).to receive(:new) { renderer }
    end

    shared_examples 'follow-up without redirect' do
      it 'renders follow_up template' 


      it 'raises 404 if page is not found' 


      it 'uses main liquid layout if no follow up set' 


      it 'instantiates a LiquidRenderer and calls render' 

    end

    describe 'with no recognized member' do
      subject { get :follow_up, params: { id: '1' } }

      let(:url_params) { { 'id' => '1', 'controller' => 'pages', 'action' => 'follow_up' } }
      let(:member) { nil }

      include_examples 'show and follow-up'
      include_examples 'follow-up without redirect'
    end

    describe 'with recognized member' do
      let(:member) { create :member }

      before :each do
        cookies.signed[:member_id] = member.id
        allow(controller).to receive(:cookies).and_return(cookies)
      end

      describe 'and member_id' do
        subject { get :follow_up, params: { id: '1', member_id: member.id } }

        let(:url_params) { { 'member_id' => member.id.to_s, 'id' => '1', 'controller' => 'pages', 'action' => 'follow_up' } }

        include_examples 'show and follow-up'
        include_examples 'follow-up without redirect'
      end

      describe 'and no member_id' do
        subject { get :follow_up, params: { id: '1' } }

        it 'redirects to the same route with member id set' 

      end
    end
  end
end

