# encoding: utf-8
require 'spec_helper'
require 'action_view'
require 'active_support'
require_relative '../../../app/helpers/badge_label_helper'

include ActionView::Helpers
include ActionView::Context
include BadgeLabelHelper

describe BadgeLabelHelper, :type => :helper do
  it "should return a basic bootstrap badge" 


  it "should return a bootstrap badge with class" 


  it "should take a Number as its first parameter" 

end

BASIC_BADGE = %{<span class="badge">New!</span>}
BADGE_WITH_CLASS = %{<span class="badge badge-warning">2</span>}
BADGE_WITH_NUMBER_PARAM = %{<span class="badge">12</span>}

