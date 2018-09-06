require 'spec_helper'

describe Admin::CategoryService do

  before(:each) do
    @category = FactoryGirl.create(:category, :community => @community)
    @category2 = FactoryGirl.create(:category, :community => @community)
    @subcategory = FactoryGirl.create(:category)
    @subcategory.update_attribute(:parent_id, @category.id)
    @subcategory2 = FactoryGirl.create(:category)
    @subcategory2.update_attribute(:parent_id, @category.id)

    @custom_field = FactoryGirl.create(:custom_field, :categories => [@category])
    @subcustom_field = FactoryGirl.create(:custom_field, :categories => [@subcategory, @subcategory2])

    @category.reload
    @subcategory.reload
    @subcategory2.reload

    expect(@category.custom_fields.count).to eq(1)
    expect(@subcategory.custom_fields.count).to eq(1)
    expect(@subcategory2.custom_fields.count).to eq(1)
  end

  def include_by_id?(xs, model)
    xs.find { |x| x.id == model.id }
  end

  describe "#move_custom_fields" do

    it "removing moves custom fields to new category" 


    it "removing moves custom fields from subcategories to new category" 


    it "moving custom fields does not create duplicates" 

  end

  describe "#merge_targets_for" do

      def add_child(parent, child)
        parent.children << child
      end

      # Create following category structure:
      #
      # Category A
      # - Subcategory A1
      # Category B
      # Category C
      # - Subcategory C1
      # - Subcategory C2
      before(:each) do
        @a = FactoryGirl.create(:category)
        @a1 = FactoryGirl.create(:category)
        @b = FactoryGirl.create(:category)
        @c = FactoryGirl.create(:category)
        @c1 = FactoryGirl.create(:category)
        @c2 = FactoryGirl.create(:category)
        add_child(@a, @a1)
        add_child(@c, @c1)
        add_child(@c, @c2)

        @categories = [@a, @a1, @b, @c, @c1, @c2]
      end

      # Merge targets for:
      # A  => B, C1, C2
      # A1 => A, B, C1, C2
      # B  => A1, C1, C2
      # C  => A1, B
      # C1 => A1, B, C2
      # C2 => A1, B, C1
      it "finds possible merge targets for category to be removed" 

  end
end

