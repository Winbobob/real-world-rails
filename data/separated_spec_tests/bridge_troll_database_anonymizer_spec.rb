require 'rails_helper'

describe DatabaseAnonymizer do
  RSpec::Matchers.define :scrub_fields do |record, fields|
    match do |actual|
      original_attributes = record.attributes.slice(*fields.map(&:to_s))
      unless original_attributes.present?
        raise "Could not determine original attributes"
      end

      actual.call

      processed_attributes = record.attributes.slice(*fields.map(&:to_s))

      @unscrubbed_attributes = []
      original_attributes.each do |key, value|
        if processed_attributes[key] == value
          @unscrubbed_attributes << key
        end
      end

      @unscrubbed_attributes.length == 0
    end

    failure_message do |actual|
      <<~EOT
          Did not seem to scrub these #{record.class} attributes:
          #{@unscrubbed_attributes.join(', ')}
      EOT
    end

    def supports_block_expectations?
      true
    end
  end

  describe '#anonymize_database' do
    let(:logger) { Logger.new(STDOUT) }
    let(:anonymizer) { DatabaseAnonymizer.new(logger) }
    let(:anonymize) { anonymizer.anonymize_database }

    before do
      logger.level = Logger::WARN
    end

    it 'anonymizes the User table' 


    it 'anonymizes the Survey table' 


    it 'anonymizes the RSVP table' 


    it 'anonymizes the Profile table' 


    it 'anonymizes the MeetupUser table' 


    it 'anonymizes the Location table' 


    it 'anonymizes the EventEmail table' 


    it 'deletes the Authentication table' 

  end

  describe '#anonymize_user' do
    it 'replaces identifying data for non-admin users' 


    it 'does not replace data for a sample admin user' 


    it 'does not replace data for a sample organizer user' 

  end

  describe '#anonymize_meetup_user' do
    it 'replaces identifying data from Meetup User data' 

  end

  describe '#anonymize_survey' do
    it 'replaces identifying data from Survey data' 

  end

  describe '#anonymize_rsvp' do
    it 'replaces identifying data from RSVP data' 

  end

  describe '#anonymize_profile' do
    it 'replaces identifying data from the Profile' 

  end

  describe '#anonymize_location' do
    it 'replaces sensitive data from the Location' 

  end

  describe '#anonymize_event_email' do
    it 'replaces sensitive data from the email' 

  end
end

