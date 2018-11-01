require 'rails_helper'
require_dependency 'post_enqueuer'

describe UserActionsController do
  context 'index' do

    it 'fails if username is not specified' 


    it "returns a 404 for a user with a hidden profile" 


    it 'renders list correctly' 


    it 'renders help text if provided for self' 


    it 'renders help text for others' 


    context "queued posts" do
      context "without access" do
        let(:user) { Fabricate(:user) }
        it "raises an exception" 

      end

      context "with access" do
        let(:user) { sign_in(Fabricate(:user)) }

        it 'finds queued posts' 

      end
    end
  end
end

