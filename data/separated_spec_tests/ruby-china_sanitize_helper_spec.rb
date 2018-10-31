# frozen_string_literal: true

require "rails_helper"

describe ApplicationHelper, type: :helper do
  describe ".sanitize_markdown" do
    describe "<a href>" do
      it "should work relative link" 


      it "should work url link" 


      it "should block javascript" 

    end

    describe "<script>" do
      it "should block script" 

    end

    describe "<style>" do
      it "should block style" 

    end

    describe "<iframe>" do
      it "should block iframe" 


      it "should allow youtube iframe" 


      it "should allow youku iframe" 

    end

    describe "img" do
      it "should work" 


      it "should work with url" 


      it "should filter src" 

    end

    describe "a" do
      it "should work" 

    end
  end
end

