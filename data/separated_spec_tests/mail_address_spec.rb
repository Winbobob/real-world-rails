# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::Address do

  describe "functionality" do

    it "should allow us to instantiate an empty address object and call inspect" 


    it "should allow us to instantiate an empty address object and call to_s" 


    it "should allow us to instantiate an empty address object and call format" 


    it "should allow us to instantiate an empty address object and call address" 


    it "should allow us to instantiate an empty address object and call local" 


    it "should allow us to instantiate an empty address object and call domain" 


    it "should allow us to instantiate an empty address object and call name" 


    ['"-Earnings...Notification-" <vodacom.co.rs>', '<56253817>'].each do |spammy_address|
      it "should ignore funky local-only spammy addresses in angle brackets #{spammy_address}" 

    end


    it "should give its address back on :to_s if there is no display name" 


    it "should give its format back on :to_s if there is a display name" 


    it "should give back the display name" 


    it "should preserve the display name passed in" 


    it "should preserve the display name passed in with token unsafe chars" 


    it "should decode the display name without calling #decoded first" 


    it "doesn't get stuck on decode or encode output mode" 


    it "should allow nil display name" 


    it "should give back the local part" 


    it "should give back the domain" 


    it "should give back the formated address" 


    it "should handle an address without a domain" 


    it "should handle comments" 


    it "should handle multiple comments" 


    it "should handle nested comments" 


    it "should give back the raw value" 


    it "should format junk addresses as raw text" 


  end

  describe "assigning values directly" do
    it "should allow you to assign an address" 


    it "should allow you to assign a display name" 


    it "should return an empty format a display name and no address defined" 


    it "should allow you to assign an address and a display name" 

  end

  describe "parsing" do

    describe "basic email addresses" do
      it "should handle all OK local parts" 


      it "should handle all OK domains" 

    end

    describe 'RFC 6532 UTF-8 chars' do
      it 'local' 


      it 'domain' 


      it 'display name' 

    end

    describe "email addresses from the wild" do
      it "should handle |aamine@loveruby.net|" 


      it "should handle |Minero Aoki <aamine@loveruby.net>|" 


      it "should handle |Minero Aoki<aamine@loveruby.net>|" 


      it 'should handle |"Minero Aoki" <aamine@loveruby.net>|' 


      it "should handle |Minero Aoki<aamine@0246.loveruby.net>|" 


      it "should handle lots of dots" 


      it "should handle trailing dots" 


      it 'should handle |"Joe & J. Harvey" <ddd @Org>|' 


      it 'should handle |"spickett@tiac.net" <Sean.Pickett@zork.tiac.net>|' 


      it "should handle |rls@intgp8.ih.att.com (-Schieve,R.L.)|" 


      it "should handle |jrh%cup.portal.com@portal.unix.portal.com|" 


      it "should handle |astrachan@austlcm.sps.mot.com ('paul astrachan/xvt3')|" 


      it "should handle 'TWINE57%SDELVB.decnet@SNYBUF.CS.SNYBUF.EDU (JAMES R. TWINE - THE NERD)'" 


      it "should be able to handle 'David Apfelbaum <da0g+@andrew.cmu.edu>'" 


      it 'should handle |"JAMES R. TWINE - THE NERD" <TWINE57%SDELVB%SNYDELVA.bitnet@CUNYVM.CUNY.EDU>|' 


      it "should handle '/G=Owen/S=Smith/O=SJ-Research/ADMD=INTERSPAN/C=GB/@mhs-relay.ac.uk'" 


      it 'should handle |"Stephen Burke, Liverpool" <BURKE@vxdsya.desy.de>|' 


      it "should handle 'The Newcastle Info-Server <info-admin@newcastle.ac.uk>'" 


      it "should handle 'Suba.Peddada@eng.sun.com (Suba Peddada [CONTRACTOR])'" 


      it "should handle 'Paul Manser (0032 memo) <a906187@tiuk.ti.com>'" 


      it 'should handle |"gregg (g.) woodcock" <woodcock@bnr.ca>|' 


      it 'should handle |Graham.Barr@tiuk.ti.com|' 


      it "should handle |a909937 (Graham Barr          (0004 bodg))|" 


      it "should handle |david d `zoo' zuhn <zoo@aggregate.com>|" 


      it "should handle |(foo@bar.com (foobar), ned@foo.com (nedfoo) ) <kevin@goess.org>|" 


      it "should handle |Pete(A wonderful ) chap) <pete(his account)@silly.test(his host)>|" 


      it "should handle |Joe Q. Public <john.q.public@example.com>|" 


      it "should handle |Mary Smith <@machine.tld:mary@example.net>|" 


      it "should handle |jdoe@test   . example|" 


      it "should handle |groupname+domain.com@example.com|" 


      it "should handle |=?UTF-8?B?8J+RjQ==?= <=?UTF-8?B?8J+RjQ==?=@=?UTF-8?B?8J+RjQ==?=.emoji>|" 


      it 'should handle |"Mikel \"quotes\" Lindsaar" <test@lindsaar.net>|' 


      it 'should handle |"Mikel \" Lindsaar" <test@lindsaar.net>|' 


      it 'should handle |"Mikel \"quotes\" (and comments) Lindsaar" (comment1)<test(comment2)@lindsaar.net(comment3)>|' 


      it "should expose group" 


      it "should have no group by default" 


    end

  end

  describe "creating" do

    describe "parts of an address" do
      it "should add an address" 


      it "should add a display name" 

    end

  end

  describe "modifying an address" do
    it "should add an address" 


    it "should add a display name" 


    it "should take an address and a display name and join them" 


    it "should take a display name and an address and join them" 


  end

  describe "providing encoded and decoded outputs" do
    it "should provide an encoded output" 


    it "should provide an encoded output for non us-ascii" 


    it "should provide an encoded output for non us-ascii" 


  end

end

