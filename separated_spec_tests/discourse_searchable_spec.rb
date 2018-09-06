require "rails_helper"

describe Searchable do
  context "has search data" do
    before do
      Topic.exec_sql("create temporary table searchable_records(id SERIAL primary key)")
      Topic.exec_sql("create temporary table searchable_record_search_data(searchable_record_id int primary key, search_data tsvector, raw_data text, locale text)")

      class SearchableRecord < ActiveRecord::Base
        include Searchable
      end

      class SearchableRecordSearchData < ActiveRecord::Base
        self.primary_key = 'searchable_record_id'
        belongs_to :test_item
      end
    end

    after do
      Topic.exec_sql("drop table searchable_records")
      Topic.exec_sql("drop table searchable_record_search_data")

      # import is making my life hard, we need to nuke this out of orbit
      des = ActiveSupport::DescendantsTracker.class_variable_get :@@direct_descendants
      des[ActiveRecord::Base].delete(SearchableRecord)
      des[ActiveRecord::Base].delete(SearchableRecordSearchData)
    end

    let(:item) { SearchableRecord.create! }

    it 'can build the data' 


    it 'can save the data' 


    it 'destroy the search data when the item is deprived' 

  end
end

