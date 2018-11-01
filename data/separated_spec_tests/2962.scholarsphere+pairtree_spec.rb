# frozen_string_literal: true

require 'rails_helper'
require 'fileutils'

describe Scholarsphere::Pairtree do
  context 'fedora external content' do
    let(:user)     { create(:user) }
    let(:file_set) { create(:file_set, :with_png, depositor: user.login, id: 'mst3kabc') }
    let(:fixture_filepath) { File.join(fixture_path, 'world.png') }
    let(:crazy_filepath) { Rails.root.join('tmp', 'file with space %.png').to_s }
    let(:filepath) { 'file_with_space__.png' }
    let(:file_to_store) {}
    let(:bagger) { Scholarsphere::Bagger }
    let!(:pairtree) { described_class.new(file_set, bagger) }

    before do
      ENV['REPOSITORY_EXTERNAL_FILES'] = 'true'
      FileUtils.cp(fixture_filepath, crazy_filepath)
    end

    after do
      file_set.delete
      file_set.eradicate
      if Rails.env.test?
        FileUtils.rm_rf(ENV['REPOSITORY_FILESTORE'])
      end
      File.delete(crazy_filepath)
    end

    context 'done inside IngestFileJob' do
      before do
        IngestFileJob.perform_now(file_set, crazy_filepath, user)
      end

      it 'creates a bag under the paritree' 

    end

    context 'done as stream' do
      let(:filepath) { File.join(fixture_path, 'little_file.txt') }

      before do
        pairtree.create_repository_files_from_string(File.open(filepath).read, File.basename(filepath))
      end

      it 'creates a bag under the paritree' 

    end
  end
end

