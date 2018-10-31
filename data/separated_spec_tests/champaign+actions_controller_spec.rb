# frozen_string_literal: true

require 'rails_helper'

describe Api::ActionsController do
  describe 'POST create' do
    let(:form) { instance_double('Form', form_elements: [double(name: 'foo')]) }
    let(:page) { instance_double('Page', id: 2) }
    let(:member) { instance_double('Member', id: 12) }
    let(:action) { instance_double('Action', member_id: member.id, member: member) }
    let(:follower) { instance_double('PageFollower', follow_up_path: '/asdf?member_id=12345') }

    before :each do
      allow(Form).to receive(:find) { form }
      allow(Page).to receive(:find) { page }
      allow(PageFollower).to receive(:new_from_page) { follower }
      allow(ManageAction).to receive(:create) { action }
      allow(controller).to receive(:localize_from_page_id)
    end

    let(:validator) { instance_double('FormValidator', valid?: true, errors: []) }

    before do
      allow(FormValidator).to receive(:new) { validator }
    end

    describe 'successful' do
      before do
        allow(controller).to receive(:verify_authenticity_token)
        post :create, params: { page_id: 2, form_id: 3, foo: 'bar' }
      end

      it 'does not verify authenticity token' 


      it 'finds form' 


      it 'delegates to Action with params' 


      it 'responds with an empty hash' 


      it 'sets the cookie' 


      it 'attemptes to localize the page' 

    end

    describe 'filtering' do
      it 'does not permit params not in the form' 

    end

    describe 'URL params' do
      before do
        post :create, params: { page_id: 2, form_id: 3, foo: 'bar', source: 'FB', akid: '123.456.rfs' }
      end

      it 'takes source' 


      it 'takes akid' 

    end

    describe 'unsuccessful' do
      let(:validator) { instance_double('FormValidator', valid?: false, errors: [['my field', 'my error']]) }

      before :each do
        allow(FormValidator).to receive(:new) { validator }
        post :create, params: { page_id: 2, form_id: 3, foo: 'bar' }
      end

      it 'does not create an action' 


      it 'displays the errors' 


      it 'does not set the cookie' 

    end
  end

  describe 'POST validate' do
    let(:form) { instance_double('Form', form_elements: [double(name: 'foo')]) }

    before :each do
      allow(Form).to receive(:find) { form }
      allow(ManageAction).to receive(:create)
      allow(controller).to receive(:localize_from_page_id)
    end

    describe 'successful' do
      let(:validator) { instance_double('FormValidator', valid?: true, errors: []) }

      before do
        allow(FormValidator).to receive(:new) { validator }
        post :validate, params: { page_id: 2, form_id: 3, foo: 'bar' }
      end

      it 'finds form' 


      it 'checkes validity' 


      it 'does not create an action' 


      it 'responds with empty json' 


      it 'does not set the cookie' 


      it 'attemptes to localize the page' 

    end

    describe 'filtering' do
      it 'does not permit params not in the form' 

    end

    describe 'unsuccessful' do
      let(:validator) { instance_double('FormValidator', valid?: false, errors: [['my field', 'my error']]) }

      before :each do
        allow(FormValidator).to receive(:new) { validator }
        post :validate, params: { page_id: 2, form_id: 3, foo: 'bar' }
      end

      it 'does not create an action' 


      it 'displays the errors' 


      it 'does not set the cookie' 

    end
  end

  describe 'PUT update' do
    let!(:a) { create :action }

    describe 'successful' do
      it 'returns 200' 


      it 'changes the status to published' 


      it 'changes the status to hidden' 


      it 'changes the status to default' 

    end

    describe 'unsuccessful' do
      let!(:a) { create :action }

      it 'raises not found if no action is found with that id' 


      it 'returns errors and 422 if given an invalid publish_status' 


      it 'does not update the action when given an invalid publish_status' 

    end
  end
end

