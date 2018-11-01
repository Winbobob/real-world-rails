describe TaskHelpers::Imports::CustomizationTemplates do
  describe "#import" do
    let(:data_dir) { File.join(File.expand_path(__dir__), 'data', 'customization_templates') }
    let(:ct_file) { "existing_ct_and_pit.yaml" }
    let(:ct_name) { "Basic root pass template" }
    let(:ct_desc) { "This template takes use of rootpassword defined in the UI" }
    let(:existing_pit_name) { "RHEL-6" }
    let(:new_pit_name) { "RHEL-7" }
    let(:new_pit_pt) { "vm" }
    let(:options) { { :source => source } }

    describe "when the source is a directory" do
      let(:source) { data_dir }

      it 'imports all .yaml files in a specified directory' 

    end

    describe "when the source is a file" do
      let(:source) { "#{data_dir}/#{ct_file}" }

      it 'imports a specified file' 

    end

    describe "when the source file modifies an existing file" do
      let(:update_file) { "update_existing.yml" }
      let(:source) { "#{data_dir}/#{update_file}" }

      before do
        TaskHelpers::Imports::CustomizationTemplates.new.import(:source => "#{data_dir}/#{ct_file}")
      end

      it 'modifies an existing customization template' 

    end

    describe "when the source file has invalid settings" do
      describe "when :system is true" do
        let(:ct_system_file) { "system_ct.yml" }
        let(:source) { "#{data_dir}/#{ct_system_file}" }

        it 'fails to import' 

      end

      describe "when there is no :pxe_image_type[:name]" do
        let(:no_pit_name_file) { "no_pit_name.yml" }
        let(:source) { "#{data_dir}/#{no_pit_name_file}" }

        it 'fails to import' 

      end

      describe "when the :pxe_image_type[:provision_type] is invalid" do
        let(:invalid_pt_file) { "invalid_pit_pt.yml" }
        let(:source) { "#{data_dir}/#{invalid_pt_file}" }

        it 'fails to import' 

      end

      describe "when the :pxe_image_type[:name] is found with a different provision_type"
      let(:diff_pt_file) { "pit_existing_name_new_pt.yml" }
      let(:source) { "#{data_dir}/#{diff_pt_file}" }

      before do
        PxeImageType.create(:name => existing_pit_name)
      end

      it 'fails to import' 

    end
  end

  def assert_test_ct_one_present(pit)
    custom_template = CustomizationTemplate.find_by(:name => ct_name, :pxe_image_type => pit)
    expect(custom_template.description).to eq(ct_desc)
    expect(custom_template.pxe_image_type).to eq(pit)
  end

  def assert_test_ct_two_present
    pit             = PxeImageType.find_by(:name => new_pit_name, :provision_type => new_pit_pt)
    custom_template = CustomizationTemplate.find_by(:name => ct_name, :pxe_image_type => pit)
    expect(custom_template.description).to eq(ct_desc)
    expect(custom_template.pxe_image_type).to eq(pit)
  end

  def assert_test_ct_one_modified
    pit             = PxeImageType.find_by(:name => existing_pit_name)
    custom_template = CustomizationTemplate.find_by(:name => ct_name, :pxe_image_type => pit)
    expect(custom_template.description).to include("updated")
    expect(custom_template.script).to include("This line added")
  end
end

