require "rails_helper"

RSpec.describe "HtmlVariants", type: :request do
  let(:user) { create(:user)}
  let(:article) { create(:article, user_id: user.id, approved: true) }

  before do
    sign_in user
  end

  describe "GET /html_variants" do
    it "rejects non-permissioned user" 


    it "accepts permissioned" 

  end

  describe "GET /html_variants/new" do
    it "rejects non-permissioned user" 


    it "accepts permissioned" 

  end

  describe "GET /html_variants/:id/edit" do
    it "rejects non-permissioned user" 


    it "accepts permissioned" 

  end

  describe "Post /html_variants" do
    it "rejects non-permissioned user" 


    it "creates" 


    it "does not create with invalid params" 

  end

  describe "Put /html_variants" do
    it "rejects non-permissioned user" 


    it "updates when appropriate" 


    it "does not create with invalid params" 

  end


end

