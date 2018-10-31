require 'spec_helper'

describe AnnotationsController do

  context 'An unauthenticated and unauthorized user doing a GET' do

    # Since we are not authenticated and authorized, we should be redirected
    # to the login page

    it 'on :add_existing_annotation' 


    it 'on :create' 


    it 'on :destroy' 


    it 'on :update_annotation' 


  end # end context unauthenticated/unauthorized user GET

  context 'An unauthenticated and unauthorized user doing a POST' do

    # Since we are not authenticated and authorized, we should be redirected
    # to the login page

    it 'on :add_existing_annotation' 


    it 'on :create' 


    it 'on :destroy' 


    it 'on :update_annotation' 


  end

  context 'An authenticated and authorized admin doing a POST' do
    before :each do
      # Authenticate user is not timed out, and has administrator rights.
      @a = Admin.create(user_name: 'admin',
                         last_name: 'admin',
                         first_name: 'admin')
    end

    let(:annotation_category) { FactoryGirl.create(:annotation_category) }
    let(:annotation_text) { FactoryGirl.create(:annotation_text) }
    let(:assignment) { FactoryGirl.create(:assignment) }
    let(:submission) { FactoryGirl.create(:submission) }
    let(:result) { FactoryGirl.create(:result, marking_state: Result::MARKING_STATES[:incomplete]) }
    let(:submission_file) { SubmissionFile.create!(submission_id: submission.id, filename: 'test.txt')}

    it 'on :add_existing_annotation' 


    it 'on :create to make a text annotation' 


    it 'on :create to make an image annotation' 


    it 'on :destroy' 


    it 'on :update_annotation' 


  end #End context admin POST

  context 'An authenticated and authorized TA doing a POST' do
    before :each do
      # Authenticate user is not timed out, and has TA rights.
      @ta = Ta.create(user_name: 'ta',
                       last_name: 'ta',
                       first_name: 'ta')
    end

    let(:annotation_category) { FactoryGirl.create(:annotation_category) }
    let(:annotation_text) { FactoryGirl.create(:annotation_text) }
    let(:assignment) { FactoryGirl.create(:assignment) }
    let(:submission) { FactoryGirl.create(:submission) }
    let(:result) { FactoryGirl.create(:result, marking_state: Result::MARKING_STATES[:incomplete]) }
    let(:submission_file) { SubmissionFile.create!(submission_id: submission.id, filename: 'test.txt')}

    it 'on :add_existing_annotation' 


    it 'on :create to make a text annotation' 


    it 'on :create to make an image annotation' 


    it 'on :destroy' 


    it 'on :update_annotation' 


  end #End context TA POST

  context 'An authenticated and authorized Student doing a POST' do
    before :each do
      # A student should get a 404 even if they do everything right
      @stu = Student.create(user_name: 'sta',
                      last_name: 'ta',
                      first_name: 'ta')
    end

    let(:annotation_category) { FactoryGirl.create(:annotation_category) }
    let(:annotation_text) { FactoryGirl.create(:annotation_text) }
    let(:assignment) { FactoryGirl.create(:assignment) }
    let(:submission) { FactoryGirl.create(:submission) }
    let(:result) { FactoryGirl.create(:result, marking_state: Result::MARKING_STATES[:incomplete]) }
    let(:submission_file) { SubmissionFile.create!(submission_id: submission.id, filename: 'test.txt')}

    it 'on :add_existing_annotation' 


    it 'on :create to make a text annotation' 


    it 'on :create to make an image annotation' 


    it 'on :destroy' 


    it 'on :update_annotation' 


  end #End context Student POST

end

