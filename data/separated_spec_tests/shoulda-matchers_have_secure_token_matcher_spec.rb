require 'unit_spec_helper'

# rubocop:disable Metrics/BlockLength
describe Shoulda::Matchers::ActiveRecord::HaveSecureTokenMatcher,
  type: :model do

  if active_record_supports_has_secure_token?
    describe '#description' do
      it 'returns the message including the name of the default column' 


      it 'returns the message including the name of a provided column' 

    end

    it 'matches when the subject configures has_secure_token with the db' 


    it 'matches when the subject configures has_secure_token with the db for ' \
       'a custom attribute' do
      create_table(:users) do |t|
        t.string :auth_token
        t.index :auth_token, unique: true
      end

      valid_model = define_model_class(:User) { has_secure_token(:auth_token) }
      expect(valid_model.new).to have_secure_token(:auth_token)
    end

    it 'does not match when missing an token index' 


    it 'does not match when missing a token column' 


    it 'does not match when when lacking has_secure_token' 


    it 'does not match when missing an index for a custom attribute' 


    it 'does not match when missing a column for a custom attribute' 


    it 'does not match when when lacking has_secure_token for the attribute' 


    it 'fails with the appropriate message when negated' 

  end
end

