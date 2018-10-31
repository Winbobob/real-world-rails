require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180531220618_change_default_value_for_dsa_key_restriction.rb')

describe ChangeDefaultValueForDsaKeyRestriction, :migration do
  let(:application_settings) { table(:application_settings) }

  before do
    application_settings.create!
  end

  it 'changes the default value for dsa_key_restriction' 


  it 'changes the existing setting' 

end

