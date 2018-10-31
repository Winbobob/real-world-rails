# encoding: utf-8

require_relative '../../acceptance_helper'
require 'helpers/account_types_helper'

describe Superadmin::AccountTypesController do
  include AccountTypesHelper

  describe '#create' do
    before(:each) do
      @account_type = create_account_type_fg('PRO')
      @account_type_param = {
        account_type: "PERSONAL30",
        rate_limit: @account_type.rate_limit.api_attributes
      }
    end

    after(:each) do
      @account_type.destroy
      Carto::AccountType.where(account_type: "PERSONAL30").each(&:destroy)
    end

    it 'should create account_type' 


    it 'should raise an exception if account_type already exists' 

  end

  describe '#update' do
    before(:each) do
      Carto::AccountType.where(account_type: "PRO").each(&:destroy)
      @account_type = create_account_type_fg('PRO')
      @rate_limits = FactoryGirl.create(:rate_limits_custom)
      @account_type_param = {
        account_type: @account_type.account_type,
        rate_limit: @rate_limits.api_attributes
      }
    end

    after(:each) do
      @rate_limits.destroy
      @account_type.destroy
    end

    it 'should update an account type' 


    it 'should not update an account type with empty rate limits' 


    it 'should raise an error if non-existent account type' 


    it 'should not sync redis if rate limits do not change' 

  end

  describe '#destroy' do
    before(:each) do
      Carto::AccountType.where(account_type: "PRO").each(&:destroy)
      @account_type = create_account_type_fg('PRO')
    end

    after(:each) do
      @account_type.destroy
    end

    it 'should destroy account type' 


    it 'should raise an error if non-existent account type' 

  end
end

