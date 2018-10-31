require 'spec_helper'

describe PaypalService::API::Accounts do

  APIDataTypes = PaypalService::API::DataTypes

  ## API Operations (with default test data)
  def request_personal_account(email: nil, payer_id: nil, flow: :old)
    email ||= @email
    payer_id ||= @payer_id

    @accounts.request(
      body: APIDataTypes.create_create_account_request(
      {
        community_id: @cid,
        person_id: @mid,
        # For testing purposes, add 'email' and 'payer_id' query params.
        # That way we can inject them to our fake PayPal
        callback_url: "https://test.com/request?email=#{email}&payer_id=#{payer_id}",
        country: @country
      }),
      flow: flow)
  end

  def request_community_account(email: nil, payer_id: nil, flow: :old)
    email ||= @email
    payer_id ||= @payer_id

    response = @accounts.request(
      body: APIDataTypes.create_create_account_request(
      {
        community_id: @cid,
        # For testing purposes, add 'email' and 'payer_id' query params.
        # That way we can inject them to our fake PayPal
        callback_url: "https://test.com/request?email=#{email}&payer_id=#{payer_id}",
        country: @country
      }),
      flow: flow)
  end

  def create_personal_account(request_response)
    _, token = parse_redirect_url_from_response(request_response)

    @accounts.create(
      community_id: @cid,
      person_id: @mid,
      order_permission_request_token: token,
      body: {
        order_permission_verification_code: "xxxxyyyyzzzz"
      },
      flow: :old)
  end

  def create_personal_account_new_flow(response_payer_id: nil, request:)
    payer_id = response_payer_id || @payer_id

    @accounts.create(
      community_id: @cid,
      person_id: @mid,
      order_permission_request_token: nil,
      body: { onboarding_params:
                {"merchantId"=> request[:data][:onboarding_params][:merchantId],
                 "merchantIdInPayPal"=> payer_id,
                 "permissionsGranted"=> "true",
                 "accountStatus"=> "BUSINESS_ACCOUNT",
                 "consentStatus"=> "false",
                 "productIntentID"=> "addipmt",
                 "isEmailConfirmed"=> "false",
                 "returnMessage"=> "To start accepting payments, please log in to PayPal and finish signing up.",
                }},
      flow: :new)
  end

  def create_community_account(request_response)
    _, token = parse_redirect_url_from_response(request_response)

    @accounts.create(
      community_id: @cid,
      order_permission_request_token: token,
      body: {
        order_permission_verification_code: "xxxxyyyyzzzz"
      },
      flow: :old)
  end

  def create_community_account_new_flow(response_payer_id: nil, request:)
    payer_id = response_payer_id || @payer_id

    @accounts.create(
      community_id: @cid,
      order_permission_request_token: nil,
      body: { onboarding_params:
                {"merchantId"=> request[:data][:onboarding_params][:merchantId],
                 "merchantIdInPayPal"=> payer_id,
                 "permissionsGranted"=> "true",
                 "accountStatus"=> "BUSINESS_ACCOUNT",
                 "consentStatus"=> "false",
                 "productIntentID"=> "addipmt",
                 "isEmailConfirmed"=> "false",
                 "returnMessage"=> "To start accepting payments, please log in to PayPal and finish signing up.",
                }},
      flow: :new)
  end

  def request_billing_agreement
    @accounts.billing_agreement_request(
      community_id: @cid,
      person_id: @mid,
      body: {
        description: "Let marketplace X take commissions",
        success_url: "https://test.com/billing_agreement/success",
        cancel_url: "https://test.com/billing_agreement/cancel"
      }
    )
  end

  def create_billing_agreement(token)
    response = @accounts.billing_agreement_create(
      community_id: @cid,
      person_id: @mid,
      billing_agreement_request_token: token
    )
  end

  def delete_billing_agreement
    @accounts.delete_billing_agreement(
      community_id: @cid,
      person_id: @mid
    )
  end

  def delete_personal_account
    @accounts.delete(
      community_id: @cid,
      person_id: @mid
    )
  end

  def delete_community_account
    @accounts.delete(
      community_id: @cid
    )
  end

  def get_personal_account
    @accounts.get(
      community_id: @cid,
      person_id: @mid
    )
  end

  def get_community_account
    @accounts.get(
      community_id: @cid
    )
  end

  ## Helpers

  # Takes a callback URL and returns parsed version, that is, a tuple of URL
  # without query part and the token
  #
  # https://<what_ever>?token=<36 chars length token>
  #
  # Example: https://paypaltest.com/billing_agreement?token=3252be6f-e606-41df-a3b7-3eae625be9ac
  #
  # Returs: ["https://paypaltest.com/billing_agreement", "3252be6f-e606-41df-a3b7-3eae625be9ac"]
  def parse_redirect_url(url)
    uri = URI(url)

    token = Maybe(URI(url).query).map { |query_string|
      Maybe(CGI.parse(query_string)["token"]).map { |token_value_array|
        token_value_array.first
      }.or_else(nil)
    }.or_else(nil)

    path_without_query = "#{uri.scheme}://#{uri.host}#{uri.path}"

    [path_without_query, token]
  end

  def parse_redirect_url_from_response(res)
    parse_redirect_url(res[:data][:redirect_url])
  end

  def expect_token(token)
    expect(token).to be_a String
    expect(token.length).to eq 36
  end

  def expect_success(res)
    expect(res[:success]).to eq true
  end

  def expect_no_personal_account
    with_success(get_personal_account) { |data|
      expect(data).to be_nil
    }
  end

  def expect_no_community_account
    with_success(get_personal_account) { |data|
      expect(data).to be_nil
    }
  end

  def with_success(res, &block)
    expect_success(res)
    block.call(res[:data])
    res[:data]
  end

  def with_personal_account(&block)
    with_success(get_personal_account) { |data|
      expect(data[:community_id]).to eq @cid
      expect(data[:person_id]).to eq @mid

      block.call(data)
    }
  end

  def with_community_account(&block)
    with_success(get_community_account) { |data|
      expect(data[:community_id]).to eq @cid
      expect(data[:person_id]).to eq nil

      block.call(data)
    }
  end

  before(:each) do
    # Test version of merchant and permission clients
    PaypalService::API::Api.reset!
    @api_builder = PaypalService::API::Api.api_builder
    @accounts = PaypalService::API::Api.build_test_accounts(prepend_country_code: true)

    # Test data

    @cid = 10
    @mid = "merchant_id_1"
    @country = "gb"
    @payer_id = "payer_id"
    @new_payer_id = "new_payer_id"
    @email = "payer_email@example.com"
    @new_email = "new_payer_email@example.com"
  end

  context "#request" do

    it "creates pending personal account" 


    it "creates pending community account" 


    it "creates pending personal account, new flow" 


    it "creates pending community account, new flow" 


  end

  describe "#create" do

    context "personal account" do
      it "creates personal account with permissions" 


      it "creates personal account with permissions, new flow" 


      it "replaces old unverified account" 


      it "replaces old unverified account, new flow" 


      it "replaces old verified account with new one" 


      it "replaces old verified account with new one, new flow" 


      it "uses existing account if it's reconnected" 


      it "uses existing account if it's reconnected, new flow" 

    end

    context "community account" do
      it "creates community account with permissions" 


      it "creates community account with permissions, new flow" 


      it "replaces old account with new one" 


      it "replaces old account with new one, new flow" 

    end
  end

  context "#get" do

    it "does not return inactive account" 


  end

  context "#billing_agreement_request" do

    it "creates billing agreement request" 

  end

  context "#billing_agreement_create" do

    it "verifies billing agreement" 

  end

  context "#delete_billing_agreement" do

    it "deletes pending billing agreement" 


    it "deletes verified billing agreement" 

  end

  describe "#delete" do
    context "personal account" do

      it "deletes account with verified permissions" 


      it "deletes account with pending billing agreement" 


      it "deletes account with verified billing agreement" 

    end

    context "community account" do
      it "deletes account with verified permissions" 

    end
  end
end

