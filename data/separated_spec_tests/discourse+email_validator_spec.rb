require 'rails_helper'

describe EmailValidator do

  let(:record) {}
  let(:validator) { described_class.new(attributes: :email) }
  subject(:validate) { validator.validate_each(record, :email, record.email) }

  def blocks?(email)
    user = Fabricate.build(:user, email: email)
    validator = EmailValidator.new(attributes: :email)
    validator.validate_each(user, :email, user.email)
    user.errors[:email].present?
  end

  context "blocked email" do
    it "doesn't add an error when email doesn't match a blocked email" 


    it "adds an error when email matches a blocked email" 


    it "blocks based on email_domains_blacklist" 


    it "blocks based on email_domains_whitelist" 

  end

  context '.email_regex' do
    it 'should match valid emails' 


    it 'should not match invalid emails' 

  end

end

