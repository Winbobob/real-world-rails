require 'spec_helper'

describe Api::Admin::CustomerSerializer do
  let(:customer) { create(:customer, tag_list: "one, two, three") }
  let!(:tag_rule) { create(:tag_rule, enterprise: customer.enterprise, preferred_customer_tags: "two") }

  it "serializes a customer with tags" 


  it 'serializes a customer without tag_rule_mapping' 

end

