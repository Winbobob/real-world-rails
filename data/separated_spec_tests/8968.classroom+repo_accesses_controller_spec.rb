# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stafftools::RepoAccessesController, type: :controller do
  let(:user)         { classroom_teacher }
  let(:organization) { classroom_org     }
  let(:student)      { classroom_student }

  let(:repo_access) { RepoAccess.create(user: student, organization: organization) }

  before(:each) do
    sign_in_as(user)
  end

  after do
    RepoAccess.destroy_all
  end

  describe "GET #show", :vcr do
    context "as an unauthorized user" do
      it "returns a 404" 

    end

    context "as an authorized user" do
      before do
        user.update_attributes(site_admin: true)
        get :show, params: { id: repo_access.id }
      end

      it "succeeds" 


      it "sets the GroupAssignment" 

    end
  end
end

