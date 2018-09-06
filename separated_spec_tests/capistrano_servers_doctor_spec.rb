require "spec_helper"
require "capistrano/doctor/servers_doctor"

module Capistrano
  module Doctor
    describe ServersDoctor do
      include Capistrano::DSL
      let(:doc) { ServersDoctor.new }

      before { Capistrano::Configuration.reset! }
      after { Capistrano::Configuration.reset! }

      it "prints using 4-space indentation" 


      it "prints the number of defined servers" 


      describe "prints the server's details" do
        it "including username" 


        it "including port" 


        it "including roles" 


        it "including empty roles" 


        it "including properties" 


        it "including misleading role name alert" 

      end

      it "doesn't fail for no servers" 


      describe "Rake" do
        before do
          load File.expand_path("../../../../../lib/capistrano/doctor.rb",
                                __FILE__)
        end

        after do
          Rake::Task.clear
        end

        it "has an doctor:servers task that calls ServersDoctor" 


        it "has a doctor task that depends on doctor:servers" 

      end
    end
  end
end

