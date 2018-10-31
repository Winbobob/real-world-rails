require 'database_cleaner/active_record/transaction'
require 'active_record'

module DatabaseCleaner
  module ActiveRecord

    RSpec.describe Transaction do
      let(:connection) { double("connection") }
      let(:connection_2) { double("connection_2") }
      let(:connection_pool) { double("connection_pool") }

      before do
        allow(::ActiveRecord::Base).to receive(:connection_pool).and_return(connection_pool)
        allow(connection_pool).to receive(:connections).and_return([connection])
        allow(::ActiveRecord::Base).to receive(:connection).and_return(connection)
      end

      describe "#start" do
        [:begin_transaction, :begin_db_transaction].each do |begin_transaction_method|
          context "using #{begin_transaction_method}" do
            before do
              allow(connection).to receive(:transaction)
              allow(connection).to receive(begin_transaction_method)
            end

            it "should increment open transactions if possible" 


            it "should tell ActiveRecord to increment connection if its not possible to increment current connection" 


            it "should start a transaction" 

          end
        end
      end

      describe "#clean" do
        context "manual accounting of transaction count" do
          it "should start a transaction" 


          it "should decrement open transactions if possible" 


          it "should not try to decrement or rollback if open_transactions is 0 for whatever reason" 


          it "should decrement connection via ActiveRecord::Base if connection won't" 


          it "should rollback open transactions in all connections" 


          it "should rollback open transactions in all connections with an open transaction" 

        end

        context "automatic accounting of transaction count (AR 4)" do
          before { stub_const("ActiveRecord::VERSION::MAJOR", 4) }

          it "should start a transaction" 


          it "should decrement open transactions if possible" 


          it "should not try to decrement or rollback if open_transactions is 0 for whatever reason" 


          it "should decrement connection via ActiveRecord::Base if connection won't" 

        end
      end

      describe "#connection_maintains_transaction_count?" do
        it "should return true if the major active record version is < 4" 


        it "should return false if the major active record version is > 3" 

      end
    end
  end
end

