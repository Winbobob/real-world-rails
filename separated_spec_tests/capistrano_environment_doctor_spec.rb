require "spec_helper"
require "capistrano/doctor/environment_doctor"

module Capistrano
  module Doctor
    describe EnvironmentDoctor do
      let(:doc) { EnvironmentDoctor.new }

      it "prints using 4-space indentation" 


      it "prints the Ruby version" 


      it "prints the Rubygems version" 


      describe "Rake" do
        before do
          load File.expand_path("../../../../../lib/capistrano/doctor.rb",
                                __FILE__)
        end

        after do
          Rake::Task.clear
        end

        it "has an doctor:environment task that calls EnvironmentDoctor" 


        it "has a doctor task that depends on doctor:environment" 

      end
    end
  end
end

