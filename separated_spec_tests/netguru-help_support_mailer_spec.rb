require 'rails_helper'

describe SupportMailer do
  describe '#new_comment' do
    let(:support) { Support.new id: 3, body: 'I really need help in something' }
    let(:commenter) { User.new first_name: 'roberto', last_name: 'amore' }
    let(:comment) { Comment.new user: commenter, body: "that's easy!" }
    let(:mail_receiver) { User.new email: 'foo@bar.io' }

    subject { SupportMailer.new_comment support, comment, mail_receiver }

    it 'contains comment text in the body' 


    it 'is delivered to user' 


    it 'contains commenter name in the subject' 

  end
end

