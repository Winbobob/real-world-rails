[
  "app/view_utils/listing_form_view_utils",
  "app/services/result"
].each { |file| require_relative "../../#{file}" }

require 'pry'
require 'active_support'
require 'active_support/core_ext/object'

describe ListingFormViewUtils do
  describe "#filter" do
    def expect_filter(params, shape_opts, valid_until_enabled = false)
      shape_defaults = {
        price_enabled: true,
        units: []
      }

      expect(ListingFormViewUtils.filter(
               params,
               shape_defaults.merge(shape_opts),
               valid_until_enabled))
    end

    it "filters fields that do not belong to the shape" 

  end

  describe "#validate" do
    def validate(params, shape_opts, unit, valid_until_enabled = false)
      shape_defaults = {
        units: []
      }
      ListingFormViewUtils.validate(
        params: params,
        shape: shape_defaults.merge(shape_opts),
        unit: unit,
        valid_until_enabled: valid_until_enabled
      )
    end

    def expect_valid(params, shape_opts, unit = nil, valid_until_enabled = false)
      validate_res = validate(params, shape_opts, unit, valid_until_enabled)
      expect(validate_res.success).to eq(true), ->() {validate_res.data}
    end

    def expect_error(params, shape_opts, errors, unit = nil, valid_until_enabled = false)
      raise ArgumentError.new("Expecting error codes array") if errors.empty?

      res = validate(params, shape_opts, unit, valid_until_enabled)
      expect(res.success).to eq false
      errors.each { |error_code|
        expect(res.data).to include(error_code)
      }
    end

    it "validates the params" 


    it "validates custom units" 

  end
end


