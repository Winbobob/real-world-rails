# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursemologyDockerContainer do
  let(:image) { 'coursemology/evaluator-image-python:2.7' }
  let(:package) do
    Rails.root.join('spec', 'fixtures', 'course', 'programming_question_template.zip')
  end
  subject { CoursemologyDockerContainer.create(image) }

  describe '#wait' do
    it 'retries until the container finishes' 


    it 'returns the exit code of the container' 

  end

  describe '#exit_code' do
    context 'when the container has been waited upon' do
      it 'returns the exit code of the container' 

    end

    context 'when the container is still running' do
      it 'returns nil' 

    end
  end

  describe '#copy_package' do
    it 'copies to the home directory' 

  end

  describe '#tar_package' do
    let(:tar_stream) { subject.send(:tar_package, package) }
    it 'resets the stream to the start' 


    it 'copies all files, prefixed with the package directory name' 

  end

  describe '#execute_package' do
    after { subject.send(:delete) }

    def evaluate_result
      expect(subject).to receive(:start!).and_call_original
      subject.send(:execute_package)
    end

    it 'evaluates the result' 


    it 'returns only when the container has stopped running' 

  end

  describe '#evaluation_result' do
    before { subject.send(:execute_package) }
    after { subject.send(:delete) }

    it 'does not expose raw Docker Attach Protocol in the output' 


    it 'sets the return code of the container' 

  end

  describe '#extract_test_report' do
    let(:report_path) do
      Rails.root.join('spec', 'fixtures', 'course', 'programming_single_test_suite_report.xml')
    end
    let(:report_contents) { File.read(report_path) }

    def copy_report(contents)
      subject.start!
      subject.wait
      tar = StringIO.new(Docker::Util.create_tar('report.xml' => contents))
      subject.archive_in_stream(CoursemologyDockerContainer::PACKAGE_PATH) { tar.read }
    end

    after { subject.send(:delete) }

    it 'returns the test report' 


    it 'does not crash when report is nil' 


    context 'when running the tests fails' do
      it 'returns nil' 

    end
  end
end

