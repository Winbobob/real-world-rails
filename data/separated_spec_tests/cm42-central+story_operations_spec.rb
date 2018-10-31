require 'rails_helper'
require 'json'

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

    context "::PusherNotification" do
      it "notifies the pusher that the board has changes" 

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

  describe '::Update', vcr: { match_requests_on: [:host, :path] } do
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

    context "::PusherNotification" do
      it "notifies the pusher that the board has changes" 

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

  describe "::Destroy" do
    before do
      story.save!
    end

    context "::PusherNotification" do
      it "notifies the pusher that the board has changes" 

    end
  end

  describe '::ReadAll' do
    def expect_past_iteration_attrs(subject_past_iteration, past_iteration)
      expect(subject_past_iteration.start_date).to eq(past_iteration.start_date)
      expect(subject_past_iteration.end_date).to eq(past_iteration.end_date)
      expect(subject_past_iteration.points).to eq(past_iteration.points)
      expect(subject_past_iteration.stories).to eq(past_iteration.stories)
      expect(subject_past_iteration.iteration_number).to eq(1)
    end

    let(:user)          { create(:user, :with_team) }
    let(:current_team)  { user.teams.first }
    let!(:done_story)   { create(:story, :done, project: project, requested_by: user) }
    let!(:active_story) { create(:story, :active, project: project, requested_by: user) }

    let!(:past_iteration) do
      iteration_start = project.created_at.to_date
      iteration_end = ((project.created_at + project.iteration_length * 7.days) - 1.day).to_date
      Iterations::PastIteration.new(start_date: iteration_start,
                                    end_date: iteration_end,
                                    stories: [done_story])
    end

    subject      { StoryOperations::ReadAll }
    let(:result) { subject.call(project: project) }

    context 'when there are stories in the done column' do
      let(:project) { create(:project, :with_past_iteration, users: [user], teams: [current_team]) }

      it 'does not return done stories as Story objects' 


      it 'returns the stories that are active' 


      it 'returns the past iterations with its iteration number, points and dates' 

    end

    context 'when there are no past iterations' do
      let(:project) { create(:project, users: [user], teams: [current_team]) }

      it 'does not return past iterations' 


      it 'returns the stories that are active' 

    end

    context 'when there are no active stories' do
      let(:project) { create(:project, :with_past_iteration, users: [user], teams: [current_team]) }
      let(:active_story) { done_story }

      it 'does not return active stories' 


      it 'returns the past iterations with its iteration number, points and dates' 

    end

    context 'when the project started a month ago' do
      let(:project) { create(:project, :created_one_month_ago, users: [user], teams: [current_team]) }
      let(:iteration_length)         { project.iteration_length * 7 }
      let(:days_since_project_start) { (Date.current - project.start_date).to_i }
      let(:number_of_iterations)     { days_since_project_start / iteration_length }

      it 'returns the correct amount of past iterations' 


      it 'returns the right iteration number for each past iteration' 

    end
  end

  describe '::UpdateAll' do
    let(:user_1)    { create(:user, :with_team) }
    let(:user_2)    { create(:user, :with_team) }
    let(:user_3)    { create(:user, :with_team) }
    let(:project_1) { create(:project, users: [user_1, user_2], teams: [user_1.teams.first]) }
    let(:project_2) { create(:project, users: [user_3], teams: [user_3.teams.first]) }
    let(:story_1)   { create(:story, project: project_1, requested_by: user_1) }
    let(:story_2)   { create(:story, project: project_1, requested_by: user_2) }
    let(:story_3)   { create(:story, project: project_2, requested_by: user_3) }

    subject { StoryOperations::UpdateAll }

    let(:result) do
      stories = [story_1, story_2, story_3]
      params = { labels: 'backend', requested_by_id: user_2.id, owned_by_id: user_1.id }
      subject.call(stories, params, user_1)
    end

    context 'when the user is not of the same project' do
      it 'does not update any story' 

    end
  end
end

