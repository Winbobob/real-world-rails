require 'spec_helper'

describe Types::PermissionTypes::BasePermissionType do
  let(:permitable) { double('permittable') }
  let(:current_user) { build(:user) }
  let(:context) { { current_user: current_user } }
  subject(:test_type) do
    Class.new(described_class) do
      graphql_name 'TestClass'

      permission_field :do_stuff, resolve: -> (_, _, _)  { true }
      ability_field(:read_issue)
      abilities :admin_issue
    end
  end

  describe '.permission_field' do
    it 'adds a field for the required permission' 

  end

  describe '.ability_field' do
    it 'adds a field for the required permission' 


    it 'does not add a resolver block if another resolving param is passed' 

  end

  describe '.abilities' do
    it 'adds a field for the passed permissions' 

  end
end

