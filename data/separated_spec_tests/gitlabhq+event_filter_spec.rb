require 'spec_helper'

describe EventFilter do
  describe 'FILTERS' do
    it 'returns a definite list of filters' 

  end

  describe '#filter' do
    it 'returns "all" if given filter is nil' 


    it 'returns "all" if given filter is ""' 


    it 'returns "all" if given filter is "foo"' 

  end

  describe '#apply_filter' do
    set(:public_project) { create(:project, :public) }

    set(:push_event)     { create(:push_event,        project: public_project) }
    set(:merged_event)   { create(:event, :merged,    project: public_project, target: public_project) }
    set(:created_event)  { create(:event, :created,   project: public_project, target: public_project) }
    set(:updated_event)  { create(:event, :updated,   project: public_project, target: public_project) }
    set(:closed_event)   { create(:event, :closed,    project: public_project, target: public_project) }
    set(:reopened_event) { create(:event, :reopened,  project: public_project, target: public_project) }
    set(:comments_event) { create(:event, :commented, project: public_project, target: public_project) }
    set(:joined_event)   { create(:event, :joined,    project: public_project, target: public_project) }
    set(:left_event)     { create(:event, :left,      project: public_project, target: public_project) }

    let(:filtered_events) { described_class.new(filter).apply_filter(Event.all) }

    context 'with the "push" filter' do
      let(:filter) { described_class::PUSH }

      it 'filters push events only' 

    end

    context 'with the "merged" filter' do
      let(:filter) { described_class::MERGED }

      it 'filters merged events only' 

    end

    context 'with the "issue" filter' do
      let(:filter) { described_class::ISSUE }

      it 'filters issue events only' 

    end

    context 'with the "comments" filter' do
      let(:filter) { described_class::COMMENTS }

      it 'filters comment events only' 

    end

    context 'with the "team" filter' do
      let(:filter) { described_class::TEAM }

      it 'filters team events only' 

    end

    context 'with the "all" filter' do
      let(:filter) { described_class::ALL }

      it 'returns all events' 

    end

    context 'with an unknown filter' do
      let(:filter) { 'foo' }

      it 'returns all events' 

    end

    context 'with a nil filter' do
      let(:filter) { nil }

      it 'returns all events' 

    end
  end

  describe '#active?' do
    let(:event_filter) { described_class.new(described_class::TEAM) }

    it 'returns false if filter does not include the given key' 


    it 'returns false if the given key is nil' 


    it 'returns true if filter does not include the given key' 

  end
end

