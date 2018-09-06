# frozen_string_literal: true
require 'rails_helper'

RSpec.describe TrackableJob do
  class self::NoOpJob < ActiveJob::Base
    include TrackableJob
  end

  class self::ExampleJob < self::NoOpJob
    protected

    def perform_tracked
    end
  end

  describe TrackableJob::Job, type: :model do
    subject { TrackableJob::Job.new }

    def self.validate_absence_of_error
      it 'validates absence of :error' 

    end

    it { is_expected.to validate_absence_of(:redirect_to) }
    validate_absence_of_error

    context 'when the job is completed' do
      before { subject.status = :completed }

      it { is_expected.not_to validate_absence_of(:redirect_to) }
      validate_absence_of_error
    end

    context 'when the job is errored' do
      before { subject.status = :errored }

      it { is_expected.not_to validate_absence_of(:redirect_to) }
      it 'does not validate absence of :error' 

    end

    describe '#save' do
      context 'when the job is finished' do
        it 'notifies listeners' 

      end

      context 'when the job was already completed' do
        it 'does not notify listeners' 

      end
    end
  end

  subject { self.class::ExampleJob.perform_later }

  context 'when a new job is created' do
    it 'has a submitted state' 


    it 'is persisted to the database' 


    it 'only creates one job' 

  end

  context 'when the job is completed' do
    before { subject.perform_now }
    it 'transitions to the completed state' 

  end

  context 'when the job has an error' do
    let(:error_to_throw) { StandardError }
    before do
      error_to_throw = self.error_to_throw
      subject.define_singleton_method(:perform_tracked) do
        raise error_to_throw
      end

      subject.perform_now
    end

    it 'transitions to the errored state' 


    it 'has the error' 


    context 'when the error defines #as_json' do
      let(:error_to_throw) { self.class::MyError }
      class self::MyError < StandardError
        def to_h
          { test: 'message' }
        end
      end

      it 'includes the json properties' 

    end
  end

  describe '#wait' do
    it 'waits for the job to finish' 


    context 'when waiting for a completed job' do
      it 'does not block' 

    end
  end

  describe '#perform_tracked' do
    with_active_job_queue_adapter(:inline) do
      subject { self.class::NoOpJob.perform_later }

      it 'fails with NotImplementedError' 

    end
  end

  describe '#job_id=' do
    it 'fetches the job' 

  end

  describe '#redirect_to' do
    let(:redirect_to_path) { '/' }
    it 'sets the #redirect_to attribute of the job' 

  end
end

