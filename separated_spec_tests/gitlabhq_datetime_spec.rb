require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/datetime'

describe RuboCop::Cop::Migration::Datetime do
  include CopHelper

  subject(:cop) { described_class.new }

  let(:migration_with_datetime) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          add_column(:users, :username, :text)
          add_column(:users, :last_sign_in, :datetime)
        end
      end
    )
  end

  let(:migration_with_timestamp) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          add_column(:users, :username, :text)
          add_column(:users, :last_sign_in, :timestamp)
        end
      end
    )
  end

  let(:migration_without_datetime) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          add_column(:users, :username, :text)
        end
      end
    )
  end

  let(:migration_with_datetime_with_timezone) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          add_column(:users, :username, :text)
          add_column(:users, :last_sign_in, :datetime_with_timezone)
        end
      end
    )
  end

  context 'in migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
    end

    it 'registers an offense when the ":datetime" data type is used' 


    it 'registers an offense when the ":timestamp" data type is used' 


    it 'does not register an offense when the ":datetime" data type is not used' 


    it 'does not register an offense when the ":datetime_with_timezone" data type is used' 

  end

  context 'outside of migration' do
    it 'registers no offense' 

  end
end

