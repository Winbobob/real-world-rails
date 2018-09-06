require "spec_helper"
require "capistrano/doctor/output_helpers"

module Capistrano
  module Doctor
    describe OutputHelpers do
      include OutputHelpers

      # Force color for the purpose of these tests
      before { ENV.stubs(:[]).with("SSHKIT_COLOR").returns("1") }

      it "prints titles in blue with newlines and without indentation" 


      it "prints warnings in yellow with 4-space indentation" 


      it "overrides puts to indent 4 spaces per line" 


      it "formats tables with indent, aligned columns and per-row color" 

    end
  end
end

