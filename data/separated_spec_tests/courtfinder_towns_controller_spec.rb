require 'spec_helper'

describe Admin::TownsController do
  let(:user) { create :user, name: 'hello', admin: true, email: 'lol@biz.info' }
  before :each do
    sign_in user
  end

  describe "#update" do
    let(:town) { Town.new(id: 123) }
    before do
      Town.stub(:find).and_return(town)
      town.stub(id: 123)
    end

    let(:params) { { id: 123, town: { name: 'new town' } } }

    context "that works" do
      before do
        Town.any_instance.stub(update_attributes: true)
      end

      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        Town.any_instance.stub(update_attributes: false)
      end

      context "a html request" do
        before { params[:format] = :html }

        it "rerenders the edit path" 


        it "responds with html" 

      end

      context "a json request" do
        before { params[:format] = :json }
        it "responds to json" 

      end
    end

  end

  describe "#create" do
    let(:params) { { town: { name: 'new town' } } }

    context "that saves ok" do
      it "creates a town" 


      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { Town.any_instance.stub(save: false) }

      it "does not create a town" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  describe "#index" do
    it "assigns all towns to @towns" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_town) { Town.new(id: 123, name: 'mock town') }
    before do
      Town.stub(:find).and_return(mock_town)
    end

    it "gets the right town" 


    it "assigns the town" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new town" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#edit" do
    let(:mock_town) { Town.new(id: 123, name: 'mock town') }
    before do
      Town.stub(:find).and_return(mock_town)
    end

    it "gets the right town" 

  end

  it "remove town on destroy" 

end

