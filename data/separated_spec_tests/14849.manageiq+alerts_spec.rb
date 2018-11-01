describe TaskHelpers::Imports::Alerts do
  let(:data_dir)       { File.join(File.expand_path(__dir__), 'data', 'alerts') }
  let(:alert_file)     { 'Alert_Import_Test.yaml' }
  let(:bad_alert_file) { 'Bad_Alert_Import_Test.yml' }
  let(:alert_one_guid) { "4aa73d36-23b6-11e7-a475-02420ebf1c88" }
  let(:alert_two_guid) { "d2dcbbf8-25fb-11e7-a475-02420ebf1c88" }

  it 'should import all .yaml files in a specified directory' 


  it 'should import a specified alert export file' 


  it 'should fail to import a specified alert file' 


  def assert_test_alert_one_present
    a = MiqAlert.find_by(:guid => alert_one_guid)
    expect(a.description).to eq("Alert Import Test")
    expect(a.responds_to_events).to eq("vm_perf_complete")
    expect(a.enabled).to be true
  end

  def assert_test_alert_two_present
    a = MiqAlert.find_by(:guid => alert_two_guid)
    expect(a.description).to eq("Alert Import Test 2")
    expect(a.responds_to_events).to eq("host_perf_complete")
    expect(a.enabled).to be true
  end
end

