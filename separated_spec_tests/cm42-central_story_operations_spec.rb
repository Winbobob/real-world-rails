require 'rails_helper'

describe StoryOperations do
  let(:story_params) do
    { title: 'Test Story', requested_by: user, state: 'unstarted', accepted_at: nil }
  end

  let!(:membership) { create(:membership) }
  let(:user)        { User.first }
  let(:project)     { Project.first }
  let(:story)       { project.stories.build(story_params) }

  describe '::Create' do
    subject { -> { StoryOperations::Create.call(story, user) } }

    context 'with valid params' do
      it { expect { subject.call }.to change { Story.count } }
      it { expect { subject.call }.to change { Changeset.count } }
      it { expect(subject.call).to be_eql Story.last }
    end

    context 'with invalid params' do
      before { story.title = '' }

      it { is_expected.to_not change { Story.count } }
      it { expect(subject.call).to be_falsy }
      it { expect(Notifications).to_not receive(:story_mention) }
    end

    context '::MemberNotification' do
      let(:mailer) { double('mailer') }
      let(:username_user) do
        project.users.create(
          build(:unconfirmed_user, username: 'username').attributes
        )
      end
      let(:story) do
        project.stories.create(
          story_params.merge(description: 'Foo @username')
        )
      end

      it 'also sends notification for the found username' 

    end
  end

  describe '#documents_attributes' do
    before do
      story.save!
    end

    subject { -> { StoryOperations::Update.call(story, { documents: new_documents }, user) } }

    let(:attachments) do
      [
        {
          'id' => 30,
          'public_id' => 'hello.jpg',
          'version' => '1471624237',
          'format' => 'png',
          'resource_type' => 'image'
        },
        {
          'id' => 31,
          'public_id' => 'hello2.jpg',
          'version' => '1471624237',
          'format' => 'png',
          'resource_type' => 'image'
        }
      ]
    end

    let(:new_documents) do
      [
        {
          'public_id' => 'hello3.jpg',
          'version' => '1471624237',
          'format' => 'png',
          'resource_type' => 'image'
        },
        {
          'id' => 31,
          'public_id' => 'hello2.jpg',
          'version' => '1471624237',
          'format' => 'png',
          'resource_type' => 'image'
        }
      ]
    end

    before do
      attachments.each do |a|
        Story.connection.execute(
          'insert into attachinary_files ' \
          "(#{a.keys.join(', ')}, scope, attachinariable_id, attachinariable_type) " \
          "values ('#{a.values.join("', '")}', 'documents', #{story.id}, 'Story')"
        )
      end
    end

    it 'must record the documents attributes changes' 

  end

  describe '::Update' do
    before do
      story.save!
    end

    subject do
      lambda do
        StoryOperations::Update.call(story, { state: 'accepted', accepted_at: Date.current }, user)
      end
    end

    context '::LegacyFixes' do
      it "sets the project start date if it doesn't exist" 


      it "sets the project start date if it's newer than the accepted story" 

    end

    context '::StateChangeNotification' do
      let(:acting_user)   { mock_model(User) }
      let(:requested_by)  { mock_model(User, email_delivery?: true) }
      let(:owned_by)      do
        mock_model(User, email_acceptance?: true,
                         email_rejection?: true)
      end
      let(:notifier) { double('notifier', subject: 'hello') }

      before do
        allow(story).to receive_messages(acting_user: acting_user)
        allow(story).to receive_messages(requested_by: requested_by)
        allow(story).to receive_messages(owned_by: owned_by)
        allow(project).to receive_messages(start_date: true)
        allow(project).to receive_message_chain(:integrations, :count).and_return(1)
        allow(story).to receive_messages(base_uri: 'http://foo.com/projects/123')
        expect(notifier).to receive(:deliver_later)
      end

      it "sends 'started' email notification" 

      it "sends 'delivered' email notification" 

      it "sends 'accepted' email notification" 

      it "sends 'rejected' email notification" 

    end
  end
end

