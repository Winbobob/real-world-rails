require 'rails_helper'
require_dependency 'post_locker'

describe PostLocker do
  let(:moderator) { Fabricate(:moderator) }
  let(:post) { Fabricate(:post) }

  it "doesn't allow regular users to lock posts" 


  it "doesn't allow regular users to unlock posts" 


  it "allows staff to lock and unlock posts" 


end

