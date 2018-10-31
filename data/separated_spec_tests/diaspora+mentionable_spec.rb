# frozen_string_literal: true

describe Diaspora::Mentionable do
  include PeopleHelper

  let(:people) { [alice, bob, eve].map(&:person) }
  let(:names) { %w(Alice\ A Bob\ B "Eve>\ E) }

  let(:test_text_with_names) { <<-STR }
This post contains a lot of mentions
one @{#{names[0]}; #{people[0].diaspora_handle}},
two @{#{names[1]}; #{people[1].diaspora_handle}} and finally
three @{#{names[2]}; #{people[2].diaspora_handle}}.
STR

  let(:test_text_without_names) { <<-STR }
This post contains a lot of mentions
one @{#{people[0].diaspora_handle}},
two @{#{people[1].diaspora_handle}} and finally
three @{#{people[2].diaspora_handle}}.
STR

  describe ".mention_attrs" do
    it "returns name and diaspora ID" 


    it "returns only diaspora-ID when no name is included" 


    it "trims the name if available" 

  end

  describe ".format" do
    context "html output" do
      it "adds the links to the formatted message" 


      it "adds the links to the formatted message and uses the names from the people" 


      it "should work correct when message is escaped html" 


      it "escapes the link title (name)" 

    end

    context "plain text output" do
      it "removes mention markup and displays unformatted name" 

    end

    it "leaves the names of people that cannot be found" 


    it "uses the diaspora ID when the person cannot be found" 

  end

  describe ".people_from_string" do
    it "extracts the mentioned people from the text" 


    it "extracts the mentioned people from the text without name" 


    it "extracts the mentioned people from the text mixed mentions (with and without name)" 


    describe "returns an empty array if nobody was found" do
      it "gets a post without mentions" 


      it "gets a post with invalid handles" 


      it "filters duplicate handles" 


      it "fetches unknown handles" 


      it "handles DiscoveryError" 

    end
  end

  describe ".filter_people" do
    let(:user_a) { FactoryGirl.create(:user_with_aspect, username: "user_a") }
    let(:user_b) { FactoryGirl.create(:user, username: "user_b") }
    let(:user_c) { FactoryGirl.create(:user, username: "user_c") }

    before do
      user_a.aspects.create!(name: "second")

      user_a.share_with(user_b.person, user_a.aspects.where(name: "generic"))
      user_a.share_with(user_c.person, user_a.aspects.where(name: "second"))
    end

    it "filters mention, if contact is not in a given aspect" 


    it "leaves mention, if contact is in a given aspect" 


    it "works if the person cannot be found" 

  end
end

