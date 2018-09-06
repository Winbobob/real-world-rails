require 'spec_helper'

describe "path helpers", type: :helper do
  let(:member) { mock_model(Member, url_name: "Foo_Bar", url_electorate: "Twist",
    house: "representatives") }
  let(:policy) { mock_model(Policy, id: 123) }
  let(:division) { mock_model(Division, house: "representatives", date: Date.new(2001,1,1), number: 3) }
  let(:party) { double("party", url_name: "foo_bar") }

  it ".member_path" 


  it ".member_policy_path" 


  it ".member_divisions_path" 


  it ".friends_member_path" 


  it ".division_path" 


  it ".edit_division_path" 


  it ".electorate_path" 


  it ".member_division_path" 


  it ".history_division_path" 


  it ".party_divisions_path" 

end

