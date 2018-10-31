require "spec_helper"

RSpec.describe PostReportDecorator do
  let (:org) { Fabricate(:organization) }
  let (:member) { Fabricate(:member, organization: org) }
  let (:category) { Fabricate(:category) }
  let! (:offer) do
    Fabricate(:offer,
              user: member.user,
              organization: org,
              category: category)
  end
  let (:decorator) do
    offers = org.offers.of_active_members.active.group_by(&:category)

    PostReportDecorator.new(org, offers, Offer)
  end

  it "#name" 


  it "#headers" 


  it "#rows" 

end

