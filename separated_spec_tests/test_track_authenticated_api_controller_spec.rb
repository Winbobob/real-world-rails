require 'rails_helper'

RSpec.describe AuthenticatedApiController, type: :controller do
  controller(AuthenticatedApiController) do
    def index
      head :ok
    end
  end

  let(:default_app) { FactoryBot.create :app, name: "default_app", auth_secret: "6Sd6T7T6Q8hKcoo0t8CTzV0IdN1EEHqXB2Ig4raZsOU" }

  describe "basic auth" do
    it "returns unauthorized when non-existent app" 


    it "returns unauthorized when wrong auth_secret" 


    it "allows access" 

  end
end

