require 'katello_test_helper'

module Katello
  describe Mapping do
    let :map do
      {
        "imagefactory_naming" =>
          {
            "Red Hat Enterprise Linux 6" => ["RHEL-6", 0],
            "Red Hat Enterprise Linux* 6.0" => ["RHEL-6", 0],
            "Red Hat Enterprise Linux* 5.5" => ["RHEL-5", "U5"],
            "Fedora 15" => %w(Fedora 15)
          }
      }
    end

    before :each do
      Mapping.stubs(:configuration).returns(map)
    end

    it "should handle nils" 


    it "should handle empty values" 


    it "should handle identity" 


    it "should ba able to handle wild chars" 

  end
end

