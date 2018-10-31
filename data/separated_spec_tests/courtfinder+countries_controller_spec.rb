require 'spec_helper'

describe Admin::CountriesController do

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#update" do
    let(:country) { Country.new(id: 123) }
    before do
      Country.stub(:find).and_return(country)
      country.stub(id: 123)
    end

    let(:params) { { id: 123, country: { name: 'new contact type' } } }

    context "that works" do
      before do
        Country.any_instance.stub(update_attributes: true)
      end

      it "redirects to the edit path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        Country.any_instance.stub(update_attributes: false)
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
    let(:params) { { country: { name: 'new contact type' } } }

    context "that saves ok" do
      it "creates an contact type" 


      it "redirects to the edit path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { Country.any_instance.stub(save: false) }

      it "does not create an contact type" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  it "purges the cache when a contact type is destroyed" 


  describe "#index" do
    it "assigns all countries to @countries" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_country) { Country.new(id: 123, name: 'mock contact type') }
    before do
      Country.stub(:find).and_return(mock_country)
    end

    it "gets the right country" 


    it "assigns the country" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new country" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#edit" do
    let(:mock_country) { Country.new(id: 123, name: 'mock contact type') }
    before do
      Country.stub(:find).and_return(mock_country)
    end

    it "gets the right country" 

  end
end

