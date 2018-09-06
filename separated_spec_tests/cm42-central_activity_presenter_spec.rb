require 'rails_helper'

describe ActivityPresenter do
  let(:story) { create(:story, :with_project) }
  let(:note) { create(:note, story: story) }
  let(:activity) { build(:activity, project: story.project, user: story.requested_by) }
  let(:user_name) { story.requested_by.name }
  let(:project) { story.project }

  subject { ActivityPresenter.new(activity) }

  context 'destroyed' do
    before { activity.action = 'destroy' }

    it 'describes story destroyed' 


    it 'describes project destroyed' 


    it 'describes note destroyed' 

  end

  context 'created' do
    before { activity.action = 'create' }

    it 'describes story created' 


    it 'describes project created' 


    it 'describes note created' 

  end

  context 'updated' do
    before { activity.action = 'update' }

    context 'from empty values' do
      it 'describes new values in story' 


      it 'describes new values in project' 


      it 'describes new values in note' 

    end

    context 'changing values for new ones' do
      it 'describes changes in story' 


      it 'describes changes in project' 


      it 'describes changes in note' 


      it 'describes changing attachments in story' 

    end
  end
end

