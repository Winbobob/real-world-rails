require 'spec_helper'

describe Admin::FacilitiesController do
  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#update" do
    let(:facility) { Facility.new(id: 123) }
    before do
      Facility.stub(:find).and_return(facility)
      facility.stub(id: 123)
    end

    let(:params) { { id: 123, facility: { name: 'new contact type' } } }

    context "that works" do
      before do
        Facility.any_instance.stub(update_attributes: true)
      end

      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        Facility.any_instance.stub(update_attributes: false)
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
    let(:params) { { facility: { name: 'new contact type', image_file: fixture_file_upload("assets/firstaid.png", 'image/png') } } }

    context "that saves ok" do
      it "creates an contact type" 


      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { Facility.any_instance.stub(save: false) }

      it "does not create an contact type" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  describe "#index" do
    it "assigns all facilities to @facilities" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_facility) { Facility.new(id: 123, name: 'mock contact type') }
    before do
      Facility.stub(:find).and_return(mock_facility)
    end

    it "gets the right facility" 


    it "assigns the facility" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new facility" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#edit" do
    let(:mock_facility) { Facility.new(id: 123, name: 'mock contact type') }
    before do
      Facility.stub(:find).and_return(mock_facility)
    end

    it "gets the right facility" 

  end

end

