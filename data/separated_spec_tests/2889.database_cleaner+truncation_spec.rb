require 'support/active_record_helper'
require 'database_cleaner/active_record/truncation'

RSpec.describe DatabaseCleaner::ActiveRecord::Truncation do
  ActiveRecordHelper.with_all_dbs do |helper|
    context "using a #{helper.db} connection" do
      around do |example|
        helper.setup
        example.run
        helper.teardown
      end

      let(:connection) { helper.connection }

      before do
        allow(connection).to receive(:disable_referential_integrity).and_yield
        allow(connection).to receive(:database_cleaner_view_cache).and_return([])
      end

      describe '#clean' do
        context "with records" do
          before do
            2.times { User.create! }
            2.times { Agent.create! }
          end

          it "should truncate all tables" 


          it "should reset AUTO_INCREMENT index of table" 


          xit "should not reset AUTO_INCREMENT index of table if :reset_ids is false" do
            described_class.new(reset_ids: false).clean
            expect(User.create.id).to eq 3
          end

          it "should truncate all tables except for schema_migrations" 


          it "should only truncate the tables specified in the :only option when provided" 


          it "should not truncate the tables specified in the :except option" 


          it "should raise an error when :only and :except options are used" 


          it "should raise an error when invalid options are provided" 


          it "should not truncate views" 

        end

        describe "with pre_count optimization option" do
          subject { described_class.new(pre_count: true) }

          it "only truncates non-empty tables" 

        end

        context 'when :cache_tables is set to true' do
          it 'caches the list of tables to be truncated' 

        end

        context 'when :cache_tables is set to false' do
          it 'does not cache the list of tables to be truncated' 

        end
      end
    end
  end
end

