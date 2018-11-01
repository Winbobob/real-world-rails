require 'spec_helper'

describe CommentMailer, type: :mailer do
  describe "basic comment emails" do

    before(:each) do
      @comment = FactoryGirl.create(:comment)
    end

    let(:email) { CommentMailer.comment_sent_notification(@comment).deliver }

    it "should have a valid from line" 

  end
end

