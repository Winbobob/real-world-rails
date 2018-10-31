$LOAD_PATH << Rails.root.join("tools").to_s

require "fix_auth/auth_model"
require "fix_auth/auth_config_model"
require "fix_auth/models"

describe FixAuth::AuthModel do
  let(:v0_key)  { MiqPassword::Key.new("AES-128-CBC", Base64.encode64("9999999999999999"), Base64.encode64("5555555555555555")) }
  let(:v1_key)  { MiqPassword.generate_symmetric }
  let(:pass)    { "password" }
  let(:enc_v1)  { MiqPassword.new.encrypt(pass, "v1", v1_key) }
  let(:enc_v2)  { MiqPassword.new.encrypt(pass) }
  let(:bad_v2)  { "v2:{5555555555555555555555==}" }
  let(:enc_leg) { v0_key.encrypt64(pass) }

  before do
    MiqPassword.add_legacy_key(v0_key, :v0)
    MiqPassword.add_legacy_key(v1_key, :v1)
  end

  after do
    MiqPassword.clear_keys
  end

  context "#authentications" do
    subject { FixAuth::FixAuthentication }
    let(:contenders) { subject.contenders.collect(&:name) }
    let(:v1_v2)  { subject.create(:name => "v2_v1", :password => enc_v2, :auth_key => enc_v1) }
    let(:v2_v1)  { subject.create(:name => "v1_v2", :password => enc_v1, :auth_key => enc_v2) }
    let(:v1)     { subject.create(:name => "v1", :password => enc_v1) }
    let(:v2)     { subject.create(:name => "v2", :password => enc_v2) }
    let(:badv2)  { subject.create(:name => "badv2", :password => bad_v2) }
    let(:leg)    { subject.create(:name => "lg", :password => enc_leg) }
    let(:nls)    { subject.create(:name => "nls") }
    let(:not_c)  { subject.create(:name => "notc", :password => "nope") }

    it "should read column_names" 


    it "should determine available_columns" 


    it "should limit available_columns when not all columns are available" 


    it "should build selection criteria (non selects)" 


    it "should not find empty records" 


    it "should find records with encrypted passwords" 


    it "should find viable records among mixed mode records" 


    context "#recrypt" do
      it "should not upgrade blank column" 


      it "should upgrade legacy columns" 


      it "should upgrade v1 columns" 


      it "should skip over non-encrypted columns" 


      it "should raise exception for bad encryption" 


      it "should replace for bad encryption" 

    end

    context "#hardcode" do
      it "should upgrade legacy columns" 


      it "should upgrade v2 columns" 

    end
  end

  context "#miq_database" do
    subject { FixAuth::FixMiqDatabase }
    let(:v1)  { subject.create(:session_secret_token => enc_v1) }
    let(:v2)  { subject.create(:session_secret_token => enc_v2) }
    let(:bad) { subject.create(:session_secret_token => bad_v2) }

    it "uses random numbers for hardcode" 


    it "uses random numbers for invalid" 


    it "upgrades" 

  end

  context "#miq_ae_values" do
    subject { FixAuth::FixMiqAeValue }

    let(:pass_field) { FixAuth::FixMiqAeField.new(:name => "pass", :datatype => "password") }
    let(:v1) { subject.create(:field => pass_field, :value => enc_v1) }

    it "should update with complex contenders" 

  end

  context "#settings_change" do
    subject { FixAuth::FixSettingsChange }
    let(:v1)  { subject.create(:key => "/v1/password", :value => enc_v1) }
    let(:v2)  { subject.create(:key => "/v2/password", :value => enc_v2) }
    let(:bad) { subject.create(:key => "/bad/password", :value => bad_v2) }

    it "with hardcode" 


    it "with invalid" 


    it "upgrades" 

  end
end

