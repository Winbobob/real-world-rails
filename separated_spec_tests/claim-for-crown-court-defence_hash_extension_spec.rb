require 'rails_helper'

RSpec.describe Hash do

  let(:h) do
    {
      key_id: '1',
      hash1: { key_id: '2' },
      array1: [
                { key_id: '3' },
                { key_id: '4' }
              ],
      array2: [
                { hash2:
                  { key_id: '5' },
                  array3: [key_id: '6']
                },
                hash3:
                  {
                    key_id: { key_id: '7' }
                  }
              ],
      array4: [
                {
                  key_id: [:key_id, :key_id]
                }
              ]
    }
  end

  describe '#all_values_for' do
    subject { h.all_values_for(:key_id) }

    it 'returns an array of all values for the specified key' 

  end

  describe '#all_keys' do
    subject(:result) { h.all_keys }

    it 'returns an array of all keys' 


    it 'returns duplicate keys' 

  end
end

