require "rails_helper"

describe HasCustomFields do

  context "custom_fields" do
    before do
      DB.exec("create temporary table custom_fields_test_items(id SERIAL primary key)")
      DB.exec("create temporary table custom_fields_test_item_custom_fields(id SERIAL primary key, custom_fields_test_item_id int, name varchar(256) not null, value text)")

      class CustomFieldsTestItem < ActiveRecord::Base
        include HasCustomFields
      end

      class CustomFieldsTestItemCustomField < ActiveRecord::Base
        belongs_to :custom_fields_test_item
      end
    end

    after do
      DB.exec("drop table custom_fields_test_items")
      DB.exec("drop table custom_fields_test_item_custom_fields")

      # import is making my life hard, we need to nuke this out of orbit
      des = ActiveSupport::DescendantsTracker.class_variable_get :@@direct_descendants
      des[ActiveRecord::Base].delete(CustomFieldsTestItem)
      des[ActiveRecord::Base].delete(CustomFieldsTestItemCustomField)
    end

    it "simple modification of custom fields" 


    it "casts integers to string without error" 


    it "reload loads from database" 


    it "double save actually saves" 


    it "handles arrays properly" 


    it "casts integers in arrays properly without error" 


    it "supportes type coersion" 


    it "simple modifications don't interfere" 


    it "supports arrays in json fields" 


    it "will not fail to load custom fields if json is corrupt" 


    it "supports bulk retrieval with a list of ids" 


    it "handles interleaving saving properly" 


    describe "upsert_custom_fields" do
      it 'upserts records' 

    end
  end
end

