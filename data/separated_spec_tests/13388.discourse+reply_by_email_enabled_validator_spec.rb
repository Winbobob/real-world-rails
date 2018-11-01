require 'rails_helper'

describe ReplyByEmailEnabledValidator do

  describe '#valid_value?' do
    subject(:validator) { described_class.new }

    it "only validates when enabling the setting" 


    it "returns false if reply_by_email_address is missing" 


    it "returns false if email polling is disabled" 


    it "returns true when email polling is enabled and the reply_by_email_address is configured" 


  end

end

