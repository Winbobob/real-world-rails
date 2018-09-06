require 'rails_helper'

RSpec.describe Admin::ParliamentsController, type: :controller, admin: true do
  context "when not logged in" do
    [
      ["GET", "/admin/parliament", :show, {}],
      ["PATCH", "/admin/parliament", :update, {}]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the login page" 

      end

    end
  end

  context "when logged in as a moderator" do
    let(:moderator) { FactoryBot.create(:moderator_user) }
    before { login_as(moderator) }

    [
      ["GET", "/admin/parliament", :show, {}],
      ["PATCH", "/admin/parliament", :update, {}]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the admin hub page" 

      end

    end
  end

  context "when logged in as a sysadmin" do
    let(:sysadmin) { FactoryBot.create(:sysadmin_user) }
    before { login_as(sysadmin) }

    describe "GET /admin/parliament" do
      before { get :show }

      it "returns 200 OK" 


      it "renders the :show template" 

    end

    describe "PATCH /admin/parliament" do
      let(:parliament) { Parliament.last }

      context "when clicking the Save button" do
        before { patch :update, parliament: params, commit: "Save" }

        context "and the params are invalid" do
          let :params do
            {
              government: "",
              opening_at: "",
              dissolution_at: 2.weeks.from_now.iso8601,
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "returns 200 OK" 


          it "renders the :show template" 

        end

        context "and the params are valid" do
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: 2.weeks.from_now.iso8601,
              dissolution_heading: "Parliament is dissolving",
              dissolution_message: "This means all petitions will close in 2 weeks",
              dissolution_faq_url: "https://parliament.example.com/parliament-is-closing"
            }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 

        end
      end

      context "when clicking the Email Creators button" do
        before { patch :update, parliament: params, email_creators: "Email Creators" }

        context "and the params are invalid" do
          let :params do
            {
              government: "",
              opening_at: "",
              dissolution_at: 2.weeks.from_now.iso8601,
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "returns 200 OK" 


          it "renders the :show template" 

        end

        context "and the params are valid" do
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: 2.weeks.from_now.iso8601,
              dissolution_heading: "Parliament is dissolving",
              dissolution_message: "This means all petitions will close in 2 weeks",
              dissolution_faq_url: "https://parliament.example.com/parliament-is-closing"
            }
          end

          let :notify_creators_job do
            { job: NotifyCreatorsThatParliamentIsDissolvingJob, args: [], queue: "high_priority" }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 


          it "enqueues a job to notify creators" 

        end

        context "and the params are valid but parliament isn't dissolving" do
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: "",
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 


          it "doesn't enqueue a job to notify creators" 

        end
      end

      context "when clicking the Schedule Closure button" do
        before { patch :update, parliament: params, schedule_closure: "Schedule Closure" }

        context "and the params are invalid" do
          let :params do
            {
              government: "",
              opening_at: "",
              dissolution_at: 2.weeks.from_now.iso8601,
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "returns 200 OK" 


          it "renders the :show template" 

        end

        context "and the params are valid" do
          let(:dissolution_at) { 2.weeks.from_now.beginning_of_minute }
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: dissolution_at.iso8601,
              dissolution_heading: "Parliament is dissolving",
              dissolution_message: "This means all petitions will close in 2 weeks",
              dissolution_faq_url: "https://parliament.example.com/parliament-is-closing"
            }
          end

          let :close_petitions_early_job do
            {
              job: ClosePetitionsEarlyJob,
              args: [dissolution_at.iso8601],
              queue: "high_priority",
              at: dissolution_at.to_f
            }
          end

          let :stop_petitions_early_job do
            {
              job: StopPetitionsEarlyJob,
              args: [dissolution_at.iso8601],
              queue: "high_priority",
              at: dissolution_at.to_f
            }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 


          it "enqueues a job to close petitions" 


          it "enqueues a job to stop petitions" 

        end

        context "and the params are valid but parliament isn't dissolving" do
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: "",
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 


          it "doesn't enqueue a job to notify creators" 

        end
      end

      context "when clicking the Archive Petitions button" do
        before { patch :update, parliament: params, archive_petitions: "Archive Petitions" }

        context "and the params are invalid" do
          let :params do
            {
              government: "",
              opening_at: "",
              dissolution_at: 2.weeks.from_now.iso8601,
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "returns 200 OK" 


          it "renders the :show template" 

        end

        context "and the params are valid" do
          let(:dissolution_at) { 2.weeks.ago }
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: dissolution_at.iso8601,
              dissolution_heading: "Parliament is dissolving",
              dissolution_message: "This means all petitions will close in 2 weeks",
              dissolution_faq_url: "https://parliament.example.com/parliament-is-closing",
              dissolved_heading: "Parliament is dissolved",
              dissolved_message: "All petitions are now closed"
            }
          end

          let :archive_petitions_job do
            {
              job: ArchivePetitionsJob,
              args: [],
              queue: "high_priority"
            }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 


          it "enqueues a job to archive petitions" 


          it "sets the archiving_started_at timestamp" 

        end

        context "and the params are valid but parliament isn't dissolving" do
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: "",
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 


          it "doesn't enqueue a job to archive petitions" 


          it "doesn't set the archiving_started_at timestamp" 

        end
      end

      context "when clicking the Archive Parliament button" do
        before { FactoryBot.create(:closed_petition, archived_at: 1.hour.ago) }
        before { FactoryBot.create(:parliament, archiving_started_at: 1.day.ago) }
        before { patch :update, parliament: params, archive_parliament: "Archive Parliament" }

        context "and the params are invalid" do
          let :params do
            {
              government: "",
              opening_at: "",
              dissolution_at: 2.weeks.from_now.iso8601,
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "returns 200 OK" 


          it "renders the :show template" 

        end

        context "and the params are valid" do
          let(:dissolution_at) { 2.weeks.ago }
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: dissolution_at.iso8601,
              dissolution_heading: "Parliament is dissolving",
              dissolution_message: "This means all petitions will close in 2 weeks",
              dissolution_faq_url: "https://parliament.example.com/parliament-is-closing",
              dissolved_heading: "Parliament is dissolved",
              dissolved_message: "All petitions are now closed"
            }
          end

          let :delete_petitions_job do
            {
              job: DeletePetitionsJob,
              args: [],
              queue: "high_priority"
            }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 


          it "enqueues a job to archive petitions" 


          it "sets the archived_at timestamp" 

        end

        context "and the params are valid but parliament isn't dissolving" do
          let :params do
            {
              government: "Conservative",
              opening_at: 2.years.ago.iso8601,
              dissolution_at: "",
              dissolution_heading: "",
              dissolution_message: "",
              dissolution_faq_url: ""
            }
          end

          it "redirects to the admin dashboard page" 


          it "sets the flash notice message" 


          it "doesn't enqueue a job to delete petitions" 


          it "doesn't set the archived_at timestamp" 

        end
      end
    end
  end
end

