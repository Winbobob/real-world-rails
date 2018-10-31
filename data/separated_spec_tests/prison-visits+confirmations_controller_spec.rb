require 'rails_helper'

RSpec.describe ConfirmationsController, type: :controller do
  include ActiveJobHelper

  render_views

  let(:mock_metrics_logger) { double('metrics_logger') }
  let(:visit) { sample_visit }
  let(:encrypted_visit) { MESSAGE_ENCRYPTOR.encrypt_and_sign(visit) }

  context "in correct IP range" do
    context "before interaction" do
      before do
        allow(controller).to receive(:metrics_logger).and_return(mock_metrics_logger)
        allow(controller).to receive(:reject_without_key_or_trusted_ip!)
      end

      it "resurrects the visit" 


      it "doesn't resurrect a visit which has already been booked" 


      it "doesn't resurrect a visit which has been cancelled by the visitor" 


      it "bails out if the state is not present" 


      it "bails out if the state is corrupt" 

    end

    context "interaction" do
      before do
        ActionMailer::Base.deliveries.clear
        allow_any_instance_of(VisitorMailer).to receive(:sender).and_return('test@example.com')
        allow_any_instance_of(PrisonMailer).to receive(:sender).and_return('test@example.com')
        allow(controller).to receive(:metrics_logger).and_return(mock_metrics_logger)
        allow(controller).to receive(:reject_without_key_or_trusted_ip!)
      end

      context "when a form is submitted with a slot selected" do
        it "sends out an e-mail and records a metric" 


        after do
          post :create, confirmation: { outcome: 'slot_0', vo_number: '55512345' }, state: encrypted_visit
          expect(response).to redirect_to(show_confirmation_path(visit_id: visit.visit_id))
          expect(ActionMailer::Base.deliveries.map(&:subject)).to eq(
            [
              "Visit confirmed: your visit for Sunday 7 July has been confirmed",
              "COPY of booking confirmation for Jimmy Harris"
            ]
          )
        end
      end

      context "when a form is submitted with banned or unlisted visitors and a succesful slot allocation" do
        before do
          expect(mock_metrics_logger).
            to receive(:record_booking_confirmation).
            with(same_visit(visit))
        end

        it "sends out an e-mail for an unlisted visitor" 


        it "sends out an e-mail for a banned visitor" 


        it "sends out an e-mail for both banned an unlisted visitor" 


        after do
          expect(response).to redirect_to(show_confirmation_path(visit_id: visit.visit_id))
          expect(ActionMailer::Base.deliveries.map(&:subject)).to eq(
            [
              "Visit confirmed: your visit for Sunday 7 July has been confirmed",
              "COPY of booking confirmation for Jimmy Harris"
            ]
          )
        end
      end

      context "when a form is submitted with banned or unlisted visitors and no other outcome" do
        before do
          expect(mock_metrics_logger).
            to receive(:record_booking_rejection).
            with(same_visit(visit), nil)
        end

        it "sends rejection e-mail for an unlisted visitor" 


        it "sends rejection e-mail for a banned visitor" 


        it "sends rejection e-mail for both banned an unlisted visitor" 


        after do
          expect(response).to redirect_to(show_confirmation_path(visit_id: visit.visit_id))
          expect(ActionMailer::Base.deliveries.map(&:subject)).to eq(
            [
              "Visit cannot take place: your visit for Sunday 7 July could not be booked",
              "COPY of booking rejection for Jimmy Harris"
            ]
          )
        end
      end

      context "when a form is submitted and the prisoner has no allowance remaining" do
        before do
          expect(mock_metrics_logger).
            to receive(:record_booking_rejection).
            with(same_visit(visit), Confirmation::NO_ALLOWANCE)
        end

        it "sends out an e-mail and records a metric" 


        it "sends out an e-mail with VO renewal date and records a metric" 


        it "sends out an e-mail with VO & PVO renewal dates and records a metric" 


        after do
          expect(response).to redirect_to(show_confirmation_path(visit_id: visit.visit_id))
          expect(ActionMailer::Base.deliveries.map(&:subject)).to eq(
            [
              "Visit cannot take place: your visit for Sunday 7 July could not be booked",
              "COPY of booking rejection for Jimmy Harris"
            ]
          )
        end
      end

      context "when a form is submitted and the prisoner details are incorrect" do
        it "sends out an e-mail and records a metric" 


        after do
          post :create,
            confirmation: {
              outcome: Confirmation::PRISONER_INCORRECT
            },
            state: encrypted_visit
          expect(response).to redirect_to(show_confirmation_path(visit_id: visit.visit_id))
          expect(ActionMailer::Base.deliveries.map(&:subject)).to eq(
            [
              "Visit cannot take place: your visit for Sunday 7 July could not be booked",
              "COPY of booking rejection for Jimmy Harris"
            ]
          )
        end
      end

      context "when a form is submitted and the prisoner is not at the prison" do
        it "sends out an e-mail and records a metric" 


        after do
          post :create,
            confirmation: {
              outcome: Confirmation::PRISONER_NOT_PRESENT
            },
            state: encrypted_visit
          expect(response).to redirect_to(show_confirmation_path(visit_id: visit.visit_id))
          expect(ActionMailer::Base.deliveries.map(&:subject)).to eq(
            [
              "Visit cannot take place: your visit for Sunday 7 July could not be booked",
              "COPY of booking rejection for Jimmy Harris"
            ]
          )
        end
      end

      context "when a form is submitted without a slot" do
        it "sends out an e-mail and records a metric" 


        after do
          post :create,
            confirmation: {
              outcome: Confirmation::NO_SLOT_AVAILABLE
            },
            state: encrypted_visit
          expect(response).to redirect_to(show_confirmation_path(visit_id: visit.visit_id))
          expect(ActionMailer::Base.deliveries.map(&:subject)).to eq(
            [
              "Visit cannot take place: your visit for Sunday 7 July could not be booked",
              "COPY of booking rejection for Jimmy Harris"
            ]
          )
        end
      end

      context "when an incomplete form is submitted" do
        it "redirects back to the new action" 

      end

      context "when the thank you screen is accessed" do
        it "resets the session" 

      end
    end
  end

  context "IP restrictions" do
    it "denies all other requests" 

  end
end

