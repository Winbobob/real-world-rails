require 'email_validator'

describe EmailValidator do
  let :subject do
    EmailValidator.new({attributes: [:email]})
  end

  let! :model do
    Feedback.new
  end

  it "doesn't allow for a borked e-mail address" 


  it "allows correct e-mail addresses" 

end

