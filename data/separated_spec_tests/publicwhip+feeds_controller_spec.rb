require 'spec_helper'

describe FeedsController, type: :request do
  include HTMLCompareHelper
  fixtures :all

  describe '#mp-info' do
    it { compare_static '/feeds/mp-info.xml' }
    it { compare_static '/feeds/mp-info.xml?house=senate' }
  end

  describe '#mpdream-info' do
    it { compare_static '/feeds/mpdream-info.xml?id=1' }
    # This test is commented out because it occasionally fails on travis for unknown reasons
    # It doesn't fail when run locally
    # TODO Reinstate this test
    #it { compare_static '/feeds/mpdream-info.xml?id=2' }
  end
end

