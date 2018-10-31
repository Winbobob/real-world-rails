require "spec_helper"

RSpec.describe MemberReportDecorator do
  let (:member) { Fabricate(:member) }
  let (:org) { member.organization }
  let (:decorator) do
    MemberReportDecorator.new(org, org.members)
  end

  it "#name" 


  it "#headers" 


  it "#rows" 

end

