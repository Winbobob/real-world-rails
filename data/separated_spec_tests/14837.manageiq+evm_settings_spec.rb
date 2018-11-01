require "rake"

describe "EvmSettings", :type => :rake_task do
  let(:task_path) { "lib/tasks/evm_settings" }
  let(:keys) { ["/authentication/sso_enabled", "/authentication/saml_enabled", "/authentication/oidc_enabled", "/authentication/local_login_disabled"] }

  describe ".get_keys" do
    context "gets the current keys" do
      it "when provider_type is none" 


      it "when provider_type is oidc" 


      it "when provider_type is saml" 

    end
  end
end

