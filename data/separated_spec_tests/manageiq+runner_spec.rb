describe Ansible::Runner do
  let(:uuid)       { "201ac780-7bf4-0136-3b9e-54e1ad8b3cf4" }
  let(:env_vars)   { {"ENV1" => "VAL1", "ENV2" => "VAL2"} }
  let(:extra_vars) { {"id" => uuid} }

  describe ".run" do
    let(:playbook) { "/path/to/my/playbook" }
    before { expect(File).to receive(:exist?).with(playbook).and_return(true) }

    it "calls launch with expected arguments" 


    context "with special characters" do
      let(:env_vars) { {"ENV1" => "pa$%w0rd!'"} }
      let(:extra_vars) { {"name" => "john's server"} }

      it "calls launch with expected arguments" 

    end
  end

  describe ".run_async" do
    let(:playbook) { "/path/to/my/playbook" }
    before { expect(File).to receive(:exist?).with(playbook).and_return(true) }

    it "calls ansible-runner with start" 

  end

  describe ".run_queue" do
    let(:playbook) { "/path/to/my/playbook" }
    let(:zone)     { FactoryGirl.create(:zone) }
    let(:user)     { FactoryGirl.create(:user) }

    it "queues Ansible::Runner.run in the right zone" 

  end

  describe ".run_role" do
    let(:role_name) { "my-custom-role" }
    let(:role_path) { "/path/to/my/roles" }
    before { expect(File).to receive(:exist?).with(File.join(role_path)).and_return(true) }

    it "runs ansible-runner with the role" 

  end

  describe ".run_role_async" do
    let(:role_name) { "my-custom-role" }
    let(:role_path) { "/path/to/my/roles" }
    before { expect(File).to receive(:exist?).with(File.join(role_path)).and_return(true) }

    it "runs ansible-runner with the role" 

  end

  describe ".run_role_queue" do
    let(:role_name) { "my-custom-role" }
    let(:role_path) { "/path/to/my/roles" }
    let(:zone)      { FactoryGirl.create(:zone) }
    let(:user)      { FactoryGirl.create(:user) }

    it "queues Ansible::Runner.run in the right zone" 

  end
end

