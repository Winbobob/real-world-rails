require 'spec_helper'

describe Authentications::IdentitiesController do
  let(:email) { 'xman@xman.com' }
  let(:member) { create(:verified_member, email: email) }
  before { session[:member_id] = member.id }

  describe 'GET new' do
    subject(:do_request) { get :new }
    it { should be_success }
    it "should set the identity" 

  end

  describe "POST create" do
    let(:password) { '111111' }
    let(:attrs) {
      { identity: { password: password, password_confirmation: password}}
    }

    subject(:do_request) { post :create, attrs}

    it "should create the ideneity" 


    it "should be recirect to settings path with flash" 

  end

end

