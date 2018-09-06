require 'rails_helper'

describe ReplyByEmailAddressValidator do

  describe '#valid_value?' do
    subject(:validator) { described_class.new }

    it "returns true for blank values" 


    it "returns false if value is not an email address" 


    it "returns false if value does not contain '%{reply_key}'" 


    it "returns true if value does not contain '%{reply_key}' but 'find_related_post_with_key' is also disabled" 


    it "returns false if value is the same as SiteSetting.notification_email" 


    it "returns true when value is OK" 


  end

end

