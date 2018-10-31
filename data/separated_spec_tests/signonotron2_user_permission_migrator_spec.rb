require 'rails_helper'

RSpec.describe UserPermissionMigrator do
  let(:specialist_publisher) { FactoryBot.create(:application, name: "Specialist Publisher") }
  let(:manuals_publisher) { FactoryBot.create(:application, name: "Manuals Publisher") }
  let(:unrelated_application) { FactoryBot.create(:application, name: "unrelated application") }

  before do
    FactoryBot.create(:supported_permission, application: specialist_publisher, name: "gds_editor")
    FactoryBot.create(:supported_permission, application: specialist_publisher, name: "editor")

    FactoryBot.create(:supported_permission, application: manuals_publisher, name: "gds_editor")
    FactoryBot.create(:supported_permission, application: manuals_publisher, name: "editor")

    FactoryBot.create(:supported_permission, application: unrelated_application, name: "gds_editor")
    FactoryBot.create(:supported_permission, application: unrelated_application, name: "editor")
  end

  let!(:gds_editor) { FactoryBot.create(:user, with_permissions: { "Specialist Publisher" => %w(editor gds_editor signin) }) }
  let!(:editor) { FactoryBot.create(:user, with_permissions: { "Specialist Publisher" => %w(editor signin) }) }
  let!(:writer) { FactoryBot.create(:user, with_permissions: { "Specialist Publisher" => %w(signin) }) }
  let!(:user_without_access) { FactoryBot.create(:user) }
  let!(:user_with_unrelated_access) { FactoryBot.create(:user, with_permissions: { "unrelated application" => %w(editor gds_editor signin) }) }

  it "copies permissions over for all users of an application to another application" 

end

