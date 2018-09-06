# frozen_string_literal: true

require "rails_helper"

RSpec.describe Orgs::RostersController, type: :controller do
  let(:organization) { classroom_org     }
  let(:user)         { classroom_teacher }
  let(:roster)       { create(:roster)   }
  let(:entry)        { roster.roster_entries.first }

  before(:each) do
    organization.update_attributes!(roster_id: roster.id)
  end

  describe "GET #new", :vcr do
    context "with flipper enabled" do
      before do
        GitHubClassroom.flipper[:student_identifier].enable
      end

      it "succeeds" 


      it "renders correct template" 


      it "redirects if the user doesn't belong to the organization" 


      after do
        GitHubClassroom.flipper[:student_identifier].disable
      end
    end

    context "with flipper disabled" do
      before do
        sign_in_as(user)
        get :new, params: { id: organization.slug }
      end

      it "404s" 

    end
  end

  describe "POST #create", :vcr do
    before do
      sign_in_as(user)
    end

    context "with flipper enabled" do
      before(:each) do
        Roster.destroy_all
      end

      before do
        GitHubClassroom.flipper[:student_identifier].enable
      end

      it "sends an event to statsd" 


      context "with no identifier_name" do
        before do
          post :create, params: { id: organization.slug, identifiers: "myemail" }
        end

        it "renders new" 


        it "does not create any rosters" 

      end

      context "with identifier_name" do
        context "with valid identifiers" do
          before do
            organization.update_attributes(roster_id: nil)
            Roster.destroy_all
            RosterEntry.destroy_all

            post :create, params: {
              id: organization.slug,
              identifiers: "email1\r\nemail2",
              identifier_name: "emails"
            }

            @roster = organization.reload.roster
            @roster_entries = @roster.roster_entries
          end

          it "redirects to organization path" 


          it "creates one roster with correct identifier_name" 


          it "creates two roster_entries" 


          it "creates roster_entries with correct identifier" 


          it "sets flash[:success]" 

        end

        context "with an empty set of identifiers" do
          before do
            post :create, params: {
              id: organization.slug,
              identifiers: "    \r\n ",
              identifier_name: "emails"
            }

            @roster = Roster.first
          end

          it "does not create a roster" 


          it "renders :new" 

        end
      end

      after do
        GitHubClassroom.flipper[:student_identifier].disable
      end
    end

    context "with flipper disabled" do
      before do
        post :create, params: { id: organization.slug }
      end

      it "404s" 

    end
  end

  describe "GET #show", :vcr do
    before do
      sign_in_as(user)
    end

    context "with flipper enabled" do
      before do
        GitHubClassroom.flipper[:student_identifier].enable
        organization.update_attributes!(roster_id: nil)
      end

      context "with no roster" do
        before do
          get :show, params: { id: organization.slug }
        end

        it "redirects to roster/new" 

      end

      context "with a roster" do
        before do
          organization.roster = create(:roster)
          organization.save

          get :show, params: { id: organization.slug }
        end

        it "succeeds" 


        it "renders roster/show" 

      end

      context "download roster button" do
        before do
          roster.roster_entries.destroy_all

          Array.new(24) do |e|
            roster.roster_entries << RosterEntry.new(identifier: "ID-#{e}")
          end
          @all_entries = roster.roster_entries
        end

        it "should exports CSV with all entries" 

      end

      after do
        GitHubClassroom.flipper[:student_identifier].disable
      end
    end

    context "with flipper disabled" do
      before do
        get :show, params: { id: organization.slug }
      end

      it "404s" 

    end
  end

  describe "PATCH #link", :vcr do
    before do
      sign_in_as(user)
    end

    context "with flipper enabled" do
      before do
        GitHubClassroom.flipper[:student_identifier].enable
      end

      context "user and entry exist" do
        before do
          # Create an unlinked user
          assignment = create(:assignment, organization: organization)
          create(:assignment_repo, assignment: assignment, user: user)

          patch :link, params: {
            id:              organization.slug,
            user_id:         user.id,
            roster_entry_id: entry.id
          }
        end

        it "redirects to #show" 


        it "creates link" 

      end

      context "user/link does not exist" do
        before do
          patch :link, params: {
            id:              organization.slug,
            user_id:         3,
            roster_entry_id: entry.id
          }
        end

        it "redirects to #show" 


        it "does not create a link" 

      end

      after do
        GitHubClassroom.flipper[:student_identifier].disable
      end
    end

    context "with flipper disabled" do
      before do
        patch :link, params: {
          id:              organization.slug,
          user_id:         3,
          roster_entry_id: 2
        }
      end

      it "404s" 

    end
  end

  describe "PATCH #unlink", :vcr do
    before do
      sign_in_as(user)
    end

    context "with flipper enabled" do
      before do
        GitHubClassroom.flipper[:student_identifier].enable
      end

      context "with a linked entry" do
        before do
          entry.user = user
          entry.save

          patch :unlink, params: {
            id:              organization.slug,
            roster_entry_id: entry.id
          }
        end

        it "redirects to roster page" 


        it "unlinks entry and user" 

      end

      context "with an unlinked entry" do
        before do
          entry.user = nil
          entry.save

          patch :unlink, params: {
            id:              organization.slug,
            roster_entry_id: entry.id
          }
        end

        it "redirects to roster page" 

      end

      after do
        GitHubClassroom.flipper[:student_identifier].disable
      end
    end

    context "with flipper disabled" do
      before do
        patch :unlink, params: {
          id:              organization.slug,
          roster_entry_id: entry.id
        }
      end

      it "404s" 

    end
  end

  describe "PATCH #add_student", :vcr do
    before do
      sign_in_as(user)
    end

    context "with flipper enabled" do
      before do
        GitHubClassroom.flipper[:student_identifier].enable
      end

      context "when identifier is valid" do
        before do
          patch :add_student, params: {
            id:         organization.slug,
            identifier: "new_entry"
          }
        end

        it "redirects to rosters page" 


        it "sets success message" 


        it "creates the student on the roster" 

      end

      context "when identifier is invalid" do
        before do
          patch :add_student, params: {
            id:         organization.slug,
            identifier: ""
          }
        end

        it "redirects to rosters page" 


        it "sets error message" 


        it "does not create the student on the roster" 

      end

      after do
        GitHubClassroom.flipper[:student_identifier].disable
      end
    end

    context "with flipper disabled" do
      before do
        patch :add_student, params: {
          id:         organization.slug,
          identifier: "Hello"
        }
      end

      it "404s" 

    end
  end

  describe "PATCH #delete_entry", :vcr do
    before do
      sign_in_as(user)
    end

    context "with flipper enabled" do
      before do
        GitHubClassroom.flipper[:student_identifier].enable
      end

      context "when there is 1 entry in the roster" do
        before do
          patch :delete_entry, params: {
            id: organization.slug,
            roster_entry_id: entry.id
          }
        end

        it "redirects to roster page" 


        it "does not remove the roster entry from the roster" 


        it "displays error message" 

      end

      context "when there are more than 1 entry in the roster" do
        before(:each) do
          @second_entry = create(:roster_entry, roster: roster)
          roster.reload

          patch :delete_entry, params: {
            roster_entry_id: entry.id,
            id:              organization.slug
          }
        end

        it "redirects to roster page" 


        it "removes the roster entry from the roster" 


        it "displays success message" 

      end

      after do
        GitHubClassroom.flipper[:student_identifier].disable
      end
    end

    context "with flipper disabled" do
      before do
        patch :delete_entry, params: {
          roster_entry_id: entry.id,
          id:              organization.slug
        }
      end

      it "404s" 

    end
  end

  describe "PATCH #remove_organization", :vcr do
    before do
      sign_in_as(user)
    end

    context "with flipper enabled" do
      before do
        GitHubClassroom.flipper[:student_identifier].enable

        roster.organizations << organization
      end

      context "when there are multiple organizations in the roster" do
        before do
          roster.organizations << create(:organization)

          patch :remove_organization, params: {
            id: organization.slug
          }
        end

        it "does not destroy the organization" 


        it "removes organization from roster" 


        it "renders success message" 


        it "redirects to organization path" 

      end

      context "when there is one organization in the roster" do
        before do
          patch :remove_organization, params: {
            id: organization.slug
          }
        end

        it "destroys the roster" 


        it "nullifies organization.roster" 


        it "renders success message" 


        it "redirects to organization path" 

      end

      after do
        GitHubClassroom.flipper[:student_identifier].disable
      end
    end

    context "with flipper disabled" do
      before do
        patch :remove_organization, params: {
          id: organization.slug
        }
      end

      it "404s" 

    end
  end
end

