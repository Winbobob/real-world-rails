require "rails_helper"

RSpec.describe AboutController, type: :controller do
  describe "GET #library" do
    let(:status)  { create(:status, :published) }
    let!(:featured_current_events) { create(:article, slug:"feature-report-back-from-the-battle-for-sacred-ground", status: status, published_at: Date.current) }
    let!(:featured_strategy_and_analysis) { create(:article, slug:"feature-understanding-the-kurdish-resistance-historical-overview-eyewitness-report", status: status, published_at: Date.current)}
    let!(:featured_theory_and_critique) { create(:article, slug:"feature-from-democracy-to-freedom", status: status, published_at: Date.current) }
    let!(:featured_classics) { create(:article, slug:"why-we-dont-make-demands", status: status, published_at: Date.current) }

    it "assigns all instance variables" 

  end

  describe "GET #post_order_success" do
    it "assigns all instance variables" 

  end
end

