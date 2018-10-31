require 'spec_helper'

describe DuplicatesController, :type => :controller do
  include FakeLogin

  describe 'GET new' do
    context 'An admin user with a valid non-duplicate child id' do
      let(:form) { double('Form', :sorted_highlighted_fields => []) }

      before :each do
        fake_admin_login

        @child = create :child, :name => 'John', :unique_identifier => '1234', :created_by => controller.current_user_name
        @form_sections = [mock_model(FormSection), mock_model(FormSection), mock_model(FormSection)]
        allow(Form).to receive(:find_by_name).and_return(form)
      end

      context 'with highlighted fields' do
        let(:form) { double('Form', :sorted_highlighted_fields => :highlighted_fields) }

        it 'should fetch sorted highlighted fields from the form' 

      end

      it 'should be successful' 


      it 'should fetch and assign the child' 


      it 'should assign the page name' 

    end

    context 'An non-admin user' do
      before :each do
        fake_login
        get :new, :child_id => '1234'
      end

      it 'should get forbidden response' 

    end

    context 'An admin user with a non-valid child id' do
      it 'should redirect to flagged children page' 

    end
  end

  describe 'POST create' do
    context 'An admin user with a valid non-duplicate child id' do
      let(:form) { double('Form', :sorted_highlighted_fields => []) }

      before :each do
        fake_admin_login
        @child = Child.new
        allow(@child).to receive(:save)
        allow(Form).to receive(:find_by_name).and_return(form)
      end

      it 'should mark the child as duplicate' 


      context 'with highlighted fields' do
        let(:form) { double('Form', :sorted_highlighted_fields => :highlighted_fields) }

        it 'should fetch sorted highlighted fields from the form' 

      end

      it 'should redirect to the duplicated child view' 

    end
  end
end

