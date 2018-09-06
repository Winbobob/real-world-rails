# frozen_string_literal: true
require 'spec_helper'

describe Mail::Envelope do
  # From RFC4155 The application/mbox Media Type
  #
  #   o Each message in the mbox database MUST be immediately preceded
  #     by a single separator line, which MUST conform to the following
  #     syntax:
  #
  #        The exact character sequence of "From";
  #
  #        a single Space character (0x20);
  #
  #        the email address of the message sender (as obtained from the
  #        message envelope or other authoritative source), conformant
  #        with the "addr-spec" syntax from RFC 2822;
  #
  #        a single Space character;
  #
  #        a timestamp indicating the UTC date and time when the message
  #        was originally received, conformant with the syntax of the
  #        traditional UNIX 'ctime' output sans timezone (note that the
  #        use of UTC precludes the need for a timezone indicator);
  #
  #        an end-of-line marker.

  it "should initialize" 


  describe "accessor methods" do
    it "should return the address" 


    it "should return the date_time" 

  end

end

