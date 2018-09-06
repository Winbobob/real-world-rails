require 'spec_helper'

describe ChallengeSignupsController, type: :controller do

  let(:tag_set1) { create(:tag_set) }
  let(:signup) { create(:challenge_signup) }

  describe "gift_exchange_to_csv" do
    let(:tag_set2) { create(:tag_set) }
    let(:gift_exchange) { create(:gift_exchange) }
    let(:collection) { create(:collection,
                              challenge: gift_exchange,
                              challenge_type: "GiftExchange",
                              signups: [signup]) }

    before do
      signup.offers = [create(:offer,
                              collection_id: collection.id,
                              challenge_signup_id: signup.id,
                              tag_set: tag_set1)]
      signup.requests = [create(:request,
                                collection_id: collection.id,
                                challenge_signup_id: signup.id,
                                tag_set: tag_set2)]
    end

    it "generates a CSV with all the challenge information" 

  end

  describe "prompt_meme_to_csv" do
    let(:prompt_meme) { create(:prompt_meme) }
    let(:collection) { create(:collection,
                              challenge: prompt_meme,
                              challenge_type: "PromptMeme")
    }

    before do
      collection.signups << signup
      signup.requests = [create(:request,
                                collection_id: collection.id,
                                challenge_signup_id: signup.id,
                                tag_set: tag_set1)]
    end

    it "generates a CSV with all the challenge information" 

  end
end

