require "rails_helper"

RSpec.describe UserSimilarity, vcr: {} do
  let(:user) { create(:user, summary: "I like ruby and JavaScript and Go") }
  let(:similar_user) { create(:user, summary: "I like JavaScript and Go") }
  let(:dissimilar_user) { create(:user, summary: "I like Haskell and functional programming") }

  it "It returns similar user" 


  it "Is not affected by stop words" 


  it "Is affected by non-stop words" 

end

