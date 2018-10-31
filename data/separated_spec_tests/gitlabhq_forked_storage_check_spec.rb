require 'spec_helper'

describe Gitlab::Git::Storage::ForkedStorageCheck, broken_storage: true, skip_database_cleaner: true do
  let(:existing_path) do
    existing_path = TestEnv.repos_path
    FileUtils.mkdir_p(existing_path)
    existing_path
  end

  describe '.storage_accessible?' do
    it 'detects when a storage is not available' 


    it 'detects when a storage is available' 


    it 'returns false when the check takes to long' 


    it 'will try the specified amount of times before failing'  do
      allow(described_class).to receive(:check_filesystem_in_process) do
        Process.spawn("sleep 10")
      end

      expect(Process).to receive(:spawn).with('sleep 10').twice
                           .and_call_original

      runtime = Benchmark.realtime do
        described_class.storage_available?(existing_path, 0.5, 2)
      end

      expect(runtime).to be < 1.0
    end

    describe 'when using paths with spaces' do
      let(:test_dir) { Rails.root.join('tmp', 'tests', 'storage_check') }
      let(:path_with_spaces) { File.join(test_dir, 'path with spaces') }

      around do |example|
        FileUtils.mkdir_p(path_with_spaces)
        example.run
        FileUtils.rm_r(test_dir)
      end

      it 'works for paths with spaces' 


      it 'works for a realpath with spaces' 

    end
  end
end

