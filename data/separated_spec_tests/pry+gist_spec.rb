# These tests are out of date.
# They need to be updated for the new 'gist' API, but im too sleepy to
# do that now.

require_relative '../helper'

describe 'gist' do
  it 'has a dependency on the jist gem' 


  before do
    Pad.gist_calls = {}
  end

  # In absence of normal mocking, just monkeysmash these with no undoing after.
  module ::Gist
    class << self
      def login!; Pad.gist_calls[:login!] = true end

      def gist(*args)
        Pad.gist_calls[:gist_args] = args
        {'html_url' => 'http://gist.blahblah'}
      end

      def copy(content); Pad.gist_calls[:copy_args] = content end
    end
  end

  it 'nominally logs in' 

end

