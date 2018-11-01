require 'spec_helper'

describe AdminMailer, type: :mailer do
  context 'slack invite errors' do
    context 'ruby error' do
      subject(:mailer) { AdminMailer.failed_to_invite_user_to_slack('tansaku@gmail.com', StandardError.new('Boom!'), nil) }
      it 'sends a mail' 

      it 'contains error message in body' 

    end
    context 'slack api error' do
      subject(:mailer) { AdminMailer.failed_to_invite_user_to_slack('tansaku@gmail.com', nil, 'already_invited') }
      it 'sends a mail' 

      it 'contains error message in body' 

    end
  end
end


