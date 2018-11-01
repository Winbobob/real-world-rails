# frozen_string_literal: true

require 'spec_helper'

describe ResourceEvents::ChangeLabelsService do
  set(:project)  { create(:project) }
  set(:author)   { create(:user) }
  let(:resource) { create(:issue, project: project) }

  describe '.change_labels' do
    subject { described_class.new(resource, author).execute(added_labels: added, removed_labels: removed) }

    let(:labels)  { create_list(:label, 2, project: project) }

    def expect_label_event(event, label, action)
      expect(event.user).to eq(author)
      expect(event.label).to eq(label)
      expect(event.action).to eq(action)
    end

    it 'expires resource note etag cache' 


    context 'when adding a label' do
      let(:added)   { [labels[0]] }
      let(:removed) { [] }

      it 'creates new label event' 

    end

    context 'when removing a label' do
      let(:added)   { [] }
      let(:removed) { [labels[1]] }

      it 'creates new label event' 

    end

    context 'when both adding and removing labels' do
      let(:added)   { [labels[0]] }
      let(:removed) { [labels[1]] }

      it 'creates all label events in a single query' 

    end
  end
end

