# frozen_string_literal: true

require 'rails_helper'
require 'fileutils'

describe ExternalFilesConversion do
  let(:user) { create(:user) }

  context 'running a conversion from internal to external file storage' do
    let(:full_conversion) { described_class.new(GenericWork).convert }
    let(:single_work_conversion) { described_class.new(GenericWork).convert(id: work.id) }
    let(:work) { create(:public_work_with_png, depositor: user.login) }
    let(:file_set) { work.file_sets.first }
    let(:filepath) { File.join(fixture_path, 'world.png') }
    let(:mock_checksum) { instance_double(Digest::SHA1, hexdigest: 'f794b23c0c6fe1083d0ca8b58261a078cd968967') }

    before do
      allow(CharacterizeJob).to receive(:perform_later)
      allow(Digest::SHA1).to receive(:file).and_return(mock_checksum)
    end

    after do
      work.destroy
    end

    it 'converts a single work of a given Class' 

    it 'converts all works of a given Class' 

    it 'will not raise an error if it already has an auto_placeholder version' 

    context 'bad checksums' do
      let(:mock_checksum) { instance_double(Digest::SHA1, hexdigest: 'f794b23c0c6fe1083d0ca8b58261a078cd96800') }

      it 'converts a single work of a given Class' 

    end
    context 'with three works' do
      let(:work1) { create(:public_work_with_png, depositor: user.login) }
      let(:file_set1) { work1.file_sets.first }

      let(:work2) { create(:public_work_with_png, depositor: user.login) }
      let(:file_set2) { work2.file_sets.first }

      let(:work3) { create(:public_work_with_png, depositor: user.login) }
      let(:file_set3) { work3.file_sets.first }

      let(:pidfile) { File.join(Rails.root, 'tmp', 'pidfile.txt') }

      before do
        ENV['REPOSITORY_EXTERNAL_FILES'] = 'false'
        File.delete(pidfile) if File.exists?(pidfile)
        File.open(pidfile, 'w') { |file|
          file.puts work1.id
          file.puts work2.id
          file.puts work3.id
        }
      end

      after do
        # destroy could fail since some tests are destroying it
        begin
          work1.destroy
          work2.destroy
          work3.destroy
        rescue StandardError
          nil
        end
      end

      it 'converts the ids in a file' 

      it 'makes files with all the pids' 

      it 'makes a pid file with all the small objects and large files also get converted' 

    end
  end

  context 'bad digest for some time' do
    let(:work) { create(:public_work_with_png, depositor: user.login) }
    let(:file_set) { work.file_sets.first }
    let(:mock_fixity) { instance_double(ActiveFedora::FixityService) }

    before do
      allow(CharacterizeJob).to receive(:perform_later)
      allow(ActiveFedora::FixityService).to receive(:new).and_return(mock_fixity)
    end

    context 'error with fixity once' do
      before do
        allow(CharacterizeJob).to receive(:perform_later)
        allow(ActiveFedora::FixityService).to receive(:new).and_return(mock_fixity)
      end

      it 'converts a single work of a given Class' 

    end

    context 'error with fixity 4 times' do
      it 'converts a single work of a given Class' 

    end

    context 'error with fixity 5 times' do
      it 'converts a single work of a given Class' 

    end
  end
  context 'running without sha1 mocked', unless: travis? do
    it 'converts all versions of all the files of a work' 

  end

  def local_file(uri)
    ldp_response = ActiveFedora.fedora.connection.head(uri)
    expect(ldp_response.response.status).to eq(200)
  end

  def remote_file(uri)
    ldp_response = ActiveFedora.fedora.connection.head(uri)
    expect(ldp_response.response.status).to eq(307), "version: #{uri} was not converted to external"
  end
end

