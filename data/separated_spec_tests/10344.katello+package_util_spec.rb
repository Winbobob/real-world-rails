require 'katello_test_helper'

module Katello
  describe Util::Package do
    describe "nvrea (katello)" do
      shared_examples_for "nvrea parsable string" do
        it "can be parsed" 

      end

      shared_examples_for "nvrea_nvre parsable string" do
        it "can be parsed" 

      end

      describe "name not in nvrea format" do
        subject { "this-is-not-nvrea" }

        it "can not be parsed by nvrea" 

      end

      describe "full nvrea with rpm" do
        subject { "1:name-ver.si.on-relea.se.x86_64.rpm" }
        let(:expected) do
          { :epoch => "1",
            :name  => "name",
            :version => "ver.si.on",
            :release => "relea.se",
            :arch => "x86_64",
            :suffix => "rpm" }
        end

        it_should_behave_like "nvrea parsable string"
        it_should_behave_like "nvrea_nvre parsable string"
      end

      describe "full nvrea without rpm" do
        subject { "1:name-ver.si.on-relea.se.x86_64" }
        let(:expected) do
          { :epoch => "1",
            :name  => "name",
            :version => "ver.si.on",
            :release => "relea.se",
            :arch => "x86_64" }
        end

        it_should_behave_like "nvrea parsable string"
        it_should_behave_like "nvrea_nvre parsable string"
      end

      describe "nvrea with dash and dots in name and rpm" do
        subject { "name-with-dashes-and.dots-1.0-1.noarch.rpm" }
        let(:expected) do
          { :name  => "name-with-dashes-and.dots",
            :version => "1.0",
            :release => "1",
            :arch => "noarch",
            :suffix => "rpm" }
        end
        it_should_behave_like "nvrea parsable string"
        it_should_behave_like "nvrea_nvre parsable string"
      end

      describe "nvrea with rpm without epoch" do
        subject { "name-ver.si.on-relea.se.x86_64.rpm" }
        let(:expected) do
          { :name  => "name",
            :version => "ver.si.on",
            :release => "relea.se",
            :arch => "x86_64",
            :suffix => "rpm" }
        end

        it_should_behave_like "nvrea parsable string"
        it_should_behave_like "nvrea_nvre parsable string"
      end

      describe "nvrea without rpm and epoch" do
        subject { "name-ver.si.on-relea.se.x86_64" }
        let(:expected) do
          { :name  => "name",
            :version => "ver.si.on",
            :release => "relea.se",
            :arch => "x86_64" }
        end

        it_should_behave_like "nvrea parsable string"
        it_should_behave_like "nvrea_nvre parsable string"
      end
    end

    describe "nvre (katello)" do
      shared_examples_for "nvre parsable string" do
        it "can be parsed" 


        it "can be build" 

      end

      describe "full nvre" do
        subject { "1:name-ver.si.on-relea.se" }
        let(:expected) do
          { :epoch => "1",
            :name  => "name",
            :version => "ver.si.on",
            :release => "relea.se" }
        end

        it_should_behave_like "nvre parsable string"
        it_should_behave_like "nvrea_nvre parsable string"
      end

      describe "nvre without epoch" do
        subject { "name-ver.si.on-relea.se" }
        let(:expected) do
          { :name  => "name",
            :version => "ver.si.on",
            :release => "relea.se"
          }
        end

        it_should_behave_like "nvre parsable string"
        it_should_behave_like "nvrea_nvre parsable string"
      end

      describe "nvre with dash and dots in name and rpm" do
        subject { "name-with-dashes-and.dots-1.0-1" }
        let(:expected) do
          { :name => "name-with-dashes-and.dots",
            :version => "1.0",
            :release => "1" }
        end
        it_should_behave_like "nvre parsable string"
        it_should_behave_like "nvrea_nvre parsable string"
      end
    end
  end
end

