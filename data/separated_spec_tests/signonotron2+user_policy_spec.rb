require 'rails_helper'

describe UserPolicy do
  subject { described_class }
  let(:parent_organisation)         { create(:organisation) }
  let(:child_organisation)          { create(:organisation, parent: parent_organisation) }
  let(:super_org_admin)             { create(:super_org_admin, organisation: parent_organisation) }
  let(:organisation_admin)          { create(:organisation_admin, organisation: parent_organisation) }

  primary_management_actions = %i[new? assign_organisations?]
  user_management_actions = %i[edit? create? update? unlock? suspension? cancel_email_change? resend_email_change? event_logs?]
  self_management_actions = %i[edit_email_or_password? update_email? update_password? cancel_email_change? resend_email_change?]
  disallowed_actions_org_admin = %i[create? assign_organisations?]
  disallowed_actions_super_org_admin = %i[create? assign_organisations?]

  org_admin_actions = user_management_actions - disallowed_actions_org_admin
  super_org_admin_actions = user_management_actions - disallowed_actions_super_org_admin
  admin_actions = user_management_actions - self_management_actions
  superadmin_actions = %i[assign_role? flag_2sv? reset_2sv?]

  context "for superadmins" do
    permissions :index? do
      it "is allowed for superadmins" 

    end

    primary_management_actions.each do |permission|
      permissions permission do
        it "is allowed for superadmins" 

      end
    end

    user_management_actions.each do |permission_name|
      permissions permission_name do
        it "is allowed for superadmins accessing any type of user" 

      end
    end

    superadmin_actions.each do |permission_name|
      permissions permission_name do
        it "is allowed only for superadmins" 

      end
    end
  end

  context "for admins" do
    permissions :index? do
      it "is allowed for admins" 

    end

    primary_management_actions.each do |permission|
      permissions permission do
        it "is allowed for admins" 

      end
    end

    user_management_actions.each do |permission_name|
      permissions permission_name do
        it "is allowed for admins accessing users with equal or fewer priviledges" 

      end
    end

    superadmin_actions.each do |permission_name|
      permissions permission_name do
        it "is forbidden for admins" 

      end
    end
  end

  context "for super organisation admins" do
    permissions :index? do
      it "is allowed for super organisation admins" 

    end

    primary_management_actions.each do |permission|
      permissions permission do
        it "is forbidden for super organisation admins" 

      end
    end

    disallowed_actions_super_org_admin.each do |disallowed_super_org_admin_permission|
      permissions disallowed_super_org_admin_permission do
        it "is forbidden for super organisation admins to create any type of user or assign organisations to them" 

      end
    end

    super_org_admin_actions.each do |allowed_super_org_admin_permission|
      permissions allowed_super_org_admin_permission do
        it "is allowed for super organisation admins to access users of similar permissions or below from within their own organisation" 


        it "is allowed for super organisation admins to access users of similar permissions or below from within their own organisation's subtree" 


        it "is forbidden for super organisation admins to access users from other organisations" 

      end
    end

    superadmin_actions.each do |permission_name|
      permissions permission_name do
        it "is forbidden for super organisation admins" 

      end
    end
  end

  context "for organisation admins" do
    permissions :index? do
      it "is allowed for organisation admins" 

    end

    primary_management_actions.each do |permission|
      permissions permission do
        it "is forbidden for organisation admins" 

      end
    end

    disallowed_actions_org_admin.each do |disallowed_org_admin_permission|
      permissions disallowed_org_admin_permission do
        it "is forbidden for organisation admins to create any type of user or assign organisations to them" 

      end
    end

    org_admin_actions.each do |allowed_org_admin_permission|
      permissions allowed_org_admin_permission do
        it "is forbidden for organisation admins to access users of similar permissions or below from within their own organisation" 


        it "is allowed for organisation admins to access users from within their own organisation's subtree" 


        it "is forbidden for organisation admins to access users from other organisations" 

      end
    end

    superadmin_actions.each do |permission_name|
      permissions permission_name do
        it "is forbidden for organisation admins" 

      end
    end
  end

  context "for normal users" do
    permissions :index? do
      it "is forbidden for normal users" 

    end

    primary_management_actions.each do |permission|
      permissions permission do
        it "is forbidden for normal users" 

      end
    end

    user_management_actions.each do |permission_name|
      permissions permission_name do
        it "is forbidden for normal users accessing other normal users" 

      end
    end

    self_management_actions.each do |permission_name|
      permissions permission_name do
        it "is allowed for normal users accessing their own record" 

      end
    end

    superadmin_actions.each do |permission_name|
      permissions permission_name do
        it "is forbidden for normal users" 

      end
    end

    # Users shouldn't be able to do admin-only things to themselves
    admin_actions.each do |permission_name|
      permissions permission_name do
        it "is not allowed for normal users accessing their own record" 

      end
    end
  end

  describe described_class::Scope do
    let(:parent_organisation) { create(:organisation) }
    let(:child_organisation) { create(:organisation, parent: parent_organisation) }
    let(:other_organisation) { create(:organisation) }

    let!(:super_admin_in_org) { create(:superadmin_user, organisation: parent_organisation) }
    let!(:admin_in_org) { create(:admin_user, organisation: parent_organisation) }
    let!(:super_org_admin_in_org) { create(:super_org_admin, organisation: parent_organisation) }
    let!(:org_admin_in_org) { create(:organisation_admin, organisation: parent_organisation) }
    let!(:normal_user_in_org) { create(:user_in_organisation, organisation: parent_organisation) }

    let!(:super_admin_in_child_org) { create(:superadmin_user, organisation: child_organisation) }
    let!(:admin_in_child_org) { create(:admin_user, organisation: child_organisation) }
    let!(:super_org_admin_in_child_org) { create(:super_org_admin, organisation: child_organisation) }
    let!(:org_admin_in_child_org) { create(:organisation_admin, organisation: child_organisation) }
    let!(:normal_user_in_child_org) { create(:user_in_organisation, organisation: child_organisation) }

    let!(:super_admin_in_other_org) { create(:superadmin_user, organisation: other_organisation) }
    let!(:admin_in_other_org) { create(:admin_user, organisation: other_organisation) }
    let!(:super_org_admin_in_other_org) { create(:super_org_admin, organisation: other_organisation) }
    let!(:org_admin_in_other_org) { create(:organisation_admin, organisation: other_organisation) }
    let!(:normal_user_in_other_org) { create(:user_in_organisation, organisation: other_organisation) }

    let!(:api_user) { create(:api_user) }

    subject { described_class.new(user, User.all) }
    let(:resolved_scope) { subject.resolve }

    context 'for super admins' do
      let(:user) { create(:superadmin_user) }

      it 'includes all web users' 


      it 'does not include api users' 

    end

    context 'for admins' do
      let(:user) { create(:admin_user) }

      it 'includes all web users of similar permissions or below belonging to their organisation' 


      it 'includes all web users of similar permissions or below belonging to a child organisation' 


      it 'includes all web users of similar permissions or below belonging to another organisation' 


      it 'does not include api users' 

    end

    context 'for super organisation admins' do
      let(:user) { create(:super_org_admin, organisation: parent_organisation) }

      it 'includes users of similar permission or below belonging to their organisation' 


      it 'includes users of similar permission or below belonging to a child organisation' 


      it 'does not include users of similar permission or below belonging to another organisation' 


      it 'does not include api users' 

    end

    context 'for organisation admins' do
      let(:user) { create(:organisation_admin, organisation: parent_organisation) }

      it 'includes users of similar permission or below belonging to their organisation' 


      it 'does not include users of similar permission or below belonging to a child organisation' 


      it 'does not include users of similar permission or below belonging to another organisation' 


      it 'does not include api users' 

    end

    context 'for normal users' do
      let(:user) { create(:user) }

      it 'is empty' 

    end
  end
end

