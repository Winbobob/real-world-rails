# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::ProgrammingPackage do
  self::PACKAGE_PATH = File.join(Rails.root,
                                 'spec/fixtures/course/programming_question_template.zip')
  self::EMPTY_PACKAGE_PATH = File.join(Rails.root,
                                       'spec/fixtures/course/'\
                                       'empty_programming_question_template.zip')

  def temp_package_path
    temp_package_stream.tap(&:close).path
  end

  def temp_package_stream
    package_path = Rails.application.config.x.temp_folder.join('spec/packages')
    FileUtils.mkdir_p(package_path) unless Dir.exist?(package_path)
    Tempfile.create('programming_package', package_path)
  end

  def open_package(path)
    Course::Assessment::ProgrammingPackage.new(path)
  end

  let(:package_path) { self.class::PACKAGE_PATH }
  subject { open_package(package_path) }

  describe '#initialize' do
    context 'when a file path is specified' do
      it 'opens the file' 

    end

    context 'when a file stream is specified' do
      let(:package_stream) { temp_package_stream }
      subject { open_package(package_stream) }
      before do
        IO.copy_stream(self.class::PACKAGE_PATH, package_stream)
        package_stream.seek(0)
      end

      it 'opens the file' 

    end

    context 'when anything else is specified' do
      subject { open_package(3) }
      it 'fails with ArgumentError' 

    end
  end

  describe '#path' do
    context 'when the package is not loaded' do
      context 'when a File name is given' do
        it 'returns the path to the package' 

      end

      context 'when a File is given' do
        let(:package_path) { File.new(self.class::PACKAGE_PATH, 'rb') }
        it 'returns the path to the File' 

      end
    end

    context 'when the package is loaded' do
      it 'returns the path to the package' 

    end
  end

  describe '#close' do
    let(:package_path) { temp_package_path }
    before do
      FileUtils.copy(self.class::PACKAGE_PATH, package_path)
    end

    it 'persists changes to the package' 

  end

  describe '#save' do
    let(:package_path) { temp_package_path }
    before do
      FileUtils.copy(self.class::PACKAGE_PATH, package_path)
    end

    it 'persists changes to the package' 

  end

  describe '#valid?' do
    let(:package_path) { temp_package_path }
    let(:package_to_copy) { self.class::PACKAGE_PATH }
    before do
      FileUtils.copy(package_to_copy, package_path)
    end

    context 'when given a valid package' do
      it 'returns true' 

    end

    context 'when given an empty package' do
      let(:package_to_copy) { self.class::EMPTY_PACKAGE_PATH }
      it 'returns false' 

    end
  end

  describe '#submission_files' do
    it 'loads all the submission files' 

  end

  describe '#submission_files=' do
    it 'replaces all existing submission files' 

  end

  describe '#ensure_file_open!' do
    context 'when the file cannot be opened' do
      it 'raises an IllegalStateError' 

    end
  end
end
