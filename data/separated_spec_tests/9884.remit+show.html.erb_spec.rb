# encoding: utf-8
require "rails_helper"
require "support/devise"

RSpec.describe "studies/show.html.erb", type: :view do
  let(:study) { FactoryGirl.create(:study) }

  before do
    assign(:study, study)
    render
  end

  it "shows the study title" 


  it "shows the study stage" 


  it "shows the study stage since date" 


  it "shows the study topic" 


  it "shows the study type" 


  it "shows the country when there is one" 


  it "shows multiple countries when there are many" 


  it "shows the pi when there is one" 


  describe "admin edit link" do
    let(:admin_user) { FactoryGirl.create(:admin_user) }
    let(:normal_user) { FactoryGirl.create(:user) }
    let(:edit_text) { "Edit study details" }

    it "isn't shown to anonymous users" 


    it "isn't shown to normal users" 


    it "is shown to admin users" 

  end

  describe "add impact link" do
    let(:admin_user) { FactoryGirl.create(:admin_user) }
    let(:normal_user) { FactoryGirl.create(:user) }
    let(:impact_link) do
      "Record a dissemination or other impact for this study"
    end

    it "isn't shown to anonymous users" 


    it "isn't shown to normal users" 


    it "is shown to admin users" 


    it "is shown to pi's of the study" 


    it "is shown to rm's of the study" 

  end

  describe "Invite users form" do
    let(:admin_user) { FactoryGirl.create(:admin_user) }
    let(:normal_user) { FactoryGirl.create(:user) }
    let(:invite_link) { "Invite someone else to record an impact" }

    it "isn't shown to anonymous users" 


    it "isn't shown to normal users" 


    it "is shown to admin users" 


    it "is shown to pi's of the study" 


    it "is shown to rm's of the study" 


    it "is expanded when there's an error" 

  end

  describe "study actions bar" do
    let(:admin_user) { FactoryGirl.create(:admin_user) }
    let(:normal_user) { FactoryGirl.create(:user) }

    it "isn't shown to anonymous users" 


    it "isn't shown to normal users" 


    it "is shown to admin users" 


    it "is shown to pi's of the study" 


    it "is shown to rm's of the study" 

  end

  describe "add delivery update link" do
    let(:admin_user) { FactoryGirl.create(:admin_user) }
    let(:normal_user) { FactoryGirl.create(:user) }
    let(:other_user) { FactoryGirl.create(:user) }
    let(:update_link) do
      "Add delivery update for this study"
    end
    let!(:invite) do
      FactoryGirl.create(:delivery_update_invite, study: study,
                                                  invited_user: normal_user)
    end

    it "is shown to invited users" 


    it "isn't shown to other users" 

  end

  describe "documents sidebar" do
    let(:document_type) { FactoryGirl.create(:document_type) }

    it "links to the files" 


    it "prints an empty message when there are no documents" 

  end

  describe "publications sidebar" do
    it "displays each publication" 


    it "prints an empty message when there are no publications" 

  end
end

