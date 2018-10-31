# frozen_string_literal: true

require Rails.root.join('spec', 'shared_behaviors', 'stream')

describe Stream::Person do
  describe "shared behaviors" do
    before do
      @stream = Stream::Person.new(alice, bob.person, max_time: Time.zone.now, order: "updated_at")
    end

    it_should_behave_like "it is a stream"
  end

  describe "#posts" do
    it "calls user#posts_from if the user is present" 

  end

  it "returns the most recent posts" 

end

