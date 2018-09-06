require 'rails_helper'

RSpec.describe 'Projects API' do
  let(:default_params) { { format: :json } }

  let(:question) { 'Why did the chicken cross the road?' }
  let(:answer) { 'To get to the other side.' }
  let(:project_name) { 'To get to the other side.' }
  let(:question_model) { create :project_question, question: question, position: 0 }

  describe 'GET index' do
    before :each do
      @project = create :project
      @project2 = create :project
    end

    it 'returns a collection of all projects', :show_in_doc do
      sign_in_as create :staff, :admin
      create(:staff).groups << Group.new(projects: [@project])

      get '/api/v1/projects'

      expect(json.length).to eq(2)
    end

    it 'paginates the projects' 


    it "returns a 401 error if the user isn't logged in" 

  end

  describe 'GET show' do
    before :each do
      @project = create :project
    end

    it 'retrieves project by id' 


    it 'returns an error when the project does not exist' 

  end

  describe 'POST create' do
    it 'creates a new project record for admin' 


    it 'creates a new project record w/ project answers for admin', :show_in_doc do
      sign_in_as create :staff, :admin
      project_data = attributes_for(:project, answers: [{ name: question_model.id, value: answer, value_type: 'string' }])

      post '/api/v1/projects', project_data.merge(includes: %w(answers))

      expect(json['answers'][0]['name']).to eq(question_model.id.to_s)
    end

    it 'fails to create a new project without a group for staff' 


    it 'fails to create a new project without a group for staff' 


    it "returns a 401 error if the user isn't logged in" 

  end

  describe 'PUT update' do
    before :each do
      @project = create :project
    end

    it 'changes existing project' 


    it 'updates a project record w/ project answers', :show_in_doc do
      sign_in_as create :staff, :admin

      project_data = attributes_for(:project, answers: [{ name: 'foo', value: answer, value_type: 'string' }])
      put "/api/v1/projects/#{@project.id}", project_data
      @project.reload
      expect(@project.answers.length).to eq(1)
    end

    it 'returns an error when the project does not exist' 


    it "returns a 401 error if the user isn't logged in" 

  end
end

