# frozen_string_literal: true

describe Diaspora::Markdownify::Email do
  include Rails.application.routes.url_helpers

  describe '#preprocess' do
    before do
      @html = Diaspora::Markdownify::Email.new
    end

    it 'should autolink a hashtag' 


    it 'should autolink multiple hashtags' 


    it 'should not autolink headers' 

  end

  describe "Markdown rendering" do
    before do
      @markdown = Redcarpet::Markdown.new(Diaspora::Markdownify::Email)
      @sample_text = "# Header\n\n#messages containing #hashtags should render properly"
    end

    it 'should render the message' 

  end
end

