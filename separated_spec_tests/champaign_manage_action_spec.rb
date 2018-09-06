# frozen_string_literal: true

require 'rails_helper'

describe ManageAction do
  before do
    allow(ChampaignQueue).to receive(:push)
    allow(Analytics::Page).to receive(:increment)
  end

  let(:page) { create(:page, title: 'Foo Bar') }
  let(:data) { { email: 'bob@example.com', page_id: page.id, referring_akid: '123.456.xyz' } }
  let(:first_name) { { first_name: 'Bobtholomew' } }
  let(:extraneous) { { is_delta_shareholder: true, eye_color: 'hazel' } }

  before do
    allow(ChampaignQueue).to receive(:push)
  end

  describe '.create' do
    subject { ManageAction.create(data) }

    it 'creates an action' 


    it 'posts action to queue' 


    describe 'new member' do
      it 'creates an member' 


      it 'saves available fields to member' 


      it 'creates an member even with extraneous fields' 


      it 'saves available fields even with extraneous fields' 


      it 'ignores a sent id parameter' 

    end

    describe 'existing member' do
      before :each do
        @existing = create :member, email: data[:email]
      end

      it 'does not change the number of members' 


      it 'saves all new fields to member' 


      it 'is not bothered by fields not saveable to member' 


      it 'does not touch existing fields if not included' 


      it 'does not overwrite existing fields with nil' 


      it 'does not create an Member if sent an id parameter' 


      it 'ignores a sent id parameter' 

    end

    context 'action already exists' do
      before do
        @action = ManageAction.create(data)
      end

      it 'returns existing action' 


      it 'does not post to queue' 

    end

    context 'page permits duplicate actions' do
      before do
        page.update(allow_duplicate_actions: true)
        @action = ManageAction.create(data)
      end

      it 'returns new action' 


      it 'posts to queue' 

    end
  end
end

