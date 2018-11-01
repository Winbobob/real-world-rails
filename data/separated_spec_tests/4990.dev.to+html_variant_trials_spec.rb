require "rails_helper"

RSpec.describe "HtmlVariantTrials", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article, user_id: user.id, approved: true) }
  let(:html_variant) { create(:html_variant) }

  before do
    Delayed::Worker.delay_jobs = false
  end

  after do
    Delayed::Worker.delay_jobs = true
  end

  describe "POST /html_variant_trials" do
    it "rejects non-permissioned user" 

  end
end

