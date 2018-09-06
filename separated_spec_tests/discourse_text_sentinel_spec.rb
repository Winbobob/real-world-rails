# encoding: utf-8

require 'rails_helper'
require 'text_sentinel'

describe TextSentinel do

  it "allows utf-8 chars" 


  context "entropy" do

    it "returns 0 for an empty string" 


    it "returns 0 for a nil string" 


    it "returns 1 for a string with many leading spaces" 


    it "returns 1 for one char, even repeated" 


    it "returns an accurate count of many chars" 


    it "Works on foreign characters" 


    it "generates enough entropy for short foreign strings" 


    it "handles repeated foreign characters" 


  end

  context 'body_sentinel' do
    [ 'evil trout is evil',
      "去年十社會警告",
      "P.S. Пробирочка очень толковая и весьма умная, так что не обнимайтесь.",
      "Look: 去年十社會警告"
    ].each do |valid_body|
      it "handles a valid body in a private message" 


      it "handles a valid body in a public post" 

    end

  end

  context "validity" do

    let(:valid_string) { "This is a cool topic about Discourse" }

    it "allows a valid string" 


    it "doesn't allow all caps topics" 


    it "doesn't allow all caps foreign topics" 


    it "allows all caps topics when loud posts are allowed" 


    it "enforces the minimum entropy" 


    it "enforces the minimum entropy" 


    it "allows all foreign characters" 


    it "doesn't allow a long alphanumeric string with no spaces" 


    it "doesn't accept junk symbols as a string" 


    it "does allow a long alphanumeric string joined with slashes" 


    it "does allow a long alphanumeric string joined with dashes" 


    it "allows a long string with periods" 


    it "allows a long string with colons" 


  end

  context 'title_sentinel' do

    it "uses a sensible min entropy value when min title length is less than title_min_entropy" 


  end

  context 'body_sentinel' do

    it "uses a sensible min entropy value when min body length is less than min entropy" 


    it "uses a sensible min entropy value when min pm body length is less than min entropy" 

  end

end

