require 'spec_helper'

describe Gitlab::Database::Grant do
  describe '.create_and_execute_trigger' do
    it 'returns true when the user can create and execute a trigger' 


    it 'returns false when the user can not create and/or execute a trigger', :postgresql do
      # In case of MySQL the user may have SUPER permissions, making it
      # impossible to have `false` returned when running tests; hence we only
      # run these tests on PostgreSQL.
      expect(described_class.create_and_execute_trigger?('foo')).to eq(false)
    end
  end
end
