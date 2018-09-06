require 'rails_helper'
# WARNING: If you change tests make sure you uncomment this line
# and start a test backend. Some of the actions
# require real backend answers for projects/packages.
# CONFIG['global_write_through'] = true

RSpec.describe EventMailer, vcr: true do
  # Needed for X-OBS-URL
  before do
    allow_any_instance_of(Configuration).to receive(:obs_url).and_return('https://build.example.com')
  end

  let!(:receiver) { create(:confirmed_user) }

  describe '.event' do
    context 'for an event of type Event::Request' do
      let(:source_project) { create(:project, name: 'source_project') }
      let(:source_package) { create(:package_with_file, name: 'source_package', project: source_project) }
      let(:target_project) { create(:project, name: 'target_project', maintainer: receiver) }
      let(:target_package) { create(:package_with_revisions, name: 'target_package', project: target_project) }
      let(:bs_request_action_submit) do
        create(:bs_request_action_submit,
               source_package: source_package.name,
               source_project: source_project.name,
               target_project: target_project.name,
               target_package: target_package.name)
      end
      # It is not possible to use the bs_request_action_submit factory as it creates the bs_request_action
      # in an after create hook which creates a wrong Event::RequestCreate object
      let!(:bs_request) do
        create(:bs_request, bs_request_actions: [bs_request_action_submit])
      end
      let(:event) { Event::RequestCreate.first }
      let(:originator) { event.originator }
      let!(:subscription) { create(:event_subscription_request_created, user: receiver) }
      let(:mail) { EventMailer.event(event.subscribers, event).deliver_now }

      context 'when source project does not exist' do
        before do
          login(receiver)
          source_package.project.destroy
        end

        it 'does not get delivered' 

      end

      it 'uses default for FROM if display name does not exist' 


      it 'uses display name for FROM if originator exists' 

    end

    context 'for an event of type Event::CommentForProject' do
      let!(:subscription) { create(:event_subscription_comment_for_project, user: receiver) }
      let!(:comment) { create(:comment_project, body: "Hey @#{receiver.login} how are things?") }
      let(:originator) { comment.user }
      let(:mail) { EventMailer.event(Event::CommentForProject.last.subscribers, Event::CommentForProject.last).deliver_now }

      it 'gets delivered' 

      it 'has subscribers' 

      it 'has a subject' 


      it 'has custom headers' 


      it 'has the default headers' 


      context 'when originator is subscribed' do
        let!(:originator_subscription) { create(:event_subscription_comment_for_project, user: originator) }
        let(:mail) { EventMailer.event(Event::CommentForProject.last.subscribers, Event::CommentForProject.last).deliver_now }

        it 'does not send to the originator' 

      end
    end
  end
end

