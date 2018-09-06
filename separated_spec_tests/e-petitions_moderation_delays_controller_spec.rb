require 'rails_helper'

RSpec.describe Admin::ModerationDelaysController, type: :controller, admin: true do
  context "when not logged in" do
    [
      ["GET", "/admin/moderation-delay/new", :new, {}],
      ["POST", "/admin/moderation-delay", :create, {}]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the login page" 

      end

    end
  end

  context "when logged in as a moderator requiring a password reset" do
    let(:moderator) { FactoryBot.create(:moderator_user, force_password_reset: true) }
    before { login_as(moderator) }

    [
      ["GET", "/admin/moderation-delay/new", :new, {}],
      ["POST", "/admin/moderation-delay", :create, {}]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the admin profile page" 

      end

    end
  end

  context "when logged in as a moderator" do
    let(:moderator) { FactoryBot.create(:moderator_user) }
    before { login_as(moderator) }


    describe "GET /admin/moderation-delay/new" do
      before { get :new }

      it "returns 200 OK" 


      it "renders the :new template" 

    end

    describe "POST /admin/moderation-delay" do
      describe "sending a preview email" do
        let!(:petition) { FactoryBot.create(:sponsored_petition, :overdue, sponsors_signed: true) }

        before do
          perform_enqueued_jobs do
            post :create, moderation_delay: params, email_preview: "Email preview"
          end
        end

        context "with invalid params" do
          let :params do
            { subject: "", body: "" }
          end

          it "returns 200 OK" 


          it "renders the :new template" 


          it "doesn't send an email" 


          it "doesn't set the moderation_delay attributes in the session" 

        end

        context "with valid params" do
          let :params do
            {
              subject: "Moderation of your petition is delayed",
              body: "Sorry, but moderation of your petition is delayed for reasons."
            }
          end

          let :email do
            deliveries.last
          end

          it "renders the :new template" 


          it "sets the flash notice message" 


          it "sends an email to the feedback address" 


          it "sets the moderation_delay attributes in the session" 

        end
      end

      describe "sending email to the creators" do
        let!(:petition_1) do
          FactoryBot.create(
            :sponsored_petition, :overdue,
            sponsors_signed: true,
            creator_attributes: {
              name: "Barry Butler",
              email: "bazbutler@gmail.com"
            }
          )
        end

        let!(:petition_2) do
          FactoryBot.create(
            :sponsored_petition, :overdue,
            sponsors_signed: true,
            creator_attributes: {
              name: "Laura Palmer",
              email: "laurapalmer@gmail.com"
            }
          )
        end

        before do
          perform_enqueued_jobs do
            post :create, moderation_delay: params, email_creators: "Email creators"
          end
        end

        context "with invalid params" do
          let :params do
            { subject: "", body: "" }
          end

          it "returns 200 OK" 


          it "renders the :new template" 


          it "doesn't send an email" 


          it "doesn't set the moderation_delay attributes in the session" 

        end

        context "with valid params" do
          let :params do
            {
              subject: "Moderation of your petition is delayed",
              body: "Sorry, but moderation of your petition is delayed for reasons."
            }
          end

          let :email_1 do
            deliveries.first
          end

          let :email_2 do
            deliveries.last
          end

          it "redirects to the overdue petitions page" 


          it "sets the flash notice message" 


          it "sends an email to the creators" 


          it "sets the moderation_delay attributes in the session" 

        end
      end
    end
  end
end

