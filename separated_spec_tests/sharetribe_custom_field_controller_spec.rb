require 'spec_helper'

describe Admin::CustomFieldsController, type: :controller do
  describe "#destroy" do
    def create_custom_field_for(community)
      custom_field_count = community.custom_fields.count
      expect(community.custom_fields.count).to eql(0)
      custom_field = FactoryGirl.create(:custom_dropdown_field)
      community.categories << custom_field.category_custom_fields.first.category
      community.custom_fields << custom_field
      community.save!
      expect(community.custom_fields.count).to eql(custom_field_count + 1)
      return custom_field
    end

    before(:each) do
      @community = FactoryGirl.create(:community)
      @another_community = FactoryGirl.create(:community)

      @request.host = "#{@community.ident}.lvh.me"
      @request.env[:current_marketplace] = @community

      @person = create_admin_for(@community)
      sign_in_for_spec(@person)
    end

    it "should be allowed to remove a field that belongs to current community" 


    it "should not allow removal of a field that doesn't belong to current community" 

  end
end

