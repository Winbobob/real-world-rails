$LOAD_PATH << Rails.root.join("tools").to_s

require 'copy_reports_structure/report_structure'

describe ReportStructure do
  let(:group_name) { "SourceGroup" }
  let(:settings) { {"reports_menus" => [["Configuration Management", ["Virtual Machines", ["Vendor and Type"]]]]} }
  let(:role)  { FactoryGirl.create(:miq_user_role) }
  let(:source_group) {  FactoryGirl.create(:miq_group, :settings => settings) }
  let(:destination_group) { FactoryGirl.create(:miq_group, :miq_user_role => role) }

  context "copy reports structure" do
    describe ".duplicate_for_group" do
      it "copies reports structure from one group to another" 


      it "does not copy reports structure if dry_run is set to true" 


      it "does not change reports structure on destination group is source group not found" 

    end

    describe ".duplicate_for_role" do
      before do
        @destination_group2 = FactoryGirl.create(:miq_group, :miq_user_role => destination_group.miq_user_role)
      end

      it "copies reports structure from one group to role (to all groups having that role)" 


      it "does not copy reports structure if dry_run is set to true" 


      it "does not change reports structure on group with destination role is source group not found" 

    end
  end

  context "reset reports structure" do
    describe ".reset_for_group" do
      it "reset report structure to default for group" 

    end

    describe ".reset_for_role" do
      before do
        source_group.update(:miq_user_role => role)
        destination_group.update(:settings => settings)
      end

      it "reset reports structure to default for role" 


      it "does not reset reports if dry_run is set to true" 

    end
  end
end

