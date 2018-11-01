require 'rails_helper'

describe BaseOperations::ActivityRecording do
  class FakeClass
    include BaseOperations::ActivityRecording
    attr_reader :model, :current_user

    def initialize(model, current_user)
      @model = model
      @current_user = current_user
    end

    def self.name
      'destroy'
    end
  end

  def activities_story_ids
    Activity.all.map { |activity| activity[:subject_changes]['id'] }
  end

  let(:user) { create(:user, :with_team) }
  let(:project) { create(:project, users: [user], teams: [user.teams.first]) }
  let(:story) { create(:story, project: project, requested_by: user) }
  let(:model) { create_list(:story, 3, project: project, requested_by: user) }

  describe '#create_activity' do
    before(:each) { subject.create_activity }

    context 'when model is a collection of records' do
      subject { FakeClass.new(model, user) }

      it 'creates an activity for each record' 

    end

    context 'when model is a record' do
      subject { FakeClass.new(story, user) }

      it 'creates an activity' 

    end
  end

  describe '#fetch_project' do
    include BaseOperations::ActivityRecording

    let(:note) { create(:note, story: story) }
    let(:task) { create(:task, story: story) }

    context 'when receive a project' do
      it 'returns the project' 

    end

    context 'when receive a story' do
      it 'returns the project' 

    end

    context 'when receive a note' do
      it 'returns the project' 

    end

    context 'when receive a task' do
      it 'returns the project' 

    end
  end
end

