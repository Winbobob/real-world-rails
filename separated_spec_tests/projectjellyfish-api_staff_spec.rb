require 'rails_helper'

RSpec.describe 'Staff API' do
  let(:default_params) { { format: :json } }

  describe 'GET index' do
    before(:each) do
      create :staff, first_name: 'john', last_name: 'smith', email: 'foo@bar.com'
      create :staff, :user
      sign_in_as create :staff, :admin
    end

    it 'returns a collection of all staff' 


    it 'returns a collection of all staff w/ projects', :show_in_doc do
      get '/api/v1/staff', includes: %w(projects)
      expect(json[0]['projects']).to_not eq(nil)
    end

    it 'returns a search of all staff using the query' 


    it 'paginates the staff' 

  end

  describe 'GET show' do
    before(:each) do
      @staff = create :staff
      sign_in_as @staff
    end

    it 'retrieves staff by id', :show_in_doc do
      get "/api/v1/staff/#{@staff.id}"
      expect(json['first_name']).to eq(@staff.first_name)
    end

    it 'retrieves staff by id w/ projects', :show_in_doc do
      get "/api/v1/staff/#{@staff.id}", includes: %w(projects)
      expect(json['projects']).to_not eq(nil)
    end

    it 'returns an error when the staff does not exist' 

  end

  describe 'GET current_member' do
    before(:each) do
      @staff = create :staff
    end

    it 'retrieves the current member for logged in users', :show_in_doc do
      sign_in_as @staff

      get '/api/v1/staff/current_member'

      expect(json['first_name']).to eq(@staff.first_name)
    end

    it 'retrieves staff w/ notifications' 


    it 'returns a 401 when the user is not logged in' 

  end

  describe 'POST create' do
    before(:each) do
      sign_in_as create :staff, :admin
    end

    it 'creates a new staff record', :show_in_doc do
      staff_data = { first_name: 'Created', last_name: 'User', email: 'created@test.com', role: 'user', password: 'created_pass', password_confirmation: 'created_pass' }
      post '/api/v1/staff', staff_data
      expect(json['first_name']).to eq(staff_data[:first_name])
    end

    it 'returns an error if the staff data is missing' 

  end

  describe 'PUT update' do
    before(:each) do
      @staff = create :staff
      sign_in_as create :staff, :admin
    end

    it 'changes existing staff', :show_in_doc do
      put "/api/v1/staff/#{@staff.id}", staff: { first_name: 'Updated' }
      expect(response.status).to eq(204)
    end

    it 'returns an error when the staff does not exist' 

  end
end

