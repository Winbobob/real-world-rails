require 'spec_helper'

describe Admin::AddressTypesController do
  # render_views

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#update" do
    let(:address_type) { AddressType.new(id: 123) }
    before do
      AddressType.stub(:find).and_return(address_type)
      address_type.stub(id: 123)
    end

    let(:params) { { id: 123, address_type: { name: 'new address type' } } }

    context "that works" do
      before do
        AddressType.any_instance.stub(update_attributes: true)
      end

      it "redirects to the edit path" 


      it "responds to html" 


      it "responds to json" 

    end

    context "that doesn't work" do
      before do
        AddressType.any_instance.stub(update_attributes: false)
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
    let(:params) { { address_type: { name: 'new address type' } } }

    context "that saves ok" do
      it "creates an address type" 


      it "redirects to the edit path" 


      it "responds to html" 


      it "responds to json" 

    end
    context "that doesn't save ok" do
      before { AddressType.any_instance.stub(save: false) }

      it "does not create an address type" 


      it "rerenders the new template" 


      it "responds to html" 


      describe "a json request" do
        it "responds with json" 


        it "returns unprocessable_entity status" 

      end
    end
  end

  it "removes address type on destroy" 


  describe "#index" do
    it "assigns all address_types to @address_types" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_address_type) { AddressType.new(id: 123, name: 'mock address type') }
    before do
      AddressType.stub(:find).and_return(mock_address_type)
    end

    it "gets the right address_type" 


    it "assigns the address_type" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do

    it "assigns a new address_type" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#edit" do
    let(:mock_address_type) { AddressType.new(id: 123, name: 'mock address type') }
    before do
      AddressType.stub(:find).and_return(mock_address_type)
    end

    it "gets the right address_type" 

  end

end

