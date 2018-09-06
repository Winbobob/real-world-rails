require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/timestamps'

describe RuboCop::Cop::Migration::Timestamps do
  include CopHelper

  subject(:cop) { described_class.new }
  let(:migration_with_timestamps) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          create_table :users do |t|
            t.string :username, null: false
            t.timestamps null: true
            t.string :password
          end
        end
      end
    )
  end

  let(:migration_without_timestamps) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          create_table :users do |t|
            t.string :username, null: false
            t.string :password
          end
        end
      end
    )
  end

  let(:migration_with_timestamps_with_timezone) do
    %q(
      class Users < ActiveRecord::Migration
        DOWNTIME = false

        def change
          create_table :users do |t|
            t.string :username, null: false
            t.timestamps_with_timezone null: true
            t.string :password
          end
        end
      end
    )
  end

  context 'in migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
    end

    it 'registers an offense when the "timestamps" method is used' 


    it 'does not register an offense when the "timestamps" method is not used' 


    it 'does not register an offense when the "timestamps_with_timezone" method is used' 

  end

  context 'outside of migration' do
    it 'registers no offense' 

  end
end

