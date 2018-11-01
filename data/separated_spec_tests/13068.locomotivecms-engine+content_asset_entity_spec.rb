require 'spec_helper'

describe Locomotive::API::Entities::ContentAssetEntity do

  subject { described_class }

  %i(content_type width height vignette_url alternative_vignette_url).each do |exposure|
    it { is_expected.to represent(exposure) }
  end
  describe 'overrides' do
    let!(:asset) { create(:asset) }

    subject { described_class.new(asset) }
    let(:exposure) { subject.serializable_hash }
    before { subject.object.source_filename = 'very-long-file-name-that-is-used' }

    describe 'full_file_name' do
      it 'returns the full file name' 

    end

    describe 'short_name' do
      it 'returns filename truncated to 15 chars' 

    end

    describe 'extname' do
      it 'returns the file extension truncated to 3 chars' 


      it 'returns the file extension if 3 chars' 

    end

    describe 'content_type_text' do
      context 'content_type is other' do
        context 'file extension blank' do
          it 'returns a question mark' 

        end

        context 'file extension not blank' do
          before { subject.object.source_filename = 'foo.bar' }
          it 'returns the file extension' 

        end
      end

      context 'content_type is a string' do
        it 'returns the content_type' 

      end
    end

    describe 'with_thumbnail' do
      context 'content_type is other' do
        it 'returns false' 

      end

      context 'content_type is image or pdf' do
        before do
          subject.object.width = '50'
          subject.object.height = '50'
        end

        specify 'image returns true' do
          subject.object.content_type = 'image'
          expect(exposure[:with_thumbnail]).to be_truthy
        end

        specify 'pdf returns true' do
          subject.object.content_type = 'pdf'
          expect(exposure[:with_thumbnail]).to be_truthy
        end
      end
    end

    describe 'raw_size' do
      it 'returns the size' 

    end

    describe 'url' do
      it 'returns the source URL' 

    end

  end
  
end

