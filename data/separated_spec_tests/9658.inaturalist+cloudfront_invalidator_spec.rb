require "spec_helper"

describe CloudfrontInvalidator do

  before :all do
    class User < ActiveRecord::Base
      invalidate_cloudfront_caches :icon, "attachments/users/icons/:id/*"
    end
  end

  it "not invalidate when adding attachments for the first time" 


  it "invalidates when updating attachments" 


  it "invalidates when removing attachments" 


end

