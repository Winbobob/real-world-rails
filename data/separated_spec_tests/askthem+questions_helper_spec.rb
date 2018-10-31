require "spec_helper"

describe QuestionsHelper do
  describe "#step_class_for" do
    it "returns html class that indicates if not first step" 

  end

  describe "#question_progress_percent" do
    it "returns given questions percentage towards goal" 

  end

  describe "#current_url_without_share" do
    it "returns url without sharing modal triggered" 

  end

  describe "#current_url_without_share_encoded" do
    it "returns url without sharing modal triggered and encoded" 

  end

  describe "#facebook_question_share" do
    it "returns facebook share button html" 


    def facebook_html
      "<a href=\"https://www.facebook.com/sharer.php?u=//blart/?q=x\"><i class=\"icon-facebook\"></i> y</a>"
    end
  end

  describe "#twitter_question_share" do
    it "returns twitter share button html" 


    def twitter_html
      "<a href=\"https://twitter.com/share?text=z&url=//blart/?q=x\"><i class=\"icon-twitter\"></i> y</a>"
    end
  end

  describe "#google_plus_question_share" do
    it "returns google plus share button html" 


    def google_plus_html
      "<a href=\"https://plus.google.com/share?url=//blart/?q=x\"><i class=\"icon-google-plus\"></i> y</a>"
    end
  end

  describe "#mail_body_for" do
    it "returns text of mail body that matches question" 

  end

  describe "#mail_question_share" do
    it "returns mail share button html" 


    def mail_html
      "<a href=\"mailto:?subject=z&body=#{mail_body_text}\"><i class=\"icon-envelope-alt\"></i> y</a>"
    end
  end

  def mail_body_text
    "Sign%20on%20to%20this%20question%20on%20AskThem,%20a%20new%20platform%20for%20questions-and-answers%20with%20public%20figures.%0A%0AWhen%20it%20reaches%20the%20signature%20threshold,%20AskThem%20will%20deliver%20it%20to%20its%20target%20and%20ask%20for%20a%20public%20response:%0A%0A%0Axxx%0A%0Ahttp://test.host%0A%0A%0AAskThem%20is%20free,%20open-source,%20and%20non-profit,%20working%20to%20change%20the%20civic%20culture%20to%20ask%20good%20questions%20of%20people%20in%20power."
  end

  describe "#where_from_for" do
    let(:user) { FactoryGirl.build(:user, locality: "Berlin", region: "vt") }

    context "when there is locality and region for given user" do
      it "returns formatted string of location" 

    end

    context "when there is only one of locality or region for given user" do
      it "returns formatted string without missing info" 

    end

    context "when there is no locality and region for given user" do
      it "returns formatted string of location" 

    end
  end
end

