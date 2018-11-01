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

    describe 'consent' do
      let(:extra_params) { {} }

      shared_examples 'regular action creation' do
        it 'creates an action' 


        it 'creates a member' 


        it 'publishes an event' 

      end

      context 'for an existing member' do
        let!(:member) { create(:member, email: 'bob@example.com') }
        let(:params) { { email: 'bob@example.com', first_name: 'Bob', page_id: page.id } }

        context 'that gives consent' do
          before { params[:consented] = true }

          it 'creates an action' 


          it 'updates the member' 


          it 'publishes an event' 

        end

        context "that explicitly doesn't give consent" do
          before { params[:consented] = false }

          it 'creates an action' 


          it 'updates the member' 


          it 'publishes an event' 

        end
      end

      context 'for a new user' do
        describe 'when Germany or Austria are selected and the action is a petition' do
          let(:page) { create(:page, :with_petition) }
          let(:params) { { email: 'bob@example.com', name: 'Bob', country: 'DE', page_id: page.id } }

          before do
            allow(PendingActionService).to receive(:create)
          end

          it 'defers to PendingActionService' 

        end

        describe 'given a EEA country is selected and the action is not a donation' do
          let(:params) { { email: 'bob@example.com', name: 'Bob', country: 'FR', page_id: page.id } }

          context 'that gives consent' do
            before { params[:consented] = true }
            include_examples 'regular action creation'

            it 'updates the consented flag on the member' 

          end

          context "that doesn't give consent" do
            before { params[:consented] = false }
            it "creates an action, only saving the user's name" 


            it "doesn't create a member" 


            it "doesn't publish an event" 

          end
        end

        context 'given a non EEA country is selected and no consent is given' do
          let(:params) { { email: 'bob@example.com', country: 'AR', page_id: page.id } }

          include_examples 'regular action creation'
        end

        context 'given it is a donation action and no consent is given' do
          let(:params) { { email: 'bob@example.com', country: 'DE', page_id: page.id } }
          let(:extra_params) { { donation: true } }

          include_examples 'regular action creation'
        end
      end
    end
  end
end

