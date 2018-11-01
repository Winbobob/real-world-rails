require 'spec_helper'

RSpec.describe TagsController do
  let (:tags) { %w(foo bar baz) }
  let (:organization) { Fabricate(:organization) }
  let (:member) { Fabricate(:member, organization: organization) }
  let! (:post) { Fabricate(:offer,
                          user: member.user,
                          organization: organization,
                          tags: tags) }

  describe "GET 'index'" do
    before(:each) do
      login(member.user)
    end

    it "returns http success" 


    it "with no search term, returns all tags" 


    it "with search term, returns filtered tags" 

  end
end

