require "rails_helper"

RSpec.describe DefenceRequestForm do

  let (:defence_request) { FactoryGirl.create(:defence_request) }
  let (:params_for_dr) do
    defence_request_params = FactoryGirl.attributes_for(:defence_request)

    {
      detainee_name: defence_request_params[:detainee_name],
      gender: defence_request_params[:gender],
      offences: defence_request_params[:offences],
      time_of_arrival: datetime_to_params(defence_request_params[:time_of_arrival]),
      comments: defence_request_params[:comments]
    }
  end
  let(:params) { {} }

  subject(:form) { described_class.new(defence_request, params) }

  describe "#initialize" do
    context "with params" do
      let(:params) { params_for_dr }

      it "assigns the params to the defence request" 

    end
  end

  describe "submit" do
    subject { form.submit }

    context "with valid params" do
      let(:params) { params_for_dr }

      it "returns true, and has no errors" 

    end

    context "with invalid params" do
      context "invalid attribute on the dr" do
        let(:params) { params_for_dr.merge({ gender: "" }) }

        it "adds any errors from the dr, to itself" 

      end

      context "invalid field object" do
        context "that is has presence validated on the dr" do
          let(:params) { params_for_dr.merge({ time_of_arrival: invalid_time_of_arrival }) }

          context "blank" do
            let(:invalid_time_of_arrival) { { date: "",
                                              hour: "",
                                              min: "" } }
            let(:expected_error_message) {
              "You must give the detainee’s arrival time (eg 23 10) - please give hour, minutes and date (DD/MM/YYYY)"
            }

            it "adds errors from the field object to itself" 

          end

          context "not blank" do
            let(:invalid_time_of_arrival) { { date: "I",
                                              hour: "BROKEN",
                                              min: "!" } }
            let(:expected_error_message) {
              "You must give the detainee’s arrival time (eg 23 10) - please give hour, minutes and date (DD/MM/YYYY)"
            }

            it "adds errors from the field object to itself" 

          end
        end

        context "that does not have presence validated on the dr" do
          let(:params) { params_for_dr.merge({ interview_start_time: invalid_interview_start_time }) }

          context "blank" do
            let(:invalid_interview_start_time) { { date: "",
                                                   hour: "",
                                                   min: "" } }


            it "it does not add any errors to itself" 

          end

          context "not blank" do
            let(:invalid_interview_start_time) { { date: "I",
                                                   hour: "BROKEN",
                                                   min: "!" } }
            let(:expected_error_message) {
              "Check that you’ve given a valid interview time (eg 23 10) - please give hour, minutes and date (DD/MM/YYYY)"
            }

            it "adds errors from the field object to itself" 

          end
        end
      end

    end
  end
end

def datetime_to_params(datetime)
  { date: datetime.to_date.to_s(:full),
    hour: datetime.hour.to_s,
    min: datetime.min.to_s }
end

def date_to_params(datetime)
  { year: datetime.year.to_s,
    month: datetime.month.to_s,
    day: datetime.day.to_s }
end

