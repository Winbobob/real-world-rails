require 'spec_helper'

describe Admin::LocalAuthoritiesController do

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#index" do
    it "gets local authorities by name" 

    it "assigns @local_authorities" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#new" do
    it "assigns @local_authority" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#create" do
    context "with valid params" do
      let(:params) do
        {
          local_authority: { name: 'Authority name' }
        }
      end

      it "creates a new LocalAuthority" 


      it "redirects to the index" 

    end

    context "with invalid params" do
      let(:params) do
        {
          local_authority: { name: '' }
        }
      end

      it "does not create a new LocalAuthority" 


      it "re-renders the new template" 

    end
  end

  describe "#update" do
    let(:mock_authority) { double('local authority', update_attributes: success) }
    before do
      allow(LocalAuthority).to receive(:find).and_return(mock_authority)
    end
    context "with valid params" do
      let(:success) { true }
      let(:params) do
        {
          id: 123,
          local_authority: { name: 'Authority name' }
        }
      end

      it "updates the LocalAuthority" 


      it "redirects to the index" 

    end

    context "with invalid params" do
      let(:success) { false }
      let(:params) do
        {
          id: 123,
          local_authority: { name: '' }
        }
      end

      it "does not update a new LocalAuthority" 


      it "re-renders the edit template" 

    end
  end

  describe "#edit" do
    let(:mock_authority) { LocalAuthority.new }
    before do
      LocalAuthority.stub(:find).and_return(mock_authority)
    end
    it "gets the local authority by id" 

    it "assigns @local_authority" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#destroy" do
    let(:mock_authority) { double('local authority', destroy: success) }
    let(:success) { true }
    let(:params) { { id: 123 } }

    before do
      LocalAuthority.stub(:find).and_return(mock_authority)
    end
    it "tries to destroy the LocalAuthority" 


    context "when it successfully destroys the local authority" do
      let(:success) { true }

      it 'flashes a notice' 


      it "redirects to the index" 

    end

    context "when it cannot destroy the local authority" do
      let(:success) { false }
      it 'flashes an error' 


      it "redirects to the index" 

    end

  end
end

