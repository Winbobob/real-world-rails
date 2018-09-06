require 'spec_helper'

describe UpdateUser do
  let(:user) { create(:user) }
  let(:current_user) { create(:user, :admin) }
  let(:params) do
    {
      'first_name' => 'John',
      'ability_ids' => ['']
    }
  end
  let(:send_mail_with_user_job) { SendMailWithUserJob }

  it 'updates user attributes' 


  context 'new ability' do
    it 'creates new abilities' 

  end

  context 'ability removed' do
    it 'removes existing ability from the user' 

  end

  context 'notifications about changes send' do
    before do
      allow(SendMailWithUserJob).to receive(:new).and_return(send_mail_with_user_job)
    end

    it 'sends email if location changed' 


    it 'sends email if employment changed' 


    it 'sends email if user_notes_changed changed' 

  end

  context 'notifications about changes not send' do
    it "doesn't send an email if location or employment weren't updated" 


    it "doesn't send an email if validation fails" 

  end
end

