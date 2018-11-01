require 'database_cleaner/generic/truncation'

module ::DatabaseCleaner
  module Generic
    class TruncationExample
      include ::DatabaseCleaner::Generic::Truncation

      def only
        @only
      end

      def except
        @tables_to_exclude
      end

      def reset_ids?
        !!@reset_ids
      end

      def pre_count?
        !!@pre_count
      end
    end

    class TruncationExampleWithMigrations < TruncationExample
      def migration_storage_names
        %w[migration_storage_name]
      end
    end

    RSpec.describe TruncationExample do
      it "will start" 


      it "expects clean to be implemented later" 


      context "private methods" do
        it { is_expected.not_to respond_to(:tables_to_truncate) }

        it 'expects #tables_to_truncate to be implemented later' 


        it { is_expected.not_to respond_to(:migration_storage_names) }
      end

      describe "initialize" do
        it "should accept no options" 


        it "should accept a hash of options" 


        describe ":only option" do
          it "defaults to nil" 


          it "can be set to specify tables to clean" 

        end

        describe ":except option" do
          it "defaults to empty array" 


          it "can be set to specify tables to skip" 

        end

        describe ":pre_count option" do
          it "defaults to false" 


          it "can be set" 

        end

        describe ":reset_ids option" do
          it "defaults to false" 


          it "can be set" 

        end

        it "should raise an error when invalid options are provided" 


        it "should raise an error when :only and :except options are used" 


        describe TruncationExampleWithMigrations do
          it { expect(subject.only).to eq nil }
          it { expect(subject.except).to eq %w[migration_storage_name] }

          it "should not mutate the array of excepted tables" 

        end
      end
    end
  end
end

