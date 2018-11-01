require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::DefineEnumForMatcher, type: :model do
  context 'if the attribute is given in plural form accidentally' do
    it 'rejects with an appropriate failure message' 

  end

  context 'if a method to hold enum values exists on the model but was not created via the enum macro' do
    it 'rejects with an appropriate failure message' 

  end

  describe 'with only the attribute name specified' do
    context 'if the attribute is not defined as an enum' do
      it 'rejects with an appropriate failure message' 

    end

    context 'if the column storing the attribute is not an integer type' do
      it 'rejects with an appropriate failure message' 

    end

    context 'if the attribute is defined as an enum' do
      it 'accepts' 


      context 'and the matcher is negated' do
        it 'rejects with an appropriate failure message' 

      end
    end
  end

  describe 'with both attribute name and enum values specified' do
    context 'when the actual enum values are an array' do
      context 'if the attribute is not defined as an enum' do
        it 'rejects with an appropriate failure message' 

      end

      context 'if the attribute is defined as an enum' do
        context 'but the enum values do not match' do
          it 'rejects with an appropriate failure message' 

        end

        context 'and the enum values match' do
          it 'accepts' 

        end
      end
    end

    context 'when the actual enum values are a hash' do
      context 'if the attribute is not defined as an enum' do
        it 'rejects with an appropriate failure message' 

      end

      context 'if the attribute is defined as an enum' do
        context 'but the enum values do not match' do
          it 'rejects with an appropriate failure message' 

        end

        context 'and the enum values match' do
          context 'when expected enum values are a hash' do
            it 'accepts' 

          end

          context 'when expected enum values are an array' do
            it 'accepts' 

          end
        end
      end
    end
  end

  context 'with values specified using #with' do
    it 'produces a warning' 

  end

  describe 'with the backing column specified to be of some type' do
    context 'if the column storing the attribute is of a different type' do
      it 'rejects with an appropriate failure message' 

    end

    context 'if the column storing the attribute is of the same type' do
      it 'accepts' 

    end
  end

  if active_record_enum_supports_prefix_and_suffix?
    context 'qualified with #with_prefix' do
      context 'when the prefix is explicit' do
        context 'if the attribute was not defined with a prefix' do
          it 'rejects with an appropriate failure message' 

        end

        context 'if the attribute was defined with a different prefix' do
          it 'rejects with an appropriate failure message' 

        end

        context 'if the attribute was defined with the same prefix' do
          it 'accepts' 

        end
      end

      context 'when the prefix is implicit' do
        context 'if the attribute was not defined with a prefix' do
          it 'rejects with an appropriate failure message' 

        end

        context 'if the attribute was defined with a prefix' do
          it 'accepts' 

        end
      end
    end

    context 'qualified with #with_suffix' do
      context 'when the suffix is explicit' do
        context 'if the attribute was not defined with a suffix' do
          it 'rejects with an appropriate failure message' 

        end

        context 'if the attribute was defined with a different suffix' do
          it 'rejects with an appropriate failure message' 

        end

        context 'if the attribute was defined with the same suffix' do
          it 'accepts' 

        end
      end

      context 'when the suffix is implicit' do
        context 'if the attribute was not defined with a suffix' do
          it 'rejects with an appropriate failure message' 

        end

        context 'if the attribute was defined with a suffix' do
          it 'accepts' 

        end
      end
    end

    context 'qualified with both #with_prefix and #with_suffix' do
      context 'if the attribute was not defined with a different prefix' do
        it 'rejects with an appropriate failure message' 


        context 'if the attribute was defined with a different suffix' do
          it 'rejects with an appropriate failure message' 

        end

        context 'if the attribute was defined with the same prefix and suffix' do
          it 'accepts' 

        end
      end
    end
  end

  def build_record_with_array_values(
    model_name: 'Example',
    attribute_name: :attr,
    column_type: :integer,
    values: ['published', 'unpublished', 'draft'],
    prefix: false,
    suffix: false
  )
    build_record_with_enum_attribute(
      model_name: model_name,
      attribute_name: attribute_name,
      column_type: column_type,
      values: values,
      prefix: prefix,
      suffix: suffix,
    )
  end

  def build_record_with_hash_values(
    model_name: 'Example',
    attribute_name: :attr,
    values: { active: 0, archived: 1 },
    prefix: false,
    suffix: false
  )
    build_record_with_enum_attribute(
      model_name: model_name,
      attribute_name: attribute_name,
      column_type: :integer,
      values: values,
      prefix: prefix,
      suffix: suffix,
    )
  end

  def build_record_with_enum_attribute(
    model_name:,
    attribute_name:,
    column_type:,
    values:,
    prefix: false,
    suffix: false
  )
    model = define_model(
      model_name,
      attribute_name => { type: column_type },
    )

    if active_record_enum_supports_prefix_and_suffix?
      model.enum(attribute_name => values, _prefix: prefix, _suffix: suffix)
    else
      model.enum(attribute_name => values)
    end

    model.new
  end

  def build_record_with_non_enum_attribute(model_name:, attribute_name:)
    define_model(model_name, attribute_name => :integer).new
  end
end

