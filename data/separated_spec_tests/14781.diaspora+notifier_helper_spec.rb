# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe NotifierHelper, :type => :helper do
  describe '#post_message' do
    before do
      # post for markdown test
      @markdown_post = FactoryGirl.create(:status_message,
        text: "[link](http://diasporafoundation.org) **bold text** *other text*", public: true)
      @striped_markdown_post = "link (http://diasporafoundation.org) bold text other text"
    end

    it 'strip markdown in the post' 


    it "falls back to the title if the post has no text" 


    it "falls back to the title, if the root post was deleted" 

  end

  describe '#comment_message' do
    before do
      # comment for markdown test
      @markdown_comment = FactoryGirl.create(:comment)
      @markdown_comment.post.public = true
      @markdown_comment.text = "[link](http://diasporafoundation.org) **bold text** *other text*"
      @striped_markdown_comment = "link (http://diasporafoundation.org) bold text other text"

      # comment for limited post
      @limited_comment = FactoryGirl.create(:comment)
      @limited_comment.post.public = false
      @limited_comment.text = "This is top secret comment. Shhhhhhhh!!!"
    end

    it 'strip markdown in the comment' 


    it 'hides the private content' 

  end
end

