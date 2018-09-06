require 'spec_helper'
require 'acceptance/webmock_shared'

if RUBY_PLATFORM =~ /java/
  require 'acceptance/manticore/manticore_spec_helper'

  describe "Manticore" do
    include ManticoreSpecHelper

    include_context "with WebMock", :no_status_message

    context "calling http methods on Manticore directly using Manticore's facade" do
      it "handles GET" 


      it "handles POST" 


      it "handles PUT" 


      it "handles PATCH" 


      it "handles DELETE" 


      it "handles OPTIONS" 


      it "handles HEAD" 

    end
  end
end

