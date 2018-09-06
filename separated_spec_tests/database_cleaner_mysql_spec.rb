require 'active_record'
require 'support/active_record/mysql_setup'
require 'database_cleaner/active_record/truncation'
require 'database_cleaner/active_record/truncation/shared_fast_truncation'

RSpec.describe DatabaseCleaner::ActiveRecord::Truncation do
  let(:helper) { MySQLHelper.new }

  let(:connection) do
    helper.active_record_mysql_connection
  end

  around do |example|
    helper.active_record_mysql_setup

    example.run

    helper.active_record_mysql_teardown
  end

  describe "AR connection adapter monkeypatches" do
    describe "#truncate_table" do
      it "should truncate the table" 


      it "should reset AUTO_INCREMENT index of table" 

    end

    it_behaves_like "an adapter with pre-count truncation"
  end
end


