require 'spec_helper'

describe ImportExportCleanUpService do
  describe '#execute' do
    let(:service) { described_class.new }

    let(:tmp_import_export_folder) { 'tmp/project_exports' }

    context 'when the import/export directory does not exist' do
      it 'does not remove any archives' 

    end

    context 'when the import/export directory exists' do
      it 'removes old files' 


      it 'does not remove new files' 

    end

    context 'with uploader exports' do
      it 'removes old files' 


      it 'does not remove new files' 

    end

    def in_directory_with_files(mtime:)
      Dir.mktmpdir do |tmpdir|
        stub_repository_downloads_path(tmpdir)
        dir = File.join(tmpdir, tmp_import_export_folder, 'subfolder')
        FileUtils.mkdir_p(dir)

        files = FileUtils.touch(file_list(dir) + [dir], mtime: mtime.to_time)

        yield(dir, files)
      end
    end

    def stub_repository_downloads_path(path)
      new_shared_settings = Settings.shared.merge('path' => path)
      allow(Settings).to receive(:shared).and_return(new_shared_settings)
    end

    def file_list(dir)
      Array.new(5) do |num|
        File.join(dir, "random-#{num}.tar.gz")
      end
    end
  end
end

