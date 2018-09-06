require 'spec_helper'

describe Admin::ContactTypesController do

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#update" do
    let(:contact_type) { ContactType.new(id: 123) }
    before do
      ContactType.stub(:find).and_return(contact_type)
      contact_type.stub(id: 123)
    end

    let(:params) { { id: 123, contact_type: { name: 'new contact type' } } }

    context "that works" do
      before do
        ContactType.any_instance.stub(update_attributes: true)
      end

      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        ContactType.any_instance.stub(update_attributes: false)
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
    let(:params) { { contact_type: { name: 'new contact type' } } }

    context "that saves ok" do
      it "creates an contact type" 


      it "redirects to the show path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { ContactType.any_instance.stub(save: false) }

      it "does not create an contact type" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  it "remove contact type on destroy" 


  describe "#index" do
    it "assigns all contact_types to @contact_types" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_contact_type) { ContactType.new(id: 123, name: 'mock contact type') }
    before do
      ContactType.stub(:find).and_return(mock_contact_type)
    end

    it "gets the right contact_type" 


    it "assigns the contact_type" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new contact_type" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#edit" do
    let(:mock_contact_type) { ContactType.new(id: 123, name: 'mock contact type') }
    before do
      ContactType.stub(:find).and_return(mock_contact_type)
    end

    it "gets the right contact_type" 

  end
end

