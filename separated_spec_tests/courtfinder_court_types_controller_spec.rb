require 'spec_helper'

describe Admin::CourtTypesController do

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#update" do
    let(:court_type) { CourtType.new(id: 123) }
    before do
      CourtType.stub(:find).and_return(court_type)
      court_type.stub(id: 123)
    end

    let(:params) { { id: 123, court_type: { name: 'new court type' } } }

    context "that works" do
      before do
        CourtType.any_instance.stub(update_attributes: true)
      end

      it "redirects to the edit path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        CourtType.any_instance.stub(update_attributes: false)
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
    let(:params) { { court_type: { name: 'new court type' } } }

    context "that saves ok" do
      it "creates an court type" 


      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { CourtType.any_instance.stub(save: false) }

      it "does not create an court type" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  it "removes court_type" 


  describe "#index" do
    let(:ordered_court_types) { double('ordered court types') }
    let(:mock_court_types) { double('all court types', order: ordered_court_types) }

    it "assigns all court_types to @court_types" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:court_type) { CourtType.create!(name: 'mock court type') }
    before do
      CourtType.stub(:find).and_return(court_type)
    end

    it "gets the right court_type" 


    it "assigns the court_type" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new court_type" 


    it "responds to html" 


  end

  describe "#edit" do
    let(:mock_court_type) { CourtType.new(id: 123, name: 'mock court type') }
    before do
      CourtType.stub(:find).and_return(mock_court_type)
    end

    it "gets the right court_type" 

  end

end

