require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveRecord::AssociationMatcher, type: :model do
  context 'belong_to' do
    it 'accepts a good association with the default foreign key' 


    it 'rejects a nonexistent association' 


    it 'rejects an association of the wrong type' 


    it 'rejects an association that has a nonexistent foreign key' 


    it 'accepts an association with an existing custom foreign key' 


    it 'accepts an association using an existing custom primary key' 


    it 'rejects an association with a bad :primary_key option' 


    it 'accepts a polymorphic association' 


    it 'accepts an association with a valid :dependent option' 


    it 'rejects an association with a bad :dependent option' 


    it 'accepts an association with a valid :counter_cache option' 


    it 'defaults :counter_cache to true' 


    it 'rejects an association with a bad :counter_cache option' 


    it 'rejects an association that has no :counter_cache option' 


    it 'accepts an association with a valid :inverse_of option' 


    it 'rejects an association with a bad :inverse_of option' 


    it 'rejects an association that has no :inverse_of option' 


    it 'accepts an association with a valid :conditions option' 


    it 'rejects an association with a bad :conditions option' 


    it 'accepts an association without a :class_name option' 


    it 'accepts an association with a valid :class_name option' 


    it 'rejects an association with a bad :class_name option' 


    it 'rejects an association with non-existent implicit class name' 


    it 'rejects an association with non-existent explicit class name' 


    it 'adds error message when rejecting an association with non-existent class' 


    it 'accepts an association with a namespaced class name' 


    it 'resolves class_name within the context of the namespace before the global namespace' 


    it 'accepts an association with a matching :autosave option' 


    it 'rejects an association with a non-matching :autosave option with the correct message' 


    context 'an association with a :validate option' do
      [false, true].each do |validate_value|
        context "when the model has validate: #{validate_value}" do
          it 'accepts a matching validate option' 


          it 'rejects a non-matching validate option' 


          it 'defaults to validate(true)' 


          it 'will not break matcher when validate option is unspecified' 

        end
      end
    end

    context 'an association without a :validate option' do
      it 'accepts validate(false)' 


      it 'rejects validate(true)' 


      it 'rejects validate()' 

    end

    context 'an association with a :touch option' do
      [false, true].each do |touch_value|
        context "when the model has touch: #{touch_value}" do
          it 'accepts a matching touch option' 


          it 'rejects a non-matching touch option' 


          it 'defaults to touch(true)' 


          it 'will not break matcher when touch option is unspecified' 

        end
      end
    end

    context 'an association without a :touch option' do
      it 'accepts touch(false)' 


      it 'rejects touch(true)' 


      it 'rejects touch()' 

    end

    context 'given the association is neither configured to be required nor optional' do
      context 'when qualified with required(true)' do
        if active_record_supports_optional_for_associations?
          context 'when belongs_to is configured to be required by default' do
            it 'passes' 

          end

          context 'when belongs_to is not configured to be required by default' do
            it 'fails with an appropriate message' 

          end
        else
          it 'fails with an appropriate message' 

        end
      end

      context 'when qualified with required(false)' do
        if active_record_supports_optional_for_associations?
          context 'when belongs_to is configured to be required by default' do
            it 'fails with an appropriate message' 

          end

          context 'when belongs_to is not configured to be required by default' do
            it 'passes' 

          end
        else
          it 'passes' 

        end
      end

      context 'when qualified with optional' do
        if active_record_supports_optional_for_associations?
          context 'when belongs_to is configured to be required by default' do
            it 'fails with an appropriate message' 

          end

          context 'when belongs_to is not configured to be required by default' do
            it 'passes' 

          end
        else
          it 'passes' 

        end
      end

      context 'when qualified with nothing' do
        if active_record_supports_optional_for_associations?
          context 'when belongs_to is configured to be required by default' do
            it 'passes' 

          end

          context 'when belongs_to is not configured to be required by default' do
            it 'passes' 


            context 'and a presence validation is on the attribute instead of using required: true' do
              it 'passes' 

            end

            context 'and a presence validation is on the attribute with a condition' do
              context 'and the condition is true' do
                it 'passes' 

              end

              context 'and the condition is false' do
                it 'passes' 

              end
            end
          end
        else
          it 'passes' 


          context 'and a presence validation is on the attribute instead of using required: true' do
            it 'passes' 

          end

          context 'and a presence validation is on the attribute with a condition' do
            context 'and the condition is true' do
              it 'passes' 

            end

            context 'and the condition is false' do
              it 'passes' 

            end
          end
        end
      end
    end

    context 'given the association is configured with required: true' do
      context 'when qualified with required(true)' do
        it 'passes' 

      end

      context 'when qualified with required(false)' do
        it 'passes' 

      end

      context 'when qualified with optional' do
        it 'fails with an appropriate message' 

      end

      context 'when qualified with nothing' do
        it 'passes' 

      end
    end

    if active_record_supports_optional_for_associations?
      context 'given the association is configured as optional: true' do
        context 'when qualified with required(true)' do
          it 'fails with an appropriate message' 

        end

        context 'when qualified with required(false)' do
          it 'passes' 

        end

        context 'when qualified with optional' do
          it 'passes' 

        end

        context 'when qualified with nothing' do
          it 'fails with an appropriate message' 

        end
      end
    end

    def belonging_to_parent(options = {}, parent_options = {}, &block)
      child_model = create_child_model_belonging_to_parent(
        options,
        parent_options,
        &block
      )
      child_model.new
    end

    def create_child_model_belonging_to_parent(
      options = {},
      parent_options = {},
      &block
    )
      define_model(:parent, parent_options)

      define_model :child, parent_id: :integer do
        belongs_to :parent, options

        if block
          class_eval(&block)
        end
      end
    end

    def belonging_to_with_inverse(association, inverse_association)
      parent_model_name = association.to_s.singularize
      child_model_name = inverse_association.to_s.singularize
      parent_foreign_key = "#{parent_model_name}_id"

      define_model parent_model_name do
        has_many inverse_association
      end

      child_model = define_model(
        child_model_name,
        parent_foreign_key => :integer,
      ) do
        belongs_to association, inverse_of: inverse_association
      end

      child_model.new
    end

    def belonging_to_non_existent_class(model_name, assoc_name, options = {})
      define_model model_name, "#{assoc_name}_id" => :integer do
        belongs_to assoc_name, options
      end.new
    end
  end

  context 'have_many' do
    it 'accepts a valid association without any options' 


    it 'accepts a valid association with a :through option' 


    it 'accepts a valid association with an :as option' 


    it 'rejects an association that has a nonexistent foreign key' 


    it 'accepts an association using an existing custom primary key' 


    it 'rejects an association with a bad :primary_key option' 


    it 'rejects an association with a bad :as option' 


    it 'rejects an association that has a bad :through option' 


    it 'rejects an association that has the wrong :through option' 


    it 'produces a failure message without exception when association is missing :through option' 


    it 'accepts an association with a valid :dependent option' 


    it 'rejects an association with a bad :dependent option' 


    it 'accepts an association with a valid :source option' 


    it 'rejects an association with a bad :source option' 


    it 'accepts an association with a valid :order option' 


    it 'rejects an association with a bad :order option' 


    it 'accepts an association with a valid :conditions option' 


    it 'rejects an association with a bad :conditions option' 


    it 'accepts an association without a :class_name option' 


    it 'accepts an association with a valid :class_name option' 


    it 'rejects an association with a bad :class_name option' 


    it 'rejects an association with non-existent implicit class name' 


    it 'rejects an association with non-existent explicit class name' 


    it 'adds error message when rejecting an association with non-existent class' 


    it 'accepts an association with a namespaced class name' 


    it 'resolves class_name within the context of the namespace before the global namespace' 


    it 'accepts an association with a matching :autosave option' 


    it 'rejects an association with a non-matching :autosave option with the correct message' 


    if rails_5_x?
      context 'index_errors' do
        it 'accepts an association with a matching :index_errors option' 


        it 'rejects an association with a non-matching :index_errors option and returns the correct message' 

      end
    end

    context 'validate' do
      it 'accepts when the :validate option matches' 


      it 'rejects when the :validate option does not match' 


      it 'assumes validate() means validate(true)' 


      it 'matches validate(false) to having no validate option specified' 

    end

    it 'accepts an association with a nonstandard reverse foreign key, using :inverse_of' 


    it 'rejects an association with a nonstandard reverse foreign key, if :inverse_of is not correct' 


    def having_many_children(options = {})
      define_model :child, parent_id: :integer
      define_model(:parent).tap do |model|
        if options.key?(:order)
          order = options.delete(:order)
          define_association_with_order(model, :has_many, :children, order, options)
        else
          model.has_many :children, options
        end
      end.new
    end

    def having_many_non_existent_class(model_name, assoc_name, options = {})
      define_model model_name do
        has_many assoc_name, options
      end.new
    end
  end

  context 'have_one' do
    it 'accepts a valid association without any options' 


    it 'accepts a valid association with an :as option' 


    it 'rejects an association that has a nonexistent foreign key' 


    it 'accepts an association with an existing custom foreign key' 


    it 'accepts an association using an existing custom primary key' 


    it 'rejects an association with a bad :primary_key option' 


    it 'rejects an association with a bad :as option' 


    it 'accepts an association with a valid :dependent option' 


    it 'accepts any dependent option if true' 


    it 'rejects any dependent options if false' 


    it 'accepts a nil dependent option if false' 


    it 'rejects an association with a bad :dependent option' 


    it 'accepts an association with a valid :order option' 


    it 'rejects an association with a bad :order option' 


    it 'accepts an association with a valid :conditions option' 


    it 'rejects an association with a bad :conditions option' 


    it 'accepts an association without a :class_name option' 


    it 'accepts an association with a valid :class_name option' 


    it 'rejects an association with a bad :class_name option' 


    it 'rejects an association with non-existent implicit class name' 


    it 'rejects an association with non-existent explicit class name' 


    it 'adds error message when rejecting an association with non-existent class' 


    it 'accepts an association with a namespaced class name' 


    it 'resolves class_name within the context of the namespace before the global namespace' 


    it 'accepts an association with a matching :autosave option' 


    it 'rejects an association with a non-matching :autosave option with the correct message' 



    it 'accepts an association with a through' 


    it 'rejects an association with a bad through' 


    context 'validate' do
      it 'accepts when the :validate option matches' 


      it 'rejects when the :validate option does not match' 


      it 'assumes validate() means validate(true)' 


      it 'matches validate(false) to having no validate option specified' 

    end

    if active_record_supports_optional_for_associations?
      context 'given an association with a matching :required option' do
        it 'passes' 

      end
    end

    context 'given an association with a non-matching :required option' do
      it 'fails with an appropriate message' 

    end

    def having_one_detail(options = {})
      define_model :detail, person_id: :integer
      define_model(:person).tap do |model|
        if options.key?(:order)
          order = options.delete(:order)
          define_association_with_order(model, :has_one, :detail, order, options)
        else
          model.has_one :detail, options
        end
      end.new
    end

    def having_one_non_existent(model_name, assoc_name, options = {})
      define_model model_name do
        has_one assoc_name, options
      end.new
    end
  end

  context 'have_and_belong_to_many' do
    it 'accepts a valid association' 


    it 'rejects a nonexistent association' 


    it 'rejects an association with a nonexistent join table' 


    it 'rejects an association with a join table with incorrect columns' 


    context 'when the association is declared with a :join_table option' do
      it 'accepts when testing with the same :join_table option' 


      it 'accepts even when not explicitly testing with a :join_table option' 


      it 'rejects when testing with a different :join_table option' 

    end

    context 'when the association is not declared with a :join_table option' do
      it 'rejects when testing with a :join_table option' 

    end

    context 'using a custom foreign key' do
      it 'rejects an association with a join table with incorrect columns' 

    end

    context 'using a custom association foreign key' do
      it 'rejects an association with a join table with incorrect columns' 


      it 'accepts foreign keys when they are symbols' 


    end

    it 'rejects an association of the wrong type' 


    it 'accepts an association with a valid :conditions option' 


    it 'rejects an association with a bad :conditions option' 


    it 'accepts an association without a :class_name option' 


    it 'accepts an association with a valid :class_name option' 


    it 'rejects an association with a bad :class_name option' 


    it 'rejects an association with non-existent implicit class name' 


    it 'rejects an association with non-existent explicit class name' 


    it 'adds error message when rejecting an association with non-existent class' 


    it 'accepts an association with a namespaced class name' 


    it 'resolves class_name within the context of the namespace before the global namespace' 


    it 'accepts an association with a matching :autosave option' 


    it 'rejects an association with a non-matching :autosave option with the correct message' 


    context 'validate' do
      it 'accepts when the :validate option matches' 


      it 'rejects when the :validate option does not match' 


      it 'assumes validate() means validate(true)' 


      it 'matches validate(false) to having no validate option specified' 

    end

    def having_and_belonging_to_many_relatives(options = {})
      define_model :relative
      define_model :people_relative, id: false, person_id: :integer,
        relative_id: :integer
      define_model :person do
        has_and_belongs_to_many :relatives
      end.new
    end

    def having_and_belonging_to_many_non_existent_class(model_name, assoc_name, options = {})
      define_model model_name do
        has_and_belongs_to_many assoc_name, options
      end.new
    end
  end

  def define_association_with_conditions(model, macro, name, conditions, other_options={})
    args = []
    options = {}
    if active_record_supports_relations?
      args << proc { where(conditions) }
    else
      options[:conditions] = conditions
    end
    args << options
    model.__send__(macro, name, *args)
  end

  def define_association_with_order(model, macro, name, order, other_options={})
    args = []
    options = {}
    if active_record_supports_relations?
      args << proc { order(order) }
    else
      options[:order] = order
    end
    args << options
    model.__send__(macro, name, *args)
  end

  def dependent_options
    if active_record_supports_more_dependent_options?
      [:destroy, :delete, :nullify, :restrict_with_exception, :restrict_with_error]
    else
      [:destroy, :delete, :nullify, :restrict]
    end
  end

  def configuring_default_belongs_to_requiredness(value, &block)
    configuring_application(
      ActiveRecord::Base,
      :belongs_to_required_by_default,
      value,
      &block
    )
  end

  def configuring_application(config, name, value)
    previous_value = config.send(name)
    config.send("#{name}=", value)
    yield
  ensure
    config.send("#{name}=", previous_value)
  end
end

