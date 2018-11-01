describe TaskHelpers::Imports::AlertSets do
  let(:data_dir)           { File.join(File.expand_path(__dir__), 'data', 'alert_sets') }
  let(:alert_set_file)     { 'Alert_Profile_VM_Import_Test.yaml' }
  let(:bad_alert_set_file) { 'Bad_Alert_Profile_Host_Import_Test.yml' }
  let(:alert_set_one_guid) { "6917eab2-2605-11e7-a475-02420ebf1c88" }
  let(:alert_set_two_guid) { "a16168b2-2605-11e7-a475-02420ebf1c88" }

  it 'should import all .yaml files in a specified directory' 


  it 'should import a specified alert export file' 


  it 'should fail to import a specified alert file' 


  def assert_test_alert_set_one_present
    a = MiqAlertSet.find_by(:guid => alert_set_one_guid)
    expect(a.description).to eq("Alert Profile VM Import Test")
    expect(a.mode).to eq("Vm")
    b = a.miq_alerts.first
    expect(b.guid).to eq("4aa73d36-23b6-11e7-a475-02420ebf1c88")
    expect(b.description).to eq("Alert Import Test")
    expect(b.enabled).to be true
  end

  def assert_test_alert_set_two_present
    a = MiqAlertSet.find_by(:guid => alert_set_two_guid)
    expect(a.description).to eq("Alert Profile Host Import Test")
    expect(a.mode).to eq("Host")
    b = a.miq_alerts.first
    expect(b.guid).to eq("d2dcbbf8-25fb-11e7-a475-02420ebf1c88")
    expect(b.description).to eq("Alert Import Test 2")
    expect(b.enabled).to be true
  end
end

