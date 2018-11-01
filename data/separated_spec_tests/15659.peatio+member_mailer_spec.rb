require "spec_helper"

describe MemberMailer do
  describe "notify_signin" do
    let(:member) { create :member }
    let(:mail) { MemberMailer.notify_signin(member.id) }

    it "renders the headers" 


    it "renders the body" 

  end

end

