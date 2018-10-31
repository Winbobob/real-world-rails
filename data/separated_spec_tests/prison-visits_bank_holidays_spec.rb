require 'rails_helper'

RSpec.describe 'Bank holidays' do
  describe 'bundled database' do
    subject do
      JSON.parse(File.read('config/bank-holidays.json'))['england-and-wales']['events']
    end

    it 'contains at least one bank holiday after today' 


    describe 'a bank holiday object' do
      expected_keys = %w( bunting date notes title )

      it "contains the keys: #{expected_keys.to_sentence}" 

    end
  end
end

