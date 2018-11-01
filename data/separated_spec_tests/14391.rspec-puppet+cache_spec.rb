require 'spec_helper'
require 'rspec-puppet/cache'

describe RSpec::Puppet::Cache do

  let(:compiler) { Hash.new }

  subject do
    described_class.new do |args|
      compiler[args]
    end
  end

  describe "fetching cached entries" do
    it "calls the get_proc on cache misses" 


    it "can supply a proc to the get method" 


    it "can handle procs with multiple args" 


    it "reuses cached entries" 


    it "evicts expired entries" 

  end
end

