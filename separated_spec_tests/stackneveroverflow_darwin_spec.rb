require 'spec_helper'

describe Listen::Adapters::Darwin do
  if mac?
    if Listen::Adapters::Darwin.usable?
      it "is usable on Mac OS X >= 10.6" 


      it_should_behave_like 'a filesystem adapter'
      it_should_behave_like 'an adapter that call properly listener#on_change'
    else
      it "isn't usable on Mac OS X with #{RbConfig::CONFIG['RUBY_INSTALL_NAME']}" 

    end

  end

  if windows?
    it "isn't usable on Windows" 

  end

  if linux?
    it "isn't usable on Linux" 

  end

  if bsd?
    it "isn't usable on BSD" 

  end
end

