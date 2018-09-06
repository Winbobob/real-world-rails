require 'rails_helper'

describe OrganisationPolicy do
  subject { described_class }

  permissions :index? do
    it "is forbidden to super organisation admins, organisation admins and normal users" 

  end

  permissions :can_assign? do
    it "allows superadmins and admins to assign a user to any organisation" 


    it "is forbidden for super organisation admins" 


    it "is forbidden for organisation admins" 

  end

  describe described_class::Scope do
    let!(:parent_organisation) { create(:organisation) }
    let!(:child_organisation_one) { create(:organisation, parent: parent_organisation) }
    let!(:child_organisation_two) { create(:organisation, parent: parent_organisation) }
    let!(:grandchild_organisation_one) { create(:organisation, parent: child_organisation_one) }
    let!(:second_parent_organisation) { create(:organisation) }
    let!(:child_second_organisation) { create(:organisation, parent: second_parent_organisation) }
    subject { described_class.new(user, Organisation.all) }
    let(:resolved_scope) { subject.resolve }

    context 'for super admins' do
      let(:user) { create(:superadmin_user) }

      it 'includes all organisations' 

    end

    context 'for admins' do
      let(:user) { create(:admin_user) }

      it 'includes all organisations' 

    end

    context 'for super organisation admins' do
      let(:user) { create(:super_org_admin, organisation: parent_organisation) }

      it 'is empty' 

    end

    context 'for organisation admins' do
      let(:user) { create(:organisation_admin, organisation: parent_organisation) }

      it 'is empty' 

    end

    context 'for normal users' do
      let(:user) { create(:user) }

      it 'is empty' 

    end
  end
end

