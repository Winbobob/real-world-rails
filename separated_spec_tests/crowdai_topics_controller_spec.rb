require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  render_views

  let(:valid_attributes) {
    FactoryBot.attributes_for(:topic)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:topic, :invalid)
  }

  let!(:admin) { create :participant, :admin }
  let!(:challenge) { create :challenge }
  let!(:topic) { create :topic, challenge_id: challenge.id }

  before do
    sign_in admin
  end

  describe "GET #index" do
    it "assigns all topics as @topics" 

  end

  describe "GET #new" do
    it "assigns a new topic as @topic" 

  end

  describe "GET #edit" do
    it "assigns the requested topic as @topic" 

  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Topic" 


      it "redirects to the created topics_controller" 

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved topic as @topic" 


      it "re-renders the 'new' template" 

    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested topic" 


    it "redirects to the topics list" 

  end

end

