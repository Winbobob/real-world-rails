require "spec_helper"
require "twitter_person_adapter"

describe TwitterPersonAdapter do
  let(:person) { Person.new }
  let(:twitter_user) { Twitter::User.new(id: 1234,
                                         screen_name: "HappyHappyJoyJoy") }
  let(:adapter) { TwitterPersonAdapter.new(person) }

  describe "#run" do
    it "takes twitter data and returns suitable attributes" 

  end
end

