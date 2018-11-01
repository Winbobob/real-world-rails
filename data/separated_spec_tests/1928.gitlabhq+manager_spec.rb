require 'spec_helper'

describe Backup::Manager do
  include StubENV

  let(:progress) { StringIO.new }

  subject { described_class.new(progress) }

  before do
    allow(progress).to receive(:puts)
    allow(progress).to receive(:print)

    @old_progress = $progress # rubocop:disable Style/GlobalVars
    $progress = progress # rubocop:disable Style/GlobalVars
  end

  after do
    $progress = @old_progress # rubocop:disable Style/GlobalVars
  end

  describe '#remove_old' do
    let(:files) do
      [
        '1451606400_2016_01_01_1.2.3_gitlab_backup.tar',
        '1451520000_2015_12_31_4.5.6_gitlab_backup.tar',
        '1451520000_2015_12_31_4.5.6-pre_gitlab_backup.tar',
        '1451520000_2015_12_31_4.5.6-rc1_gitlab_backup.tar',
        '1451520000_2015_12_31_4.5.6-pre-ee_gitlab_backup.tar',
        '1451510000_2015_12_30_gitlab_backup.tar',
        '1450742400_2015_12_22_gitlab_backup.tar',
        '1449878400_gitlab_backup.tar',
        '1449014400_gitlab_backup.tar',
        'manual_gitlab_backup.tar'
      ]
    end

    before do
      allow(Dir).to receive(:chdir).and_yield
      allow(Dir).to receive(:glob).and_return(files)
      allow(FileUtils).to receive(:rm)
      allow(Time).to receive(:now).and_return(Time.utc(2016))
    end

    context 'when keep_time is zero' do
      before do
        allow(Gitlab.config.backup).to receive(:keep_time).and_return(0)

        subject.remove_old
      end

      it 'removes no files' 


      it 'prints a skipped message' 

    end

    context 'when no valid file is found' do
      let(:files) do
        [
          '14516064000_2016_01_01_1.2.3_gitlab_backup.tar',
          'foo_1451520000_2015_12_31_4.5.6_gitlab_backup.tar',
          '1451520000_2015_12_31_4.5.6-foo_gitlab_backup.tar'
        ]
      end

      before do
        allow(Gitlab.config.backup).to receive(:keep_time).and_return(1)

        subject.remove_old
      end

      it 'removes no files' 


      it 'prints a done message' 

    end

    context 'when there are no files older than keep_time' do
      before do
        # Set to 30 days
        allow(Gitlab.config.backup).to receive(:keep_time).and_return(2592000)

        subject.remove_old
      end

      it 'removes no files' 


      it 'prints a done message' 

    end

    context 'when keep_time is set to remove files' do
      before do
        # Set to 1 second
        allow(Gitlab.config.backup).to receive(:keep_time).and_return(1)

        subject.remove_old
      end

      it 'removes matching files with a human-readable versioned timestamp' 


      it 'removes matching files with a human-readable versioned timestamp with tagged EE' 


      it 'removes matching files with a human-readable non-versioned timestamp' 


      it 'removes matching files without a human-readable timestamp' 


      it 'does not remove files that are not old enough' 


      it 'does not remove non-matching files' 


      it 'prints a done message' 

    end

    context 'when removing a file fails' do
      let(:file) { files[1] }
      let(:message) { "Permission denied @ unlink_internal - #{file}" }

      before do
        allow(Gitlab.config.backup).to receive(:keep_time).and_return(1)
        allow(FileUtils).to receive(:rm).with(file).and_raise(Errno::EACCES, message)

        subject.remove_old
      end

      it 'removes the remaining expected files' 


      it 'sets the correct removed count' 


      it 'prints the error from file that could not be removed' 

    end
  end

  describe '#unpack' do
    context 'when there are no backup files in the directory' do
      before do
        allow(Dir).to receive(:glob).and_return([])
      end

      it 'fails the operation and prints an error' 

    end

    context 'when there are two backup files in the directory and BACKUP variable is not set' do
      before do
        allow(Dir).to receive(:glob).and_return(
          [
            '1451606400_2016_01_01_1.2.3_gitlab_backup.tar',
            '1451520000_2015_12_31_gitlab_backup.tar'
          ]
        )
      end

      it 'prints the list of available backups' 


      it 'fails the operation and prints an error' 

    end

    context 'when BACKUP variable is set to a non-existing file' do
      before do
        allow(Dir).to receive(:glob).and_return(
          [
            '1451606400_2016_01_01_gitlab_backup.tar'
          ]
        )
        allow(File).to receive(:exist?).and_return(false)

        stub_env('BACKUP', 'wrong')
      end

      it 'fails the operation and prints an error' 

    end

    context 'when BACKUP variable is set to a correct file' do
      before do
        allow(Dir).to receive(:glob).and_return(
          [
            '1451606400_2016_01_01_1.2.3_gitlab_backup.tar'
          ]
        )
        allow(File).to receive(:exist?).and_return(true)
        allow(Kernel).to receive(:system).and_return(true)
        allow(YAML).to receive(:load_file).and_return(gitlab_version: Gitlab::VERSION)

        stub_env('BACKUP', '1451606400_2016_01_01_1.2.3')
      end

      it 'unpacks the file' 

    end
  end

  describe '#upload' do
    let(:backup_file) { Tempfile.new('backup', Gitlab.config.backup.path) }
    let(:backup_filename) { File.basename(backup_file.path) }

    before do
      allow(subject).to receive(:tar_file).and_return(backup_filename)

      stub_backup_setting(
        upload: {
          connection: {
            provider: 'AWS',
            aws_access_key_id: 'id',
            aws_secret_access_key: 'secret'
          },
          remote_directory: 'directory',
          multipart_chunk_size: 104857600,
          encryption: nil,
          storage_class: nil
        }
      )

      Fog.mock!

      # the Fog mock only knows about directories we create explicitly
      connection = ::Fog::Storage.new(Gitlab.config.backup.upload.connection.symbolize_keys)
      connection.directories.create(key: Gitlab.config.backup.upload.remote_directory)
    end

    context 'target path' do
      it 'uses the tar filename by default' 


      it 'adds the DIRECTORY environment variable if present' 

    end
  end
end

