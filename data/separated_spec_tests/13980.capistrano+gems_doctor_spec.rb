require "spec_helper"
require "capistrano/doctor/gems_doctor"
require "airbrussh/version"
require "sshkit/version"
require "net/ssh/version"

module Capistrano
  module Doctor
    describe GemsDoctor do
      let(:doc) { GemsDoctor.new }

      it "prints using 4-space indentation" 


      it "prints the Capistrano version" 


      it "prints the Rake version" 


      it "prints the SSHKit version" 


      it "prints the Airbrussh version" 


      it "prints the net-ssh version" 


      it "warns that new version is available" 


      describe "Rake" do
        before do
          load File.expand_path("../../../../../lib/capistrano/doctor.rb",
                                __FILE__)
        end

        after do
          Rake::Task.clear
        end

        it "has an doctor:gems task that calls GemsDoctor", capture_io: true do
          GemsDoctor.any_instance.expects(:call)
          Rake::Task["doctor:gems"].invoke
        end

        it "has a doctor task that depends on doctor:gems" 

      end
    end
  end
end

