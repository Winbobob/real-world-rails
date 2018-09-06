require 'spec_helper'

# The I18n::Locale::Tag::Simple is NOT implemented by us. In that
# sense, this test is useless. It's here to demonstrate the difference
# between the default implementation and the `DefinedFallbacksOnly`
# implementation
describe I18n::Locale::Tag::Simple do
  it "returns the locale and splitted subparts" 

end

describe I18n::Locale::Tag::DefinedFallbacksOnly do
  it "returns the locale as is" 

end

