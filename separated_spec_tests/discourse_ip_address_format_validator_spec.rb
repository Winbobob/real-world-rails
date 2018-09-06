require 'rails_helper'

describe IpAddressFormatValidator do

  let(:record) { Fabricate.build(:screened_ip_address, ip_address: '99.232.23.123') }
  let(:validator) { described_class.new(attributes: :ip_address) }
  subject(:validate) { validator.validate_each(record, :ip_address, record.ip_address) }

  ['99.232.23.123', '99.232.0.0/16', 'fd12:db8::ff00:42:8329', 'fc00::/7'].each do |arg|
    it "should not add an error for #{arg}" 

  end

  it 'should add an error for nil IP address' 


  it 'should add an error for invalid IP address' 

end

