# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Warden::Test::Mock do
  before{ $captures = [] }
  after{ Warden.test_reset! }

  it "should return a valid mocked warden" 

end

