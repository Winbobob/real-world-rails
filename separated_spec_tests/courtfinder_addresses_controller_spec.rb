require 'spec_helper'

describe Admin::AddressesController do
  render_views

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#index" do
    it "assigns all addresses" 


    describe "a html request" do
      it "responds with html" 


      it "responds with :ok" 

    end

    describe "a json request" do
      it "responds with json" 


      it "responds with :ok" 

    end
  end

  describe "#update" do
    let(:address) { create(:address, address_line_1: 'Room 101', town: Town.create!) }
    let(:params) { { id: address.id, address: {} } }

    context "when it works" do
      before { address.stub(update_attributes: true) }

      describe "a html request" do
        before { params[:format] = :html }

        it "redirects to the show path" 


        it "flashes a notice" 

      end

      describe "a json request" do
        before { params[:format] = :json }

        it "reponds with json" 


        it "responds with no content" 

      end
    end

    context "when it doesn't work" do
      before { Address.any_instance.stub(update_attributes: false) }

      describe "a html request" do
        before { params[:format] = :html }

        it "rerenders the edit template" 


        it "flashes an error" 

      end

      describe "a json request" do
        before { params[:format] = :json }

        it "reponds with json" 


        it "responds with status :unprocessable_entity" 

      end
    end
  end

  describe "#create" do
    context "with valid params" do
      let(:town) { Town.create }
      let(:params) { { address: { address_line_1: '22 Acacia Avenue', town_id: town.id } } }

      it "creates a new Address" 


      describe "a html request" do
        before { params[:format] = :html }

        it "redirects to show the new Address" 


        it "flashes a notice" 

      end

      describe "a json request" do
        before { params[:format] = :json }

        it "responds with json" 


        it "responds with status :created" 

      end

    end

    context "with invalid params" do
      let(:params) { { address: { address_line_2: '22 Acacia Avenue' } } }

      it "does not create an Address" 


      describe "a html request" do
        before { params[:format] = :html }

        it "re-renders the new template" 


        it "flashes an error" 

      end

      describe "a json request" do
        before { params[:format] = :json }

        it "responds with json" 


        it "responds with status :unprocessable_entity" 

      end
    end
  end

  describe "#edit" do
    let(:town) { Town.create(name: 'Testington') }
    let(:address) { Address.create(address_line_1: '22 Acacia Avenue', town: town) }

    it "finds the right address" 


    it "assigns the address" 

  end

  describe "#new" do
    it "assigns a new address to @address" 


    describe "a html request" do
      it "responds with html" 


      it "responds with :ok" 

    end

    describe "a json request" do
      it "responds with json" 


      it "responds with :ok" 

    end
  end

  describe "#show" do
    let(:town) { Town.create(name: 'Testington') }
    let(:address) { Address.create(address_line_1: '22 Acacia Avenue', town: town) }

    it "finds the right address" 


    it "assigns the address" 


    describe "a html request" do
      it "responds with html" 


      it "responds with :ok" 

    end

    describe "a json request" do
      it "responds with json" 


      it "responds with :ok" 

    end
  end

  it "remove address on destroyed" 

end

