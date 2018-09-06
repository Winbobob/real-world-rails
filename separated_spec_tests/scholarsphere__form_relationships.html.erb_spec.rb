# frozen_string_literal: true

require 'rails_helper'

describe 'curation_concerns/base/_form_relationships.html.erb' do
  let(:work) { build(:work) }
  let(:collection) { build :collection, id: 'collection_id' }
  let(:collection2) { build :collection, id: 'collection_id2' }
  let(:form) { CurationConcerns::GenericWorkForm.new(work, Ability.new(nil)) }
  let(:admin_service) { instance_double Sufia::AdminSetService, select_options: [] }

  let(:page) {
    view.simple_form_for(form) do |f|
      render 'curation_concerns/base/form_relationships.html.erb', f: f
    end
    Capybara::Node::Simple.new(rendered)
  }

  before do
    allow(view).to receive(:available_collections).and_return([collection, collection2])
    allow(Sufia::AdminSetService).to receive(:new).and_return(admin_service)
  end

  it 'lists the available collections' 


  context 'when the work is a member of the collection' do
    before do
      allow(form).to receive(:collection_ids).and_return([collection.id])
    end
    it 'lists the collection as selected' 

  end

  context 'when collection is passed as a parameter' do
    before do
      allow(view).to receive(:params).and_return(collection_ids: [collection.id])
    end
    it 'lists the collection as selected' 

  end
end

