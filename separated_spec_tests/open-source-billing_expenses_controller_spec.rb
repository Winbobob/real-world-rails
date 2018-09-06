require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ExpensesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Expense. As you add validations to Expense, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExpensesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all expenses as @expenses" 

  end

  describe "GET show" do
    it "assigns the requested expense as @expense" 

  end

  describe "GET new" do
    it "assigns a new expense as @expense" 

  end

  describe "GET edit" do
    it "assigns the requested expense as @expense" 

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Expense" 


      it "assigns a newly created expense as @expense" 


      it "redirects to the created expense" 

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved expense as @expense" 


      it "re-renders the 'new' template" 

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested expense" 


      it "assigns the requested expense as @expense" 


      it "redirects to the expense" 

    end

    describe "with invalid params" do
      it "assigns the expense as @expense" 


      it "re-renders the 'edit' template" 

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested expense" 


    it "redirects to the expenses list" 

  end

end

