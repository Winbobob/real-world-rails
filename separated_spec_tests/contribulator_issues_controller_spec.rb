require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  describe "GET #show" do
    let(:issue) { create(:issue) }

    before do
        get :show, params: { id: issue.id }
    end

    it "responds successfully with an HTTP 200 status code" 


    it "renders the index template" 


    it "loads all of the issue into @issue" 

  end
end

