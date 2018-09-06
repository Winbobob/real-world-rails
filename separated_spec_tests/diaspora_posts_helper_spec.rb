# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe PostsHelper, :type => :helper do

  describe '#post_page_title' do
    before do
      @sm = FactoryGirl.create(:status_message)
    end

    context 'with posts with text' do
      it "delegates to message.title" 

    end

    context "with a reshare" do
      it "returns 'Reshare by...'" 

    end
  end


  describe '#post_iframe_url' do
    before do
      @post = FactoryGirl.create(:status_message)
    end

    it "returns an iframe tag" 


    it "returns an iframe containing the post" 

  end
end

