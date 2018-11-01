# frozen_string_literal: true

require 'spec_helper'

describe ProposalsController do
  let(:user) { create(:user) }
  let(:conference) { create(:conference, short_title: 'lama101') }
  let(:event) { create(:event, program: conference.program) }
  let(:event_type) { create :event_type }

  context 'user is not signed in' do
    describe 'GET #new' do
      before do
        # We allow new proposal only if program has open cfp
        create(:cfp, program: conference.program)
        get :new, conference_id: conference.short_title
      end

      it 'assigns user and url variables' 


      it 'renders new template' 

    end

    describe 'POST #create' do
      # We allow proposal create only if program has open cfp
      before { create(:cfp, program: conference.program) }

      it 'assigns url variables' 


      context 'user is saved successfully' do
        describe 'user related actions' do
          before do
            @new_user = attributes_for(:user)
            post :create, event: attributes_for(:event, event_type_id: event_type.id),
                          conference_id: conference.short_title,
                          user: @new_user
          end

          it 'creates new user' 


          it 'signs in new user' 

        end

        context 'creates proposal successfully' do
          before(:each, run: true) do
            @new_user = attributes_for(:user)
            post :create, event: attributes_for(:event, event_type_id: event_type.id),
                          conference_id: conference.short_title,
                          user: @new_user
          end

          it 'assigns event variable', run: true do
            expect(assigns(:event)).not_to be_nil
          end

          it 'assigns program to event', run: true do
            expect(assigns(:event).program).to eq conference.program
          end

          it 'assigns submitter and speaker to event', run: true do
            expect(assigns(:event).submitter.username).to eq @new_user[:username]
            expect(assigns(:event).speakers.first.username).to eq @new_user[:username]
          end

          it 'redirects to proposal index path', run: true do
            expect(response).to redirect_to conference_program_proposals_path conference.short_title
          end

          it 'shows success message in flash notice', run: true do
            expect(flash[:notice]).to match('Proposal was successfully submitted.')
          end

          it 'creates new event' 

        end

        context 'proposal save fails' do
          before(:each, run: true) do
            allow_any_instance_of(Event).to receive(:save).and_return(false)
            post :create, event: attributes_for(:event, event_type_id: event_type.id),
                          conference_id: conference.short_title,
                          user: attributes_for(:user)
          end

          it 'renders new template', run: true do
            expect(response).to render_template('new')
          end

          it 'shows error in flash message', run: true do
            expect(flash[:error]).to match("Could not submit proposal: #{event.errors.full_messages.join(', ')}")
          end

          it 'does not create new proposal' 

        end
      end

      context 'user save fails' do
        before { allow_any_instance_of(User).to receive(:save).and_return(false) }

        it 'does not create new user' 


        it 'does not create new event' 


        describe 'response' do
          before do
            post :create, event: attributes_for(:event, event_type_id: event_type.id),
                          conference_id: conference.short_title,
                          user: attributes_for(:user)
          end

          it 'renders new template' 


          it 'shows error in flash message' 

        end
      end
    end
  end

  context 'event submitter is signed in' do
    before do
      sign_in event.submitter
    end

    describe 'GET #index' do
      before { get :index, conference_id: conference.short_title }

      it 'assigns conference, program and events variables' 


      it 'renders index template' 

    end

    describe 'GET #show' do
      before do
        get :show, conference_id: conference.short_title, id: event.id
      end

      it 'assigns event variable' 


      it 'renders show template' 

    end

    describe 'GET #new' do
      before do
        # We allow new proposal only if program has open cfp
        create(:cfp, program: conference.program)
        get :new, conference_id: conference.short_title
      end

      it 'assigns user and url variables' 


      it 'renders new template' 

    end

    describe 'GET #edit' do
      before do
        get :edit, conference_id: conference.short_title, id: event.id
      end

      it 'assigns event and url variables' 


      it 'renders edit template' 

    end

    describe 'POST #create' do
      # We allow proposal create only if program has open cfp
      before { create(:cfp, program: conference.program) }

      it 'assigns url variables' 


      context 'creates proposal successfully' do
        before(:each, run: true) do
          post :create, event: attributes_for(:event, event_type_id: event_type.id),
                        conference_id: conference.short_title
        end

        it 'assigns event variable', run: true do
          expect(assigns(:event)).not_to be_nil
        end

        it 'assigns program to event', run: true do
          expect(assigns(:event).program).to eq conference.program
        end

        it 'assigns submitter and speaker to event', run: true do
          expect(assigns(:event).submitter).to eq event.submitter
          expect(assigns(:event).speakers.first).to eq event.submitter
        end

        it 'redirects to proposal index path', run: true do
          expect(response).to redirect_to conference_program_proposals_path conference.short_title
        end

        it 'shows success message in flash notice', run: true do
          expect(flash[:notice]).to match('Proposal was successfully submitted.')
        end

        it 'creates new event' 

      end

      context 'proposal save fails' do
        before(:each, run: true) do
          allow_any_instance_of(Event).to receive(:save).and_return(false)
          post :create, event: attributes_for(:event, event_type_id: event_type.id),
                        conference_id: conference.short_title
        end

        it 'renders new template', run: true do
          expect(response).to render_template('new')
        end

        it 'shows error in flash message', run: true do
          expect(flash[:error]).to match("Could not submit proposal: #{event.errors.full_messages.join(', ')}")
        end

        it 'does not create new proposal' 

      end
    end

    describe 'PATCH #update' do

      it 'assigns url variable' 


      context 'updates successfully' do
        before do
          patch :update, event: attributes_for(:event, title: 'some title', event_type_id: event_type.id),
                         conference_id: conference.short_title,
                         id: event.id
        end

        it 'updates the proposal' 


        it 'redirects to proposal index path' 


        it 'shows success message in flash notice' 

      end

      context 'update fails' do
        before do
          allow_any_instance_of(Event).to receive(:save).and_return(false)
          patch :update, event: attributes_for(:event, title: 'some title', event_type_id: event_type.id),
                         conference_id: conference.short_title,
                         id: event.id
        end

        it 'does not update the proposal' 


        it 'renders edit template' 


        it 'shows error in flash message', run: true do
          expect(flash[:error]).to match("Could not update proposal: #{event.errors.full_messages.join(', ')}")
        end
      end
    end

    describe 'PATCH #withdraw' do

      it 'assigns url variable' 


      context 'withdraws successfully' do
        before do
          patch :withdraw, conference_id: conference.short_title, id: event.id
        end

        it 'changes state of event to withdrawn' 


        it 'redirects to proposal index path' 


        it 'shows success message in flash notice' 

      end

      context 'event withdraw fails' do
        before do
          request.env['HTTP_REFERER'] = '/'
          allow_any_instance_of(Event).to receive(:withdraw).and_raise(Transitions::InvalidTransition)
          patch :withdraw, conference_id: conference.short_title, id: event.id
        end

        it 'does not withdraw event' 


        it 'redirects to previous path' 


        it 'shows error in flash message' 

      end

      context 'event save fails' do
        before do
          allow_any_instance_of(Event).to receive(:save).and_return(false)
          patch :withdraw, conference_id: conference.short_title, id: event.id
        end

        it 'does not withdraw event' 


        it 'redirects to proposal index path' 


        it 'shows error in flash message' 

      end
    end

    describe 'PATCH #confirm' do
      before { event.update_attributes(state: 'unconfirmed') }

      context 'confirmed successfully' do
        describe 'when require_registration is set' do
          before :each do
            event.require_registration = true
            event.max_attendees = nil
            event.save!
            patch :confirm, conference_id: conference.short_title, id: event.id
          end

          it 'assigns url variable' 


          it 'change state of event to confirmed' 

        end

        describe 'general actions' do
          before { patch :confirm, conference_id: conference.short_title, id: event.id }

          it 'assigns url variable' 


          it 'change state of event to confirmed' 

        end

        context 'user has registered for the conference' do
          before do
            create(:registration, conference: conference, user: event.submitter)
            patch :confirm, conference_id: conference.short_title, id: event.id
          end

          it 'redirects to proposal index path' 


          it 'shows success message in flash notice' 

        end

        context 'user has not registered for the conference' do
          before do
            patch :confirm, conference_id: conference.short_title, id: event.id
          end

          it 'redirects to new registration path' 


          it 'shows flash alert asking user to register' 

        end
      end

      context 'event confirm fails' do
        before do
          request.env['HTTP_REFERER'] = '/'
          allow_any_instance_of(Event).to receive(:confirm).and_raise(Transitions::InvalidTransition)
          patch :confirm, conference_id: conference.short_title, id: event.id
        end

        it 'does not confirm event' 


        it 'redirects to previous path' 


        it 'shows error in flash message' 

      end

      context 'event save fails' do
        before do
          event.update_attributes(state: 'unconfirmed')
          allow_any_instance_of(Event).to receive(:save).and_return(false)
          patch :confirm, conference_id: conference.short_title, id: event.id
        end

        it 'does not confirm event' 


        it 'redirects to proposal index path' 


        it 'shows error in flash message' 

      end
    end

    describe 'PATCH #restart' do
      before { event.update_attributes(state: 'withdrawn') }

      it 'assigns url variable' 


      context 'resubmits successfully' do
        before do
          patch :restart, conference_id: conference.short_title, id: event.id
        end

        it 'changes state of event to new' 


        it 'redirects to proposal index path' 


        it 'shows success message in flash notice' 

      end

      context 'event resubmission fails' do
        before do
          allow_any_instance_of(Event).to receive(:restart).and_raise(Transitions::InvalidTransition)
          patch :restart, conference_id: conference.short_title, id: event.id
        end

        it 'does not change state of event to new' 


        it 'redirects to proposal index path' 


        it 'shows error in flash message' 

      end

      context 'event save fails' do
        before do
          allow_any_instance_of(Event).to receive(:save).and_return(false)
          patch :restart, conference_id: conference.short_title, id: event.id
        end

        it 'does not change state of event to new' 


        it 'redirects to proposal index path' 


        it 'shows error in flash message' 

      end
    end
  end
end

