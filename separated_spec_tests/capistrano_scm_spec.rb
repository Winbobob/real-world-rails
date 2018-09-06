require "spec_helper"

require "capistrano/scm"

module RaiseNotImplementedMacro
  def raise_not_implemented_on(method)
    it "should raise NotImplemented on #{method}" 

  end
end

RSpec.configure do
  include RaiseNotImplementedMacro
end

module DummyStrategy
  def test
    test!("you dummy!")
  end
end

module BlindStrategy; end

module Capistrano
  describe SCM do
    let(:context) { mock }

    describe "#initialize" do
      subject { Capistrano::SCM.new(context, DummyStrategy) }

      it "should load the provided strategy" 

    end

    describe "Convenience methods" do
      subject { Capistrano::SCM.new(context, BlindStrategy) }

      describe "#test!" do
        it "should return call test on the context" 

      end

      describe "#repo_url" do
        it "should return the repo url according to the context" 

      end

      describe "#repo_path" do
        it "should return the repo path according to the context" 

      end

      describe "#release_path" do
        it "should return the release path according to the context" 

      end

      describe "#fetch" do
        it "should call fetch on the context" 

      end
    end

    describe "With a 'blind' strategy" do
      subject { Capistrano::SCM.new(context, BlindStrategy) }

      describe "#test" do
        raise_not_implemented_on(:test)
      end

      describe "#check" do
        raise_not_implemented_on(:check)
      end

      describe "#clone" do
        raise_not_implemented_on(:clone)
      end

      describe "#update" do
        raise_not_implemented_on(:update)
      end

      describe "#release" do
        raise_not_implemented_on(:release)
      end
    end
  end
end

