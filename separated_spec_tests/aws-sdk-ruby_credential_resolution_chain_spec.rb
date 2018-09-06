require 'spec_helper'

module Aws
  describe "Credential Resolution Chain" do

    let(:mock_credential_file) {
      File.expand_path(File.join(File.dirname(__FILE__),
        '..', 'fixtures', 'credentials', 'mock_shared_credentials'))
    }

    let(:mock_config_file) {
      File.expand_path(File.join(File.dirname(__FILE__),
        '..', 'fixtures', 'credentials', 'mock_shared_config'))
    }

    describe "default behavior" do
      before(:each) do
        stub_const('ENV', {})
        # AWS_SDK_CONFIG_OPT_OUT not present
        Aws.shared_config.fresh(
          config_enabled: true,
          credentials_path: mock_credential_file,
          config_path: mock_config_file
        )
      end

      it 'prefers direct credentials above other sources' 


      it 'prefers ENV credentials over assume role and shared config' 


      it 'prefers assume role over shared config' 


      it 'prefers shared credential file static credentials over shared config' 


      it 'will source static credentials from shared config after shared credentials' 


      it 'attempts to fetch metadata credentials last' 


      describe 'Assume Role Resolution' do
        it 'will not assume a role without a source present' 


        it 'will explicitly raise if source_profile is present but invalid' 


        it 'will explicitly raise if credential_source is present but invalid' 


        it 'will explicitly raise if source_profile and credential_source both present' 


        it 'will assume a role from shared credentials before shared config' 


        it 'will then try to assume a role from shared config' 


        it 'will assume a role from config using source credentials in shared credentials' 

      end

      it 'can assume a role with EC2 Instance Metadata as a source' 


      it 'can assume a role with ECS Credentials as a source' 

    end

    describe "AWS_SDK_CONFIG_OPT_OUT set" do
      before(:each) do
        stub_const('ENV', {})
        Aws.shared_config.fresh(
          config_enabled: false,
          credentials_path: mock_credential_file,
          # The config file exists but should not be used.
          config_path: mock_config_file
        )
      end

      it 'prefers direct credentials above other sources' 


      it 'prefers ENV credentials over shared config' 


      it 'will not load credentials from shared config' 


      it 'will not attempt to assume a role' 


      it 'attempts to fetch metadata credentials last' 

    end

    def assume_role_stub(role_arn, input_access_key, access_key, secret_key, token)
      stub_request(:post, "https://sts.amazonaws.com/").
        with(headers: { "authorization" => /Credential=#{input_access_key}/ }).
        to_return(body: <<-RESP)
<AssumeRoleResponse xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
  <AssumeRoleResult>
    <AssumedRoleUser>
      <Arn>#{role_arn}</Arn>
      <AssumedRoleId>ASSUMEROLEID:session</AssumedRoleId>
    </AssumedRoleUser>
    <Credentials>
      <AccessKeyId>#{access_key}</AccessKeyId>
      <SecretAccessKey>#{secret_key}</SecretAccessKey>
      <SessionToken>#{token}</SessionToken>
      <Expiration>#{(Time.now + 3600).utc.iso8601}</Expiration>
    </Credentials>
  </AssumeRoleResult>
  <ResponseMetadata>
    <RequestId>MyStubRequest</RequestId>
  </ResponseMetadata>
</AssumeRoleResponse>
        RESP
    end
  end
end

