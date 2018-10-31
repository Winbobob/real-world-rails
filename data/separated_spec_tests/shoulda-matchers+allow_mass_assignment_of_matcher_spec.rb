require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel::AllowMassAssignmentOfMatcher, type: :model do
  if action_pack_lt_5?
    context '#description' do
      context 'without a role' do
        it 'includes the attribute name' 

      end

      if active_model_3_1?
        context 'with a role' do
          it 'includes the attribute name and the role' 

        end
      end
    end

    context 'an attribute that is blacklisted from mass-assignment' do
      it 'rejects being mass-assignable' 

    end

    context 'an attribute that is not whitelisted for mass-assignment' do
      it 'rejects being mass-assignable' 

    end

    context 'an attribute that is whitelisted for mass-assignment' do
      it 'accepts being mass-assignable' 

    end

    context 'an attribute not included in the mass-assignment blacklist' do
      it 'accepts being mass-assignable' 

    end

    unless active_model_3_2? || active_model_4_0?
      context 'an attribute on a class with no protected attributes' do
        it 'accepts being mass-assignable' 


        it 'assigns a negative failure message' 

      end

      def no_protected_attributes
        define_model(:example, attr: :string).new
      end
    end

    context 'an attribute on a class with all protected attributes' do
      it 'rejects being mass-assignable' 


      def all_protected_attributes
        define_model(:example, attr: :string) do
          attr_accessible nil
        end.new
      end
    end

    if active_model_3_1?
      context 'an attribute included in the mass-assignment whitelist for admin role only' do
        it 'rejects being mass-assignable' 


        it 'accepts being mass-assignable for admin' 


        def mass_assignable_as_admin
          define_model(:example, attr: :string) do
            attr_accessible :attr, as: :admin
          end.new
        end
      end
    end

    def define_model(name, columns, &block)
      super(name, columns, whitelist_attributes: false, &block)
    end
  end
end

