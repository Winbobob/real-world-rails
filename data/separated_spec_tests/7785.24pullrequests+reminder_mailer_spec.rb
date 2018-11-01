require 'rails_helper'

describe ReminderMailer, type: :mailer do
  let(:user) do
    allow(Project).to receive_message_chain(:order, :limit).and_return(Project.where(nil))

    mock_model(User,
    {
      nickname: 'David',
      email: 'david@example.com',
      languages: ['Ruby'],
      skills: [],
      pull_requests: double(:pull_request, year: []),
      suggested_projects: Project.all,
      unsubscribe_token: 'unsubscribe-token'
    })
  end

  shared_examples :reminder_mailer do |subject:, this_time:, next_time:|
    it 'renders the subject' 


    it 'renders the receiver email' 


    it 'renders the sender email' 


    it 'uses nickname' 


    it 'contains periodicity in body' 

  end

  describe 'daily' do
    let(:mail) { ReminderMailer.daily(user) }

    it_behaves_like :reminder_mailer,
      subject: '[24 Pull Requests] Daily Reminder',
      this_time: 'today',
      next_time: 'tomorrow'
  end

  describe 'weekly' do
    let(:mail) { ReminderMailer.weekly(user) }

    it_behaves_like :reminder_mailer,
      subject: '[24 Pull Requests] Weekly Reminder',
      this_time: 'this week',
      next_time: 'next week'
  end
end

