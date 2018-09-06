require 'spec_helper'

module NamespaceSpec

  describe "a grammar" do
    class_eval("module Foo; end")
    testing_grammar %{
      module Foo::Bar
        module Baz
          grammar Bat
            rule foo
              bar / baz
            end

            rule bar
              'bar' 'bar'
            end

            rule baz
              'baz' 'baz'
            end
          end
        end
      end
    }

    it "parses matching input" 


    it "mixes in included modules" 

  end
end

