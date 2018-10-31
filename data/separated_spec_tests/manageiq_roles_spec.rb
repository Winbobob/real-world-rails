describe TaskHelpers::Exports::Roles do
  let(:role_test_export) do
    [{"name"                => "Test Role",
      "read_only"           => false,
      "settings"            => nil,
      "feature_identifiers" => ["about"]}]
  end

  let(:role_super_export) do
    [{"name"                => "EvmRole-super_administrator",
      "read_only"           => true,
      "settings"            => nil,
      "feature_identifiers" => []}]
  end

  let(:export_dir) do
    Dir.mktmpdir('miq_exp_dir')
  end

  before do
    FactoryGirl.create(:miq_user_role, :name => "Test Role", :features => "about")
    FactoryGirl.create(:miq_user_role, :role => "super_administrator")
  end

  after do
    FileUtils.remove_entry export_dir
  end

  it 'exports user roles to a given directory' 


  it 'exports all roles to a given directory' 

end

