# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::CommonAddressField do

  describe "address handling" do

    it "should give the addresses it is going to" 


    it "should split up the address list into individual addresses" 


    it "should give the formatted addresses" 


    it "should give the display names" 


    it "should give the actual address objects" 


    it "should handle groups as well" 


    it "should provide a list of groups" 


    it "should provide a list of addresses per group" 


    it "should provide a list of addresses that are just in the groups" 


    describe ".value=" do
      it "should handle initializing as an empty string" 


      it "should encode to an empty string if it has no addresses or groups" 


      context "a unquoted multi-byte address is given" do
        let(:given_value) { 'みける <mikel@test.lindsaar.net>' }

        it "should allow you to set an unquoted, multi-byte address value after initialization" 


        it "should keep the given value" 

      end

      context "a quoted multi-byte address is given" do
        let(:given_value) { '"みける" <mikel@test.lindsaar.net>' }

        it "should allow you to set an quoted, multi-byte address value after initialization" 


        it "should keep the given value" 

      end
    end

    describe ".<<" do
      it "should allow you to append an address" 


      context "a unquoted multi-byte address is given" do
        let(:given_value) { 'みける <mikel@test.lindsaar.net>' }

        context "initialized with an empty string" do
          it "should allow you to append an unquoted, multi-byte address value" 


          it "should keep the given value" 

        end

        context "initialized with an us-ascii address" do
          it "should allow you to append a quoted, multi-byte address value" 

        end

        context "initialized with an multi-byte address" do
          it "should allow you to append a quoted, multi-byte address value" 


          it "should keep the given value" 

        end
      end

      context "a quoted multi-byte address is given" do
        let(:given_value) { '"みける" <mikel@test.lindsaar.net>' }

        context "initialized with an empty string" do
          it "should allow you to append a quoted, multi-byte address value" 


          it "should keep the given value" 

        end

        context "initialized with an us-ascii address" do
          it "should allow you to append a quoted, multi-byte address value" 

        end

        context "initialized with an multi-byte address" do
          it "should allow you to append a quoted, multi-byte address value" 


          it "should keep the given value" 

        end
      end
    end

    it "should preserve the display name" 


    it "should handle multiple addresses" 


    it "should handle missing display names with an angle address" 


    it "should handle empty display names with an angle address" 


  end

  describe "encoding and decoding fields" do

    it "should allow us to encode an address field" 


    it "should allow us to encode a simple address field" 


    it "should allow us to encode an address field" 


    it "should allow us to decode an address field" 


    it "should allow us to decode a non ascii address field" 


    it "should allow us to decode a non ascii address field" 


  end

  it "should yield each address object in turn" 


end

