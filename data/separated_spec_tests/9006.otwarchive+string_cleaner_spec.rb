# -*- coding: utf-8 -*-

require 'string_cleaner'

class Foo
  include StringCleaner
end

describe Foo do
  let(:foo) { Foo.new }

  describe "#remove_articles_from_string" do
    it "should remove 'the '" 


    it "should remove 'a '" 


    it "should remove 'an '" 


    it "should not remove 'the' if followed by other characters" 


  end

end

