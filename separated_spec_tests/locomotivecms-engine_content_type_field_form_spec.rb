require 'spec_helper'

describe Locomotive::API::Forms::ContentTypeFieldForm do

  let(:slug) { :foo }
  let(:content_type) { double(:content_type, entries_class_name: slug) }
  let(:finder) { double(:finder, first: content_type) }
  let(:site) { double(:site, default_locale: 'fr') }
  let(:content_type_service) do
    double(:content_type_service, find_by_slug: finder, site: site)
  end

  before do
    allow(subject).to receive(:content_type_service).and_return(content_type_service)
  end

  subject { described_class.new(nil, nil, nil) }

  describe '#target=' do

    context 'matching content type' do
      it 'sets the class name according to the slug' 

    end

    context 'No matching content type' do
      let(:slug) { nil }
      it 'sets #class_name to nil' 

    end

  end

  describe '#select_options=' do
    let(:options) { [{ 'name' => {} }] }

    it 'calls attach_id_to_option with name and attributes' 

  end

  describe '#attach_id_to_option' do

    context 'existing_field is nil' do
      let(:existing_field) { nil }
      let(:content_type_service) { nil }

      it 'returns nil' 


    end

    context 'existing_field has options with name' do

      before do
        allow(subject).to receive(:existing_field).and_return(existing_field)
      end

      let(:select_options) { double(:select_options, where: [option]) }
      let(:existing_field) { double(:existing_field, select_options: select_options)}
      let(:option) { double(:option, _id: :blar) }

      it 'sets the _id attribute' 


    end
  end

end

