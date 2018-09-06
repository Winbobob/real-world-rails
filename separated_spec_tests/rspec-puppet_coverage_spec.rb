require 'spec_helper'
require 'rspec-puppet/coverage'
require 'rspec-puppet/support'

describe RSpec::Puppet::Coverage do

  subject { described_class.new }

  # Save and restore the global coverage object so that these tests don't
  # affect the actual spec coverage
  before(:all) do
    @saved = described_class.instance
    described_class.instance = described_class.new
  end

  after(:all) do
    described_class.instance = @saved
  end

  describe "filtering" do
    it "filters boilerplate catalog resources by default" 


    it "can add additional filters" 


    it "filters resources based on the resource title" 

  end

  describe "adding resources that could be covered" do
    it "adds resources that don't exist and aren't filtered" 


    it "ignores resources that have been filtered" 


    it "ignores resources that have already been added" 

  end

  describe "getting coverage results" do
    let(:touched) { %w[First Second Third Fourth Fifth] }
    let(:untouched) { %w[Sixth Seventh Eighth Nineth] }

    before do
      touched.each do |title|
        subject.add("Notify[#{title}]")
        subject.cover!("Notify[#{title}]")
      end
      untouched.each do |title|
        subject.add("Notify[#{title}]")
      end
    end

    let(:report) { subject.results }

    it "counts the total number of resources" 


    it "counts the number of touched resources" 


    it "counts the number of untouched resources" 


    it "counts the coverage percentage" 


    it "includes all resources and their status" 

  end
end

