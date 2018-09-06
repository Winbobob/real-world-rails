require 'spec_helper'

describe UsersController, :type => :controller do

  describe '#index' do
    it 'should return a status code of 200' 


    it 'should assign the results of the search to @users' 

  end

  describe '#new' do
    before do
      @user = User.new
    end

    it 'new creates a User object" 'do
      expect(@user).to be_an_instance_of User
    end
  end

  describe '#show' do
    before do
      @projects = build_stubbed_list(:project, 3)
      @user = build_stubbed(:user)
      allow(@user).to receive(:following_by_type).and_return(@projects)
      allow(@user).to receive(:skill_list).and_return([])
      User.stub_chain(:friendly, :find).and_return(@user)
      allow(@user).to receive(:bio).and_return('test_bio')
    end

    context 'with a public profile' do
      before(:each) do
        object = double('object')
        expect(EventInstance).to receive(:where).with(user_id: @user.id).and_return(object)
        object2 = double('object2')
        expect(object).to receive(:order).with(created_at: :desc).and_return(object2)
        expect(object2).to receive(:limit).with(5).and_return('videos')
        get 'show', params: { id: @user.friendly_id }
      end

      it 'assigns a user instance' 


      it 'assigns youtube videos' 


      it 'renders the show view' 

    end

    context 'with a private profile' do
      before do
        allow(@user).to receive(:display_profile).and_return(false)
      end

      it 'it renders an error message when accessing a private profile' 

    end
  end

  describe 'send hire me button message' do

    let(:mail) { ActionMailer::Base.deliveries }

    before(:each) do
      @user = build_stubbed(:user, display_hire_me: true)
      allow(User).to receive(:find).with(@user.id.to_s).and_return(@user)
      request.env['HTTP_REFERER'] = 'back'
      mail.clear
    end

    let(:valid_params) do
      {
          message_form: {
              name: 'Thomas',
              email: 'example@example.com',
              message: 'This is a message just for you',
              recipient_id: @user.id
          }
      }
    end

    context 'with valid parameters' do
      before(:each) { post :hire_me_contact_form, params: valid_params }

      it 'should redirect to the previous page' 


      it 'should respond with "Your message has been sent successfully!"' 


      it 'should send out an email to the user' 


      it 'should respond with "Your message has not been sent!" if the message was not delivered successfully' 

    end

    context 'with invalid parameters' do

      context 'empty form fields' do
        before(:each) { post :hire_me_contact_form, params: { message_form: { name: '', email: '', message: '' } } }

        it 'should redirect to the previous page' 


        it 'should respond with "Please fill in Name, Email and Message field"' 

      end

      context 'invalid email address' do
        before(:each) { post :hire_me_contact_form, params: { message_form: { name: 'Thomas', email: 'example@example..com', message: 'This is a message just for you', recipient_id: @user.id } } }

        it 'should redirect to the previous page' 


        it 'should respond with "Please give a valid email address"' 

      end
    end

    context 'with spam trap field filled out' do

      before(:each) { post :hire_me_contact_form, params: { message_form: { name: 'Thomas', email: 'example@example.com', message: 'spam', fellforit: 'I am a spammer!',  recipient_id: @user.id } } }

      it 'should redirect to the home page' 


      it 'should not send an email' 


      it 'should respond with "Form not submitted. Are you human?' 

    end

    context 'when recipent has disabled hire me functionality' do
      before(:each) do
        allow(@user).to receive(:display_hire_me).and_return(false)
        post :hire_me_contact_form, params: { message_form: { name: 'Thomas', email: 'example@example.com', message: 'test', recipient_id: @user.id } }
      end

      it 'should redirect to the previous page' 


      it 'should respond with appropriate error message' 


      it 'should not send an email' 

    end

    context 'with empty parameters' do

      it 'should not fail with empty params' 


      it 'should not fail with empty message_form' 


      it 'should not fail with no back path' 

    end
  end

  describe 'PATCH add_status_user' do
    let(:user) { FactoryBot.create(:user) }
    let(:valid_attributes) { {status: 'Sleeping at my keyboard', user_id: user.friendly_id} }

    before(:each) do
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    end

    context 'with valid attributes' do
      before(:each) do
        patch :add_status, params: { id: user, user: valid_attributes }
      end

      it 'should require user to be signed in' 


      it 'should redirect to user show page' 


      it 'should render a successful flash message' 

    end

    context 'with invalid attributes' do
      it 'should render a failure flash message' 

    end
  end
end

