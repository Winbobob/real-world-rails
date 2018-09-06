# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe StreamHelper, type: :helper do
  describe "next_page_path" do
    def build_controller controller_class
      controller_class.new.tap {|c| c.request = controller.request }
    end
    before do
      @stream = Stream::Base.new(alice, :max_time => Time.now)
    end

    it "works for public page when current page is public stream" 


    it "works for stream page when current page is stream" 


    it "works for aspects page when current page is aspects" 


    it "works for activity page when current page is activity stream" 


    it "works for commented page when current page is commented stream" 


    it "works for liked page when current page is liked stream" 


    it "works for mentioned page when current page is mentioned stream" 


    it "works for followed tags page when current page is followed tags stream" 

  end
end

