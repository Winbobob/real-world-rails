require 'spec_helper'

describe Gitlab::HttpIO do
  include HttpIOHelpers

  let(:http_io) { described_class.new(url, size) }

  let(:url) { 'http://object-storage/trace' }
  let(:file_path) { expand_fixture_path('trace/sample_trace') }
  let(:file_body) { File.read(file_path).force_encoding(Encoding::BINARY) }
  let(:size) { File.size(file_path) }

  describe '#close' do
    subject { http_io.close }

    it { is_expected.to be_nil }
  end

  describe '#binmode' do
    subject { http_io.binmode }

    it { is_expected.to be_nil }
  end

  describe '#binmode?' do
    subject { http_io.binmode? }

    it { is_expected.to be_truthy }
  end

  describe '#path' do
    subject { http_io.path }

    it { is_expected.to be_nil }
  end

  describe '#url' do
    subject { http_io.url }

    it { is_expected.to eq(url) }
  end

  describe '#seek' do
    subject { http_io.seek(pos, where) }

    context 'when moves pos to end of the file' do
      let(:pos) { 0 }
      let(:where) { IO::SEEK_END }

      it { is_expected.to eq(size) }
    end

    context 'when moves pos to middle of the file' do
      let(:pos) { size / 2 }
      let(:where) { IO::SEEK_SET }

      it { is_expected.to eq(size / 2) }
    end

    context 'when moves pos around' do
      it 'matches the result' 

    end
  end

  describe '#eof?' do
    subject { http_io.eof? }

    context 'when current pos is at end of the file' do
      before do
        http_io.seek(size, IO::SEEK_SET)
      end

      it { is_expected.to be_truthy }
    end

    context 'when current pos is not at end of the file' do
      before do
        http_io.seek(0, IO::SEEK_SET)
      end

      it { is_expected.to be_falsey }
    end
  end

  describe '#each_line' do
    subject { http_io.each_line }

    let(:string_io) { StringIO.new(file_body) }

    before do
      stub_remote_url_206(url, file_path)
    end

    it 'yields lines' 


    context 'when buckets on GCS' do
      context 'when BUFFER_SIZE is larger than file size' do
        before do
          stub_remote_url_200(url, file_path)
          set_larger_buffer_size_than(size)
        end

        it 'calls get_chunk only once' 

      end
    end
  end

  describe '#read' do
    subject { http_io.read(length) }

    context 'when there are no network issue' do
      before do
        stub_remote_url_206(url, file_path)
      end

      context 'when read whole size' do
        let(:length) { nil }

        context 'when BUFFER_SIZE is smaller than file size' do
          before do
            set_smaller_buffer_size_than(size)
          end

          it 'reads a trace' 

        end

        context 'when BUFFER_SIZE is larger than file size' do
          before do
            set_larger_buffer_size_than(size)
          end

          it 'reads a trace' 

        end
      end

      context 'when read only first 100 bytes' do
        let(:length) { 100 }

        context 'when BUFFER_SIZE is smaller than file size' do
          before do
            set_smaller_buffer_size_than(size)
          end

          it 'reads a trace' 

        end

        context 'when BUFFER_SIZE is larger than file size' do
          before do
            set_larger_buffer_size_than(size)
          end

          it 'reads a trace' 

        end
      end

      context 'when tries to read oversize' do
        let(:length) { size + 1000 }

        context 'when BUFFER_SIZE is smaller than file size' do
          before do
            set_smaller_buffer_size_than(size)
          end

          it 'reads a trace' 

        end

        context 'when BUFFER_SIZE is larger than file size' do
          before do
            set_larger_buffer_size_than(size)
          end

          it 'reads a trace' 

        end
      end

      context 'when tries to read 0 bytes' do
        let(:length) { 0 }

        context 'when BUFFER_SIZE is smaller than file size' do
          before do
            set_smaller_buffer_size_than(size)
          end

          it 'reads a trace' 

        end

        context 'when BUFFER_SIZE is larger than file size' do
          before do
            set_larger_buffer_size_than(size)
          end

          it 'reads a trace' 

        end
      end
    end

    context 'when there is anetwork issue' do
      let(:length) { nil }

      before do
        stub_remote_url_500(url)
      end

      it 'reads a trace' 

    end
  end

  describe '#readline' do
    subject { http_io.readline }

    let(:string_io) { StringIO.new(file_body) }

    before do
      stub_remote_url_206(url, file_path)
    end

    shared_examples 'all line matching' do
      it 'reads a line' 

    end

    context 'when there is anetwork issue' do
      let(:length) { nil }

      before do
        stub_remote_url_500(url)
      end

      it 'reads a trace' 

    end

    context 'when BUFFER_SIZE is smaller than file size' do
      before do
        set_smaller_buffer_size_than(size)
      end

      it_behaves_like 'all line matching'
    end

    context 'when BUFFER_SIZE is larger than file size' do
      before do
        set_larger_buffer_size_than(size)
      end

      it_behaves_like 'all line matching'
    end

    context 'when pos is at middle of the file' do
      before do
        set_smaller_buffer_size_than(size)

        http_io.seek(size / 2)
        string_io.seek(size / 2)
      end

      it 'reads from pos' 

    end
  end

  describe '#write' do
    subject { http_io.write(nil) }

    it { expect { subject }.to raise_error(NotImplementedError) }
  end

  describe '#truncate' do
    subject { http_io.truncate(nil) }

    it { expect { subject }.to raise_error(NotImplementedError) }
  end

  describe '#flush' do
    subject { http_io.flush }

    it { expect { subject }.to raise_error(NotImplementedError) }
  end

  describe '#present?' do
    subject { http_io.present? }

    it { is_expected.to be_truthy }
  end
end

