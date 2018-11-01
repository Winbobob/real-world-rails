describe TaskHelpers::Exports::ProvisionDialogs do
  let(:dialog_name1) { "default_dialog" }
  let(:dialog_name2) { "custom_dialog" }
  let(:dialog_desc1) { "Default Provisioning Dialog" }
  let(:dialog_desc2) { "Custom Provisioning Dialog" }
  let(:dialog_type1) { "MiqProvisionWorkflow" }
  let(:dialog_type2) { "MiqProvisionWorkflow" }
  let(:dialog_type3) { "VmMigrateWorkflow" }

  let(:content) do
    {
      :dialogs => {
        :hardware => {
          :description => "Hardware",
          :fields      => {
            :disk_format => {
              :description => "Disk Format",
              :required    => false,
              :display     => :edit,
              :default     => "unchanged",
              :data_type   => :string,
              :values      => {
                :thick => "Thick",
                :thin  => "Thin"
              }
            },
            :cpu_limit   => {
              :description   => "CPU (MHz)",
              :required      => false,
              :notes         => "(-1 = Unlimited)",
              :display       => :edit,
              :data_type     => :integer,
              :notes_display => :show
            }
          }
        }
      }
    }
  end

  let(:content2) do
    {
      :dialogs => {
        :buttons => %i(submit cancel)
      }
    }
  end

  let(:export_dir) do
    Dir.mktmpdir('miq_exp_dir')
  end

  before do
    FactoryGirl.create(:miq_dialog,
                       :dialog_type => dialog_type1,
                       :name        => dialog_name1,
                       :description => dialog_desc1,
                       :content     => content,
                       :default     => true)

    FactoryGirl.create(:miq_dialog,
                       :dialog_type => dialog_type2,
                       :name        => dialog_name2,
                       :description => dialog_desc2,
                       :content     => content,
                       :default     => false)
  end

  after do
    FileUtils.remove_entry export_dir
  end

  describe "when --all is not specified" do
    let(:dialog_filename1) { "#{export_dir}/#{dialog_type1}-custom_dialog.yaml" }
    let(:dialog_filename2) { "#{export_dir}/#{dialog_type3}-custom_dialog.yaml" }

    it 'exports user provision dialogs to a given directory' 

  end

  describe "when --all is specified" do
    let(:dialog_filename1) { "#{export_dir}/#{dialog_type1}-default_dialog.yaml" }
    let(:dialog_filename2) { "#{export_dir}/#{dialog_type1}-custom_dialog.yaml" }

    it 'exports all provision dialogs to a given directory' 

  end

  describe "when multiple dialogs of different types have the same name" do
    let(:dialog_filename1) { "#{export_dir}/#{dialog_type1}-custom_dialog.yaml" }
    let(:dialog_filename2) { "#{export_dir}/#{dialog_type3}-custom_dialog.yaml" }

    before do
      FactoryGirl.create(:miq_dialog,
                         :dialog_type => dialog_type3,
                         :name        => dialog_name2,
                         :description => dialog_desc2,
                         :content     => content2,
                         :default     => false)
    end

    it 'exports the dialogs to different files' 

  end
end

