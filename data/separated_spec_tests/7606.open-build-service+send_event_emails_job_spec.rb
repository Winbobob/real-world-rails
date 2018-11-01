require 'rails_helper'

RSpec.describe SendEventEmailsJob, type: :job do
  include ActiveJob::TestHelper

  describe '#perform' do
    before do
      ActionMailer::Base.deliveries = []
      # Needed for X-OBS-URL
      allow_any_instance_of(Configuration).to receive(:obs_url).and_return('https://build.example.com')
    end

    let!(:user) { create(:confirmed_user) }
    let!(:group) { create(:group) }
    let!(:project) { create(:project, name: 'comment_project', maintainer: [user, group]) }

    let!(:comment_author) { create(:confirmed_user) }

    let!(:comment) { create(:comment_project, commentable: project, body: "Hey @#{user.login} how are things?", user: comment_author) }
    let!(:user_maintainer) { create(:group) }

    context 'with no errors being raised' do
      let!(:subscription1) { create(:event_subscription_comment_for_project, receiver_role: 'maintainer', user: user) }
      let!(:subscription2) { create(:event_subscription_comment_for_project, receiver_role: 'maintainer', user: nil, group: group) }
      let!(:subscription3) { create(:event_subscription_comment_for_project, receiver_role: 'commenter', user: comment_author) }

      subject! { SendEventEmailsJob.new.perform }

      it 'sends an email to the subscribers' 


      it "creates an rss notification for user's email" 


      it "creates an rss notification with the same raw value of the corresponding event's payload" 


      it "creates an rss notification for group's email" 


      it 'only creates two notifications' 

    end

    context 'with an error being raised' do
      let!(:subscription1) { create(:event_subscription_comment_for_project, receiver_role: 'maintainer', user: user) }
      let!(:subscription2) { create(:event_subscription_comment_for_project, receiver_role: 'maintainer', user: nil, group: group) }
      let!(:subscription3) { create(:event_subscription_comment_for_project, receiver_role: 'commenter', user: comment_author) }

      before do
        allow(EventMailer).to receive(:event).and_raise(StandardError)
        allow(Airbrake).to receive(:notify)
      end

      subject! { SendEventEmailsJob.new.perform }

      it 'updates the event mails_sent = true' 


      it 'notifies airbrake' 

    end

    context 'with no subscriptions for the event' do
      subject! { SendEventEmailsJob.new.perform }

      it 'updates the event mails_sent = true' 


      it 'sends no emails' 

    end
  end
end

