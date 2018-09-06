require 'spec_helper'

describe UploadedFile do
  describe ".from_params" do
    let(:temp_dir) { Dir.tmpdir }
    let(:temp_file) { Tempfile.new("test", temp_dir) }
    let(:upload_path) { nil }

    subject do
      described_class.from_params(params, :file, upload_path)
    end

    before do
      FileUtils.touch(temp_file)
    end

    after do
      FileUtils.rm_f(temp_file)
      FileUtils.rm_r(upload_path) if upload_path
    end

    context 'when valid file is specified' do
      context 'only local path is specified' do
        let(:params) do
          { 'file.path' => temp_file.path }
        end

        it "succeeds" 


        it "generates filename from path" 

      end

      context 'all parameters are specified' do
        let(:params) do
          { 'file.path' => temp_file.path,
            'file.name' => 'my_file.txt',
            'file.type' => 'my/type',
            'file.sha256' => 'sha256',
            'file.remote_id' => 'remote_id' }
        end

        it "succeeds" 


        it "generates filename from path" 

      end
    end

    context 'when no params are specified' do
      let(:params) do
        {}
      end

      it "does not return an object" 

    end

    context 'when only remote id is specified' do
      let(:params) do
        { 'file.remote_id' => 'remote_id' }
      end

      it "raises an error" 

    end

    context 'when verifying allowed paths' do
      let(:params) do
        { 'file.path' => temp_file.path }
      end

      context 'when file is stored in system temporary folder' do
        let(:temp_dir) { Dir.tmpdir }

        it "succeeds" 

      end

      context 'when file is stored in user provided upload path' do
        let(:upload_path) { Dir.mktmpdir }
        let(:temp_dir) { upload_path }

        it "succeeds" 

      end

      context 'when file is stored outside of user provided upload path' do
        let!(:generated_dir) { Dir.mktmpdir }
        let!(:temp_dir) { Dir.mktmpdir }

        before do
          # We overwrite default temporary path
          allow(Dir).to receive(:tmpdir).and_return(generated_dir)
        end

        it "raises an error" 

      end
    end
  end
end

