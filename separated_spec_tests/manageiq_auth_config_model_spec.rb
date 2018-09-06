$LOAD_PATH << Rails.root.join("tools").to_s

require "fix_auth/auth_model"
require "fix_auth/auth_config_model"
require "fix_auth/models"

describe FixAuth::AuthConfigModel do
  let(:v1_key)  { MiqPassword.generate_symmetric }
  let(:pass)    { "password" }
  let(:enc_v1)  { MiqPassword.new.encrypt(pass, "v1", v1_key) }

  before do
    MiqPassword.add_legacy_key(v1_key, :v1)
  end

  after do
    MiqPassword.clear_keys
  end

  context "#requests" do
    subject { FixAuth::FixMiqRequest }
    let(:request) do
      subject.create(
        :type    => 'MiqProvisionRequest',
        :options => YAML.dump(
          :dialog                  => {
            :'password::special' => enc_v1,
          },
          :root_password           => enc_v1,
          :sysprep_password        => enc_v1,
          :sysprep_domain_password => enc_v1
        )
      )
    end

    it "upgrades request (find with prefix, dont stringify keys)" 

  end

  context "#request_tasks" do
    subject { FixAuth::FixMiqRequestTask }
    let(:request) do
      subject.create(
        :type    => 'MiqProvisionRequest',
        :options => YAML.dump(
          :dialog                  => {
            :'password::special' => enc_v1,
          },
          :root_password           => enc_v1,
          :sysprep_password        => enc_v1,
          :sysprep_domain_password => enc_v1
        )
      )
    end

    it "upgrades request (find with prefix, dont stringify keys)" 

  end
end

