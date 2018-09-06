# frozen_string_literal: true
require 'spec_helper'

describe Mail::ContentDescriptionField do
  # Content-Description Header Field
  #
  # The ability to associate some descriptive information with a given
  # body is often desirable.  For example, it may be useful to mark an
  # "image" body as "a picture of the Space Shuttle Endeavor."  Such text
  # may be placed in the Content-Description header field.  This header
  # field is always optional.
  #
  #   description := "Content-Description" ":" *text
  #
  # The description is presumed to be given in the US-ASCII character
  # set, although the mechanism specified in RFC 2047 may be used for
  # non-US-ASCII Content-Description values.
  #
  
  describe "initialization" do

    it "should initialize" 


    it "should accept a string without the field name" 


  end

end

