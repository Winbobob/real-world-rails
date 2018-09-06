# encoding: utf-8

require 'uuidtools'
require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/user_creations_controller'
require 'helpers/account_types_helper'

describe Carto::Api::UserCreationsController do
  include_context 'organization with users helper'
  include AccountTypesHelper

  describe 'show' do

    before :all do
      create_account_type_fg('FREE')
      create_account_type_fg('ORGANIZATION USER')
    end

    after :all do
      Carto::AccountType.find('FREE').try(:destroy)
      Carto::AccountType.find('ORGANIZATION USER').try(:destroy)
    end

    it 'returns 404 for unknown user creations' 


    it 'returns user creation data' 


    it 'triggers user_creation authentication for google users' 


    it 'does not trigger user_creation authentication for normal users' 

  end

end

