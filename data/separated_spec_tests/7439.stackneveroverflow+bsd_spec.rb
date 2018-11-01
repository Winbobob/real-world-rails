require 'spec_helper'

describe Listen::Adapters::BSD do
  if bsd?
    if Listen::Adapters::BSD.usable?
      it "is usable on BSD" 


      it_should_behave_like 'a filesystem adapter'
      it_should_behave_like 'an adapter that call properly listener#on_change'
    else
      it "isn't usable on BSD with #{RbConfig::CONFIG['RUBY_INSTALL_NAME']}" 

    end
  end

  if linux?
    it "isn't usable on Linux" 

  end

  if mac?
    it "isn't usable on Mac OS X" 

  end

  if windows?
    it "isn't usable on Windows" 

  end
end

