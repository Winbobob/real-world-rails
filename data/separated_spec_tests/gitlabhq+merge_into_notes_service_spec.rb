# frozen_string_literal: true

require 'spec_helper'

describe ResourceEvents::MergeIntoNotesService do
  def create_event(params)
    event_params = { action: :add, label: label, issue: resource,
                     user: user }

    create(:resource_label_event, event_params.merge(params))
  end

  def create_note(params)
    opts = { noteable: resource, project: project }

    create(:note_on_issue, opts.merge(params))
  end

  set(:project)  { create(:project) }
  set(:user)   { create(:user) }
  set(:resource) { create(:issue, project: project) }
  set(:label) { create(:label, project: project) }
  set(:label2) { create(:label, project: project) }
  let(:time) { Time.now }

  describe '#execute' do
    it 'merges label events into notes in order of created_at' 


    it 'squashes events with same time and author into single note' 


    it 'fetches only notes created after last_fetched_at' 


    it "preloads the note author's status" 

  end
end

