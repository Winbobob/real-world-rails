require 'spec_helper'

describe NewslettersController do

  let(:valid_attributes) { FactoryBot.attributes_for(:newsletter) }

  let(:valid_session) { {} }
  let(:user) { @user }

  

  describe "As privilged user" do

    before :each do
      @user = get_privileged_user
      request.env['warden'].stub :authenticate => @user
      controller.stub :current_user =>  @user
    end

    describe "authorization" do
      it 'check_privileged' 

    end

    describe "GET index" do
      it "assigns all newsletters as @newsletters" 

    end

    describe "GET show" do
      it "assigns the requested newsletter as @newsletter" 

    end

    describe "GET new" do
      it "assigns a new newsletter as @newsletter" 


    end

    describe "GET edit" do
      it "assigns the requested newsletter as @newsletter" 

    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Newsletter" 


        it "assigns a newly created newsletter as @newsletter" 


        it "redirects to the created newsletter" 

      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved newsletter as @newsletter" 


        it "re-renders the 'new' template" 

      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested newsletter" 


        it "assigns the requested newsletter as @newsletter" 


        it "redirects to the newsletter" 

      end

      describe "with invalid params" do
        it "assigns the newsletter as @newsletter" 


        it "re-renders the 'edit' template" 

      end
    end

    describe "DELETE destroy" do
      it "destroys the requested newsletter" 


      it "redirects to the newsletters list" 

    end

  end

  describe "As unpvivileged user" do
    
    before :each do
      @user =  FactoryBot.create(:user)
      request.env['warden'].stub :authenticate => @user
      controller.stub :current_user =>  @user
    end
   
    describe 'authorization' do
      it 'check_privilged' 

    end
    describe "GET new" do
      it "renders status 403" 

    end

    describe "GET edit" do
      it "renders status 403" 

    end
    
    describe "DELETE destroy" do
      it "wont delete Newsletter" 

      
      it "renders status 403" 

    end

    describe "PUT update" do
      it "renders status 403" 


      it "displays template 403" 

    end
  end

end

