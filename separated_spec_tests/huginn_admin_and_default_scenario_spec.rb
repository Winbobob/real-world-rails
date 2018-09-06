require 'rails_helper'
require_relative '../../../db/seeds/seeder'

describe Seeder do
  before do
    stub_puts_to_prevent_spew_in_spec_output
  end

  describe '.seed' do
    it 'imports a default scenario' 


    it 'creates an admin' 


    it 'can be run multiple times and exit normally' 

  end

  def stub_puts_to_prevent_spew_in_spec_output
    stub(Seeder).puts(anything)
    stub(Seeder).puts
  end
end

