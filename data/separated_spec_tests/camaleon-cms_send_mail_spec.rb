require 'rails_helper'

describe "CamaleonCms::HtmlMailer" do
  describe 'empty content' do
    before(:each){get_current_test_site()}
    let(:mail) { CamaleonCms::HtmlMailer.sender('test@gmail.com', "test") }

    it 'renders the subject' 


    it 'renders the receiver email' 


    it 'renders the sender email' 


    it 'html layout text' 

  end

  describe 'custom content' do
    before(:each){get_current_test_site()}
    let(:mail) { CamaleonCms::HtmlMailer.sender('test@gmail.com', "test", content: 'custom content', cc_to: ['a@gmail.com', 'b@gmail.com']) }

    it 'renders the sender email' 


    it 'custom content' 

  end
end

