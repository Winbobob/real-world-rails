require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/add_timestamps'

describe RuboCop::Cop::Migration::AddTimestamps do
  include CopHelper

  subject(:cop) { described_class.new }
  let(:migration_with_add_timestamps) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          add_column(:users, :username, :text)
          add_timestamps(:users)
        end
      end
    )
  end

  let(:migration_without_add_timestamps) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          add_column(:users, :username, :text)
        end
      end
    )
  end

  let(:migration_with_add_timestamps_with_timezone) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          add_column(:users, :username, :text)
          add_timestamps_with_timezone(:users)
        end
      end
    )
  end

  context 'in migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
    end

    it 'registers an offense when the "add_timestamps" method is used' 


    it 'does not register an offense when the "add_timestamps" method is not used' 


    it 'does not register an offense when the "add_timestamps_with_timezone" method is used' 

  end

  context 'outside of migration' do
    it 'registers no offense' 

  end
end

