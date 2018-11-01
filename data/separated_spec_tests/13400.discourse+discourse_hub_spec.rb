require 'rails_helper'
require_dependency 'discourse_hub'

describe DiscourseHub do
  describe '.discourse_version_check' do
    it 'should return just return the json that the hub returns' 

  end

  describe '.version_check_payload' do

    describe 'when Discourse Hub has not fetched stats since past 7 days' do
      it 'should include stats' 

    end

    describe 'when Discourse Hub has fetched stats in past 7 days' do
      it 'should not include stats' 

    end

    describe 'when send_anonymize_stats is disabled' do
      describe 'when Discourse Hub has not fetched stats for the past year' do
        it 'should not include stats' 

      end
    end
  end

  describe '.collection_action' do
    before do
      @orig_logger = Rails.logger
      Rails.logger = @fake_logger = FakeLogger.new
    end

    after do
      Rails.logger = @orig_logger
    end

    it 'should log correctly on error' 

  end
end

