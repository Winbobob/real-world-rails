require 'spec_helper'

describe Admin::OpeningTypesController do

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#update" do
    let(:opening_type) { OpeningType.new(id: 123) }
    before do
      OpeningType.stub(:find).and_return(opening_type)
      opening_type.stub(id: 123)
    end

    let(:params) { { id: 123, opening_type: { name: 'new opening type' } } }

    context "that works" do
      before do
        OpeningType.any_instance.stub(update_attributes: true)
      end

      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        OpeningType.any_instance.stub(update_attributes: false)
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
    let(:params) { { opening_type: { name: 'new opening type' } } }

    context "that saves ok" do
      it "creates an opening type" 


      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { OpeningType.any_instance.stub(save: false) }

      it "does not create an opening type" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  describe "#index" do
    it "assigns all opening_types to @opening_types" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_opening_type) { OpeningType.new(id: 123, name: 'mock opening type') }
    before do
      OpeningType.stub(:find).and_return(mock_opening_type)
    end

    it "gets the right opening_type" 


    it "assigns the opening_type" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new opening_type" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#edit" do
    let(:mock_opening_type) { OpeningType.new(id: 123, name: 'mock opening type') }
    before do
      OpeningType.stub(:find).and_return(mock_opening_type)
    end

    it "gets the right opening_type" 

  end

end

