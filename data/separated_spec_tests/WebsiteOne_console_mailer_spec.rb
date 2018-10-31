require 'spec_helper'

describe ConsoleMailer do
  describe "#newsletter" do
    before do
      @user = FactoryBot.create(:user)
    end
    let(:valid_params) {
      { heading: 'my heading',
        content: 'my multiline\ntext blorb',
        subject: 'specific subject'
      } 
    }
    
    let(:mail) { ConsoleMailer.newsletter(@user, valid_params) }
    
    it 'renders the headers' 


    it 'renders the heading' 


    it 'renders the body' 


    it 'adds cc to sam' 


  end

end

