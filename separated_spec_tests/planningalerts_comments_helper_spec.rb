require 'spec_helper'

describe CommentsHelper do
  describe "#comment_as_html" do
    it "wraps lines of text in HTML paragraphs" 


    it "adds links to urls in text" 


    it "removes scary scripts" 


    it { expect(helper.comment_as_html("watch out <script>alert('danger');</script>")).to be_html_safe }
  end

  describe "#comment_path" do
    let(:application) { VCR.use_cassette('planningalerts') { create(:application, id: 1) } }
    let(:comment) { create(:confirmed_comment, id: 1, application: application) }

    it "returns the path for the application with an anchor with the comment id" 

  end

  describe "#comment_url" do
    let(:application) { VCR.use_cassette('planningalerts') { create(:application, id: 1) } }
    let(:comment) { create(:confirmed_comment, id: 1, application: application) }

    it "returns the url for the application with an anchor with the comment id" 

  end
end


