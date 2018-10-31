require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel::ValidateAbsenceOfMatcher, type: :model do
  if active_model_4_0?
    def self.available_column_types
      [
        :string,
        :text,
        :integer,
        :float,
        :decimal,
        :datetime,
        :timestamp,
        :time,
        :date,
        :binary
      ]
    end

    context 'a model with an absence validation' do
      it 'accepts' 


      it 'does not override the default message with a present' 


      available_column_types.each do |type|
        context "when column is of type #{type}" do
          it "accepts" 


          it_supports(
            'ignoring_interference_by_writer',
            tests: {
              accept_if_qualified_but_changing_value_does_not_interfere: {
                changing_values_with: :next_value
              },
            }
          )

          define_method(:validation_matcher_scenario_args) do |*args|
            super(*args).deep_merge(column_type: type)
          end
        end
      end

      def validation_matcher_scenario_args
        super.deep_merge(model_creator: :active_record)
      end
    end

    context 'a model without an absence validation' do
      it 'rejects with the correct failure message' 

    end

    context 'an ActiveModel class with an absence validation' do
      it 'accepts' 


      it 'does not override the default message with a blank' 


      it_supports(
        'ignoring_interference_by_writer',
        tests: {
          accept_if_qualified_but_changing_value_does_not_interfere: {
            changing_values_with: :upcase
          },
        }
      )

      def validation_matcher_scenario_args
        super.deep_merge(model_creator: :active_model)
      end
    end

    context 'an ActiveModel class without an absence validation' do
      it 'rejects with the correct failure message' 

    end

    context 'a has_many association with an absence validation' do
      it 'requires the attribute to not be set' 


      it_supports(
        'ignoring_interference_by_writer',
        tests: {
          accept_if_qualified_but_changing_value_does_not_interfere: {
            changing_values_with: :next_value
          },
        }
      )

      def validation_matcher_scenario_args
        super.deep_merge(model_creator: :"active_record/has_many")
      end
    end

    context 'a has_many association without an absence validation' do
      it 'does not require the attribute to not be set' 

    end

    context 'an absent has_and_belongs_to_many association' do
      it 'accepts' 


      it_supports(
        'ignoring_interference_by_writer',
        tests: {
          accept_if_qualified_but_changing_value_does_not_interfere: {
            changing_values_with: :next_value
          },
        }
      )

      def validation_matcher_scenario_args
        super.deep_merge(model_creator: :"active_record/habtm")
      end
    end

    context 'a non-absent has_and_belongs_to_many association' do
      it 'rejects with the correct failure message' 

    end

    context "an i18n translation containing %{attribute} and %{model}" do
      after { I18n.backend.reload! }

      it "does not raise an exception" 

    end

    context "an attribute with a context-dependent validation" do
      context "without the validation context" do
        it "does not match" 

      end

      context "with the validation context" do
        it "matches" 

      end
    end

    def define_model_validating_absence_of(attr, validation_options = {}, given_column_options = {})
      default_column_options = { type: :string, options: {} }
      column_options = default_column_options.merge(given_column_options)

      define_model :example, attr => column_options do |model|
        model.validates_absence_of(attr, validation_options)

        if block_given?
          yield model
        end
      end
    end

    def validating_absence_of(attr, validation_options = {}, given_column_options = {})
      model = define_model_validating_absence_of(
        attr,
        validation_options,
        given_column_options
      )
      model.new
    end
    alias_method :build_record_validating_absence_of, :validating_absence_of

    def active_model_with(attr, &block)
      define_active_model_class('Example', accessors: [attr], &block).new
    end

    def active_model_validating_absence_of(attr)
      active_model_with(attr) do
        validates_absence_of attr
      end
    end

    def having_many(plural_name, options = {})
      define_model plural_name.to_s.singularize
      define_model :parent do
        has_many plural_name
        if options[:absence]
          validates_absence_of plural_name
        end
      end.new
    end

    def having_and_belonging_to_many(plural_name, options = {})
      create_table 'children_parents', id: false do |t|
        t.integer "#{plural_name.to_s.singularize}_id"
        t.integer :parent_id
      end

      define_model plural_name.to_s.singularize
      define_model :parent do
        has_and_belongs_to_many plural_name
        if options[:absence]
          validates_absence_of plural_name
        end
      end.new
    end

    def validation_matcher_scenario_args
      super.deep_merge(matcher_name: :validate_absence_of)
    end
  end
end

