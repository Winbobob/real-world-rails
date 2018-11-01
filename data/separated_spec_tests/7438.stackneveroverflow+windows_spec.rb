require 'spec_helper'

describe Listen::Adapters::Windows do
  if windows? && Listen::Adapters::Windows.usable?
    it "is usable on Windows" 


    it_should_behave_like 'a filesystem adapter'
    it_should_behave_like 'an adapter that call properly listener#on_change'
  end

  if mac?
    it "isn't usable on Mac OS X" 

  end

  if bsd?
    it "isn't usable on BSD" 

  end

  if linux?
    it "isn't usable on Linux" 

  end
end

