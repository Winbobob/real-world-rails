# frozen_string_literal: true
class PostalValidator
  ZIPCODES_REGEX = {
    US: /\A\d{5}([ \-]\d{4})?\z/
  }.freeze
  MAX_LENGTH = 9

  attr_accessor :errors

  def initialize(postal_code, country_code: nil)
    @postal_code = postal_code
    @country_code = country_code
    @errors = []
  end

  def valid?
    @errors = []
    validate_country_format
    validate_characters
    validate_length
    @errors.empty?
  end

  private

  def validate_country_format
    return unless ZIPCODES_REGEX.key? @country_code
    if (ZIPCODES_REGEX[@country_code] =~ @postal_code).nil?
      @errors << I18n.t('validation.is_invalid_postal')
    end
  end

  # Matching Braintree validation
  def validate_characters
    if (/\A[a-zA-Z\d\s\-]*\z/ =~ @postal_code).nil?
      @errors << I18n.t('validation.postal.has_invalid_characters')
    end
  end

  # Matching Braintree validation
  def validate_length
    stripped_postal = @postal_code.gsub(/[^a-zA-Z\d]/, '')
    if stripped_postal.length > MAX_LENGTH
      @errors << I18n.t('validation.postal.too_long')
    end
  end
end
