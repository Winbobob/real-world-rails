require 'spec_helper'

describe Admin::CountiesController do
  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#update" do
    let(:county) { County.new(id: 123) }
    before do
      County.stub(:find).and_return(county)
      county.stub(id: 123)
    end

    let(:params) { { id: 123, county: { name: 'new contact type' } } }

    context "that works" do
      before do
        County.any_instance.stub(update_attributes: true)
      end

      it "redirects to the edit path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        County.any_instance.stub(update_attributes: false)
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
    let(:params) { { county: { name: 'new contact type' } } }

    context "that saves ok" do
      it "creates an contact type" 


      it "redirects to the edit path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { County.any_instance.stub(save: false) }

      it "does not create an contact type" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  it "remove county on destroy" 


  describe "#index" do
    it "assigns all counties to @counties" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_county) { County.new(id: 123, name: 'mock contact type') }
    before do
      County.stub(:find).and_return(mock_county)
    end

    it "gets the right county" 


    it "assigns the county" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new county" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#edit" do
    let(:mock_county) { County.new(id: 123, name: 'mock contact type') }
    before do
      County.stub(:find).and_return(mock_county)
    end

    it "gets the right county" 

  end

end

