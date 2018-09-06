require 'spec_helper'

describe 'member tags' do
  let!(:identity) { create :identity }
  let!(:member) { create :member, email: identity.email, tag_list: 'hero' }

  it 'user can view self tags in settings index' 

end

