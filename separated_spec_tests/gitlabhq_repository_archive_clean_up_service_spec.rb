require 'spec_helper'

describe RepositoryArchiveCleanUpService do
  subject(:service) { described_class.new }

  describe '#execute (new archive locations)' do
    let(:sha) { "0" * 40 }

    it 'removes outdated archives and directories in a new-style path' 


    it 'does not remove directories when they contain outdated non-archives' 


    it 'does not remove in-date archives in a new-style path' 

  end

  describe '#execute (legacy archive locations)' do
    context 'when the downloads directory does not exist' do
      it 'does not remove any archives' 

    end

    context 'when the downloads directory exists' do
      shared_examples 'invalid archive files' do |dirname, extensions, mtime|
        it 'does not remove files and directory' 

      end

      it 'removes files older than 2 hours that matches valid archive extensions' 


      context 'with files older than 2 hours that does not matches valid archive extensions' do
        it_behaves_like 'invalid archive files', 'sample.git', %w[conf rb], 2.hours
      end

      context 'with files older than 2 hours inside invalid directories' do
        it_behaves_like 'invalid archive files', 'john/doe/sample.git', %w[conf rb tar tar.gz], 2.hours
      end

      context 'with files newer than 2 hours that matches valid archive extensions' do
        it_behaves_like 'invalid archive files', 'sample.git', %w[tar tar.bz2 tar.gz zip], 1.hour
      end

      context 'with files newer than 2 hours that does not matches valid archive extensions' do
        it_behaves_like 'invalid archive files', 'sample.git', %w[conf rb], 1.hour
      end

      context 'with files newer than 2 hours inside invalid directories' do
        it_behaves_like 'invalid archive files', 'sample.git', %w[conf rb tar tar.gz], 1.hour
      end
    end
  end

  def in_directory_with_files(dirname, extensions, mtime)
    Dir.mktmpdir do |tmpdir|
      stub_repository_downloads_path(tmpdir)
      dir = File.join(tmpdir, dirname)
      files = create_temporary_files(dir, extensions, mtime)

      yield(dir, files)
    end
  end

  def stub_repository_downloads_path(path)
    allow(Gitlab.config.gitlab).to receive(:repository_downloads_path).and_return(path)
  end

  def create_temporary_files(dir, extensions, mtime)
    FileUtils.mkdir_p(dir)
    FileUtils.touch(extensions.map { |ext| File.join(dir, "sample.#{ext}") }, mtime: Time.now - mtime)
  end
end

