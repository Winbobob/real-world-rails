# encoding: utf-8
require 'spec_helper'
require 'action_view'
require 'active_support'
require_relative '../../../app/helpers/glyph_helper'

include ActionView::Helpers
include ActionView::Context
include GlyphHelper

describe GlyphHelper, :type => :helper do
  it "should return a basic bootstrap glyph" 


  it "should return a bootstrap glyph with span" 

end

BASIC_GLYPH = %{<iclass=\"glyphiconglyphicon-thumbs-up\"></i>}
GLYPH_WITH_SPAN = %{<spanclass=\"glyphiconglyphicon-thumbs-up\"></span>}

