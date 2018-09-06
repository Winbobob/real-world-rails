require "rails_helper"

describe DonationsMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include Rails.application.routes.url_helpers

  describe "#request_confirmation" do
    it "includes a link to the Donation's edit page" 

  end

  def have_edit_link_for(donation)
    have_body_text(edit_donation_url(donation))
  end

  def have_confirmation_prompt
    have_body_text(t("donations_mailer.request_confirmation.prompt"))
  end

  def mention_time_range_for(donation)
    have_body_text donation.time_range.to_s
  end

  def have_subject_for(donation)
    have_subject subject_for(donation)
  end

  def subject_for(donation)
    t(
      "donations_mailer.request_confirmation.subject",
      range: donation.time_range,
    )
  end
end

