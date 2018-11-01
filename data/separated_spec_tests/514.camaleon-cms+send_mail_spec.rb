require 'rails_helper'

describe "CamaleonCms::HtmlMailer" do
  before(:each) do
    @site = create(:site).decorate
  end
  describe 'empty content' do
    let(:mail) { CamaleonCms::HtmlMailer.sender('test@gmail.com', "test") }

    it 'renders the subject' 


    it 'renders the receiver email' 


    it 'renders the sender email' 


    it 'html layout text' 

  end

  describe 'custom content' do
    let(:mail) { CamaleonCms::HtmlMailer.sender('test@gmail.com', "test", content: 'custom content', cc_to: ['a@gmail.com', 'b@gmail.com']) }
    it 'renders the sender email' 


    it 'custom content' 

  end
end

