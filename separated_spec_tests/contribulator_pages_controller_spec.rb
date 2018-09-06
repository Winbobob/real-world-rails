require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #about" do
    let(:issue) { create(:issue, project: create(:project, owner: 'rails', name: 'rails')) }
    let(:project) { issue.project }
    let(:languages) { Project.languages }

    before do
      allow(Project).to receive(:good).and_return([project])

        get :about
    end

    it "responds successfully with an HTTP 200 status code" 


    it "renders the index template" 


    it "loads all of the languages into @languages" 


    it "loads all of the issue into @issue" 


    it "loads a of the project into @project" 

  end
end

