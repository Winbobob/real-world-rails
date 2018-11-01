require 'rails_helper'

RSpec.describe Admin::ModerationController, type: :controller, admin: true do

  describe "logged in" do
    let(:user) { FactoryBot.create(:moderator_user) }
    before { login_as(user) }

    let(:petition) do
      FactoryBot.create(:sponsored_petition,
        creator_attributes: {
          name: "Barry Butler",
          email: "bazbutler@gmail.com"
        },
        sponsor_count: 5,
        moderation_threshold_reached_at: 4.days.ago
      )
    end

    context "update" do
      before { ActionMailer::Base.deliveries.clear }
      let(:patch_options) { {} }

      def do_patch(options = patch_options)
        params = { petition_id: petition.id }.merge(petition: options)
        patch :update, params
      end

      it "is unsuccessful for a petition that is not validated" 


      context "when moderation param is 'approve'" do
        let(:now) { Time.current }
        let(:deliveries) { ActionMailer::Base.deliveries }
        let(:creator_email) { deliveries.select{ |m| m.to == %w[bazbutler@gmail.com] }.last }
        let(:sponsor_email) { deliveries.detect{ |m| m.to == %w[laurapalmer@gmail.com] } }
        let(:pending_email) { deliveries.detect{ |m| m.to == %w[sandyfisher@hotmail.com] } }
        let(:duration) { Site.petition_duration.months }
        let(:closing_date) { (now + duration).end_of_day }
        let!(:sponsor) { FactoryBot.create(:sponsor, :pending, petition: petition, email: "laurapalmer@gmail.com") }
        let!(:pending_sponsor) { FactoryBot.create(:sponsor, :pending, petition: petition, email: "sandyfisher@hotmail.com") }

        before do
          perform_enqueued_jobs do
            sponsor.validate!
            do_patch moderation: 'approve'
            petition.reload
          end
        end

        it "opens the petition" 


        it "sets the open date to now" 


        it "sets the moderation lag" 


        it "redirects to the admin show page for the petition page" 


        it "sends an email to the petition creator" 


        it "sends an email to validated petition sponsors" 


        it "doesn't send an email to pending petition sponsors" 

      end

      context "when moderation param is 'reject'" do
        let(:rejection_code) { 'duplicate' }
        let(:patch_options) do
          {
            moderation: 'reject',
            rejection: { code: rejection_code }
          }
        end
        let(:deliveries) { ActionMailer::Base.deliveries }
        let(:creator_email) { deliveries.detect{ |m| m.to == %w[bazbutler@gmail.com] } }
        let(:sponsor_email) { deliveries.detect{ |m| m.to == %w[laurapalmer@gmail.com] } }
        let(:pending_email) { deliveries.detect{ |m| m.to == %w[sandyfisher@hotmail.com] } }
        let!(:sponsor) { FactoryBot.create(:sponsor, :validated, petition: petition, email: "laurapalmer@gmail.com") }
        let!(:pending_sponsor) { FactoryBot.create(:sponsor, :pending, petition: petition, email: "sandyfisher@hotmail.com") }

        before do
          perform_enqueued_jobs do
            do_patch
            petition.reload
          end
        end

        shared_examples_for 'rejecting a petition' do
          let(:now) { Time.current }

          it 'sets the petition state to "rejected"' 


          it "sets the petition rejected date to now" 


          it "sets the moderation lag" 


          it 'sets the rejection code to the supplied code' 


          it 'redirects to the admin show page for the petition' 


          it "sends an email to the petition creator" 


          it "sends an email to validated petition sponsors" 


          it "does not send an email to pending petition sponsors" 

        end

        context 'with rejection code of "duplicate"' do
          let(:rejection_code) { 'duplicate' }

          it_behaves_like 'rejecting a petition'
        end

        shared_examples_for 'hiding a petition' do
          let(:now) { Time.current }

          it 'sets the petition state to "hidden"' 


          it "sets the petition rejected date to now" 


          it "sets the moderation lag" 


          it 'sets the rejection code to the supplied code' 


          it 'redirects to the admin show page for the petition' 


          it "sends an email to the petition creator" 


          it "sends an email to validated petition sponsors" 


          it "does not send an email to pending petition sponsors" 

        end

        context 'with rejection code of "offensive"' do
          let(:rejection_code) { 'offensive' }

          it_behaves_like 'hiding a petition'
        end

        context 'with rejection code of "libellous"' do
          let(:rejection_code) { 'libellous' }

          it_behaves_like 'hiding a petition'
        end

        context 'with no rejection code' do
          let(:rejection_code) { '' }

          it "leaves the state alone, in the DB and in-memory" 


          it "renders the admin petitions show template" 

        end
      end

      context "when moderation param is 'flag'" do
        let(:email) { ActionMailer::Base.deliveries.last }

        before do
          do_patch moderation: 'flag'
          petition.reload
        end

        it "flags the petition" 


        it "does not set the open date" 


        it "does not set the rejected date" 


        it "does not set the moderation lag" 


        it "redirects to the admin show page for the petition page" 


        it "does not send an email to the petition creator" 

      end
    end
  end
end

