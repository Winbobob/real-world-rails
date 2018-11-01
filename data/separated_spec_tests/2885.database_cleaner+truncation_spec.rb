require 'database_cleaner/sequel/truncation'
require 'database_cleaner/shared_strategy'
require 'support/sequel_helper'

module DatabaseCleaner
  module Sequel
    RSpec.describe Truncation do
      it_should_behave_like "a generic strategy"
      it_should_behave_like "a generic truncation strategy"

      SequelHelper.with_all_dbs do |helper|
        context "using a #{helper.db} connection" do
          around do |example|
            helper.setup
            example.run
            helper.teardown
          end

          let(:connection) { helper.connection }

          before { subject.db = connection }

          context 'when several tables have data' do
            before do
              connection[:users].insert
              connection[:agents].insert
            end

            context 'by default' do
              it 'truncates all the tables' 

            end

            context 'restricted to "only: [...]" some tables' do
              subject { described_class.new(only: ['users']) }

              it 'truncates only the mentioned tables (and leaves the rest alone)' 

            end

            context 'restricted to "except: [...]" some tables' do
              subject { described_class.new(except: ['users']) } # XXX: Strings only, symbols are ignored

              it 'leaves the mentioned tables alone (and truncates the rest)' 

            end
          end

          describe 'auto increment sequences' do
            it "resets AUTO_INCREMENT primary key seqeunce" 

          end

          describe "with pre_count optimization option" do
            subject { described_class.new(pre_count: true) }

            before { connection[:users].insert }

            it "only truncates non-empty tables" 

          end
        end
      end
    end
  end
end

