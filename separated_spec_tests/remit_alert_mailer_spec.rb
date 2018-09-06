require "rails_helper"

RSpec.shared_examples_for "alert mail" do
  it "renders the subject" 


  it "sends to the user's email" 


  it "has the right body" 

end

RSpec.describe AlertMailer, type: :mailer do
  let(:study) do
    FactoryGirl.create(
      :study,
      id: 1,
      title: "Test Study longer than thirty characters to test truncation",
      reference_number: "ABC123",
      expected_completion_date: Date.new(2015, 2, 15),
      erb_submitted: Date.new(2015, 2, 15),
      erb_approval_expiry: Date.new(2015, 2, 15))
  end
  let(:user) { FactoryGirl.create(:user, name: "Steve Day") }

  describe "#delayed_completing" do
    let(:mail) { AlertMailer.delayed_completing(study, user) }
    let(:fixture) do
      Rails.root.join("spec",
                      "fixtures",
                      "alert_mailer",
                      "delayed_completing.txt")
    end
    let(:expected_subject) do
      "Study ABC123 (Test Study longer than thir...) is marked as " \
      "incomplete in ReMIT"
    end

    before do
      mail.deliver_now
    end

    it_behaves_like "alert mail"
  end

  describe "#approval_expiring" do
    let(:mail) { AlertMailer.approval_expiring(study, user) }
    let(:fixture) do
      Rails.root.join("spec",
                      "fixtures",
                      "alert_mailer",
                      "approval_expiring.txt")
    end
    let(:expected_subject) do
      "Study ABC123 (Test Study longer than thir...) ERB approval is expiring"
    end

    before do
      mail.deliver_now
    end

    it_behaves_like "alert mail"
  end

  describe "#response_overdue" do
    let(:mail) { AlertMailer.response_overdue(study, user) }
    let(:fixture) do
      Rails.root.join("spec",
                      "fixtures",
                      "alert_mailer",
                      "response_overdue.txt")
    end
    let(:expected_subject) do
      "Study ABC123 (Test Study longer than thir...) has been with the ERB " \
      "for 3 months"
    end

    before do
      mail.deliver_now
    end

    it_behaves_like "alert mail"
  end
end

