# frozen_string_literal: true

require 'rails_helper'

describe FileSetIndexer do
  include FactoryHelpers

  let(:file_set) { build(:file_set) }
  let(:indexer)  { described_class.new(file_set) }

  let(:file) do
    mock_file_factory(
      mime_type: 'image/jpeg',
      format_label: ['JPEG Image'],
      height: ['500'],
      width: ['600'],
      file_size: ['12']
    )
  end

  describe '#generate_solr_document' do
    subject { solr_doc }

    let(:solr_doc) { indexer.generate_solr_document }

    context 'with a file containing technical metadata' do
      before { allow(file_set).to receive(:original_file).and_return(file) }
      it { is_expected.to include('file_size_lts' => '12') }
      its(:keys) { is_expected.not_to include('file_size_is') }
    end

    context 'without a file' do
      it { is_expected.to include('file_size_lts' => nil) }
      its(:keys) { is_expected.not_to include('file_size_is') }
    end

    context 'with all_text' do
      let(:text) { instance_double(String) }
      let(:extracted) { instance_double(Hydra::PCDM::File, content: text) }

      before do
        allow(file_set).to receive(:extracted_text).and_return(extracted)
      end
      it 'forces utf8' 


      it 'handles errors with forcing utf8' 

    end

    context 'without all_text' do
      let(:text) { instance_double(String, blank?: true) }
      let(:extracted) { instance_double(Hydra::PCDM::File, content: text) }

      before do
        allow(file_set).to receive(:extracted_text).and_return(extracted)
      end
      it 'does not force utf8' 

    end
  end
end

