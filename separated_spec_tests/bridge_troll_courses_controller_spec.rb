require 'rails_helper'

describe CoursesController, type: :controller do
  let(:user) { create(:user, admin: true) }

  before do
    sign_in user
  end

  let(:valid_attributes) do
    {
      name: 'RAILS',
      title: 'Ruby on Rails',
      description: 'This is a Ruby on Rails event.'
    }
  end

  let(:invalid_attributes) do
    {
      name: 'RAILS',
      title: nil,
      description: nil
    }
  end

  let(:valid_session) { {} }

  describe "GET #new" do
    it "assigns a new course as @course" 

  end

  describe "GET #edit" do
    it "assigns the requested course as @course" 

  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Course" 


      it "assigns a newly created course as @course" 


      it "redirects to the created course" 

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved course as @course" 


      it "re-renders the 'new' template" 

    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          name: 'RAILS5',
          title: 'Ruby on Rails 5',
          description: 'This is a Ruby on Rails event. UPDATED for a new version.'
        }
      end

      it "updates the requested course" 


      it "assigns the requested course as @course" 


      it "redirects to the course" 

    end

    context "with invalid params" do
      it "assigns the course as @course" 


      it "re-renders the 'edit' template" 

    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" 


    it "redirects to the courses list" 

  end

end

