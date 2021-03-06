describe TaskHelpers::Exports::Tags do
  let(:parent)      { FactoryGirl.create(:classification, :name => "export_test_category",   :description => "Export Test") }
  let(:def_parent)  { FactoryGirl.create(:classification, :name => "default_test_category",  :description => "Default Export Test",   :default => true) }
  let(:def_parent2) { FactoryGirl.create(:classification, :name => "default_test2_category", :description => "Default Export Test 2", :default => true) }
  let(:export_dir)  { Dir.mktmpdir('miq_exp_dir') }

  let(:tag_export_test) do
    [{"description"  => "Export Test",
      "icon"         => nil,
      "read_only"    => false,
      "syntax"       => "string",
      "single_value" => false,
      "example_text" => nil,
      "parent_id"    => 0,
      "show"         => true,
      "default"      => nil,
      "perf_by_tag"  => nil,
      "name"         => "export_test_category",
      "entries"      => [{"description"  => "Test Entry",
                          "icon"         => nil,
                          "read_only"    => false,
                          "syntax"       => "string",
                          "single_value" => false,
                          "example_text" => nil,
                          "show"         => true,
                          "default"      => nil,
                          "perf_by_tag"  => nil,
                          "name"         => "test_entry"},
                         {"description"  => "Another Test Entry",
                          "icon"         => nil,
                          "read_only"    => false,
                          "syntax"       => "string",
                          "single_value" => false,
                          "example_text" => nil,
                          "show"         => true,
                          "default"      => nil,
                          "perf_by_tag"  => nil,
                          "name"         => "another_test_entry"}]}]
  end

  let(:tag_default_export_test) do
    [{"description"  => "Default Export Test",
      "icon"         => nil,
      "read_only"    => false,
      "syntax"       => "string",
      "single_value" => false,
      "example_text" => nil,
      "parent_id"    => 0,
      "show"         => true,
      "default"      => true,
      "perf_by_tag"  => nil,
      "name"         => "default_test_category",
      "entries"      => [{"description"  => "Default Test Entry",
                          "icon"         => nil,
                          "read_only"    => false,
                          "syntax"       => "string",
                          "single_value" => false,
                          "example_text" => nil,
                          "show"         => true,
                          "default"      => true,
                          "perf_by_tag"  => nil,
                          "name"         => "def_test_entry"}]}]
  end

  let(:tag_default_export_test_2) do
    [{"description"  => "Default Export Test 2",
      "icon"         => nil,
      "read_only"    => false,
      "syntax"       => "string",
      "single_value" => false,
      "example_text" => nil,
      "parent_id"    => 0,
      "show"         => true,
      "default"      => true,
      "perf_by_tag"  => nil,
      "name"         => "default_test2_category",
      "entries"      => [{"description"  => "Default Test Entry 2",
                          "icon"         => nil,
                          "read_only"    => false,
                          "syntax"       => "string",
                          "single_value" => false,
                          "example_text" => nil,
                          "show"         => true,
                          "default"      => true,
                          "perf_by_tag"  => nil,
                          "name"         => "def_test_entry_2"},
                         {"description"  => "Default Test Entry 3",
                          "icon"         => nil,
                          "read_only"    => false,
                          "syntax"       => "string",
                          "single_value" => false,
                          "example_text" => nil,
                          "show"         => true,
                          "default"      => nil,
                          "perf_by_tag"  => nil,
                          "name"         => "def_test_entry_3"}]}]
  end

  before do
    FactoryGirl.create(:classification_tag, :name => "test_entry",         :description => "Test Entry",           :parent => parent)
    FactoryGirl.create(:classification_tag, :name => "another_test_entry", :description => "Another Test Entry",   :parent => parent)
    FactoryGirl.create(:classification_tag, :name => "def_test_entry",     :description => "Default Test Entry",   :parent => def_parent,  :default => true)
    FactoryGirl.create(:classification_tag, :name => "def_test_entry_2",   :description => "Default Test Entry 2", :parent => def_parent2, :default => true)
    FactoryGirl.create(:classification_tag, :name => "def_test_entry_3",   :description => "Default Test Entry 3", :parent => def_parent2)
  end

  after do
    FileUtils.remove_entry export_dir
  end

  it 'exports user tags to a given directory' 


  it 'exports all tags to a given directory' 

end

