require 'unit_spec_helper'

describe Shoulda::Matchers::ActiveModel::HaveSecurePasswordMatcher, type: :model do
  if active_model_3_1?
    it 'matches when the subject configures has_secure_password with default options' 


    it 'does not match when the subject does not authenticate a password' 


    it 'does not match when the subject is missing the password_digest attribute' 

  end
end

