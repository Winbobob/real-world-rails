require 'spec_helper'

describe Admin::RegionsController do

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#update" do
    let(:region) { Region.new(id: 123) }
    before do
      Region.stub(:find).and_return(region)
      region.stub(id: 123)
    end

    let(:params) { { id: 123, region: { name: 'new region' } } }

    context "that works" do
      before do
        Region.any_instance.stub(update_attributes: true)
      end

      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        Region.any_instance.stub(update_attributes: false)
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
    let(:params) { { region: { name: 'new region' } } }

    context "that saves ok" do
      it "creates an region" 


      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { Region.any_instance.stub(save: false) }

      it "does not create an region" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  it "remove region on destroy" 


  describe "#index" do
    it "assigns all regions to @regions" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_region) { Region.new(id: 123, name: 'mock region') }
    before do
      Region.stub(:find).and_return(mock_region)
    end

    it "gets the right region" 


    it "assigns the region" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new region" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#edit" do
    let(:mock_region) { Region.new(id: 123, name: 'mock region') }
    before do
      Region.stub(:find).and_return(mock_region)
    end

    it "gets the right region" 

  end

end

