require 'rails_helper'

RSpec.describe Api::V1::SplitConfigsController, type: :controller do
  let(:default_app) { FactoryBot.create :app, name: "default_app", auth_secret: "6Sd6T7T6Q8hKcoo0t8CTzV0IdN1EEHqXB2Ig4raZsOU" }

  describe '#create' do
    it "doesn't create when unauthenticated" 

  end

  describe "while authenticated" do
    before do
      http_authenticate username: default_app.name, auth_secret: default_app.auth_secret
    end

    describe '#create' do
      it "creates a new split with desired weightings" 


      it 'returns errors when invalid' 

    end

    describe '#destroy' do
      it "sets the finished_at time on the split" 


      it "can't delete another app's split" 


      it "is idempotent" 

    end
  end
end

