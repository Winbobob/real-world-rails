require 'spec_helper'

describe 'Unsubscribe links' do
  include Warden::Test::Helpers

  let(:recipient) { create(:user) }
  let(:author) { create(:user) }
  let(:project) { create(:project, :public) }
  let(:params) { { title: 'A bug!', description: 'Fix it!', assignees: [recipient] } }
  let(:issue) { Issues::CreateService.new(project, author, params).execute }

  let(:mail) { ActionMailer::Base.deliveries.last }
  let(:body) { Capybara::Node::Simple.new(mail.default_part_body.to_s) }
  let(:header_link) { mail.header['List-Unsubscribe'].to_s[1..-2] } # Strip angle brackets
  let(:body_link) { body.find_link('unsubscribe')['href'] }

  before do
    perform_enqueued_jobs { issue }
  end

  context 'when logged out' do
    context 'when visiting the link from the body' do
      it 'shows the unsubscribe confirmation page and redirects to root path when confirming' 


      it 'shows the unsubscribe confirmation page and redirects to root path when canceling' 

    end

    it 'unsubscribes from the issue when visiting the link from the header' 

  end

  context 'when logged in' do
    before do
      sign_in(recipient)
    end

    it 'unsubscribes from the issue when visiting the link from the email body' 


    it 'unsubscribes from the issue when visiting the link from the header' 

  end
end

