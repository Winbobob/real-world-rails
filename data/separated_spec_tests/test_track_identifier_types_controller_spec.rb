require 'rails_helper'

RSpec.describe Api::V1::IdentifierTypesController, type: :controller do
  let(:default_app) { FactoryBot.create :app, name: "default_app", auth_secret: "6Sd6T7T6Q8hKcoo0t8CTzV0IdN1EEHqXB2Ig4raZsOU" }

  it 'requires http basic auth' 


  describe "#create" do
    before { http_authenticate username: default_app.name, auth_secret: default_app.auth_secret }

    it "creates a new identifier type" 


    it 'is idempotent for existing identifier types' 


    it 'returns errors when invalid' 

  end
end

