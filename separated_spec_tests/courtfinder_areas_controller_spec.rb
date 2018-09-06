require 'spec_helper'

describe Admin::AreasController do
  render_views

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#index" do
    it "assigns all areas" 


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
    let(:area) { create(:area, name: 'the north') }
    let(:params) { { id: area.id, area: {} } }

    context "when it works" do
      before { area.stub(update_attributes: true) }

      describe "a html request" do
        before { params[:format] = :html }

        it "redirects to the edit path" 


        it "flashes a notice" 

      end

      describe "a json request" do
        before { params[:format] = :json }

        it "reponds with json" 


        it "responds with no content" 

      end
    end

    context "when it doesn't work" do
      before { Area.any_instance.stub(update_attributes: false) }

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
    context "that works" do
      let(:params) { { area: { name: '22 Acacia Avenue' } } }

      it "creates a new Area" 


      describe "a html request" do
        before { params[:format] = :html }

        it "redirects to show the new Area" 


        it "flashes a notice" 

      end

      describe "a json request" do
        before { params[:format] = :json }

        it "responds with json" 


        it "responds with status :created" 

      end

    end

    context "that doesn't work" do
      let(:params) { { area: { name: 'something' } } }
      before { Area.any_instance.stub(save: false) }

      it "does not create an Area" 


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
    let(:area) { Area.create(name: '22 Acacia Avenue') }

    it "finds the right area" 


    it "assigns the area" 

  end

  describe "#new" do
    it "assigns a new area to @area" 


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
    let(:area) { Area.create(name: 'Somewhere') }

    it "finds the right area" 


    it "assigns the area" 


    describe "a html request" do
      it "responds with html" 


      it "responds with :ok" 

    end

    describe "a json request" do
      it "responds with json" 


      it "responds with :ok" 

    end
  end

  it "remove area on destroy" 


end

