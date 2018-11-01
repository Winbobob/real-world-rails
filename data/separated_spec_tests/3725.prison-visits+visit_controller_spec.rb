require 'rails_helper'

RSpec.describe VisitController, type: :controller do
  include ActiveJobHelper

  render_views

  before :each do
    ActionMailer::Base.deliveries.clear
    allow(request).to receive(:ssl?).and_return(true)
  end

  let :visit_id do
    sample_visit.visit_id
  end

  let :token do
    MESSAGE_ENCRYPTOR.encrypt_and_sign(sample_visit)
  end

  context "always" do
    it "displays the status of a visit not yet created" 


    it "displays the status of an unprocessed visit" 


    it "displays the status of a confirmed visit" 


    it "displays the status of a rejected visit" 


    after :each do
      get :status, id: visit_id, state: token
      expect(response).to be_success
    end
  end

  context "legacy email handling" do
    it "displays the status of the visit" 

  end

  context "cancelled visits" do
    it "displays the status of a cancelled visit request" 


    it "displays the status of a cancelled visit" 


    after :each do
      get :status, id: visit_id
      expect(response.body).to include("cancelled")
    end
  end

  context "cancel an existing visit" do
    let :encrypted_visit do
      MESSAGE_ENCRYPTOR.encrypt_and_sign(sample_visit)
    end

    before :each do
      ActionMailer::Base.deliveries.clear
    end

    it "cancels a pending visit request" 


    it "cancels a confirmed visit request" 


    after :each do
      expect(response).to redirect_to(visit_status_path(sample_visit.visit_id, state: encrypted_visit))
    end
  end

  describe "abandon ship!" do
    before :each do
      session[:visit] = Visit.new(prisoner: Prisoner.new(prison_name: 'Alcatraz'))
    end

    it "should clear out the session" 

  end
end

