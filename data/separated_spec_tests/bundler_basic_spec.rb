# frozen_string_literal: true

RSpec.describe "Resolving" do
  before :each do
    @index = an_awesome_index
  end

  it "resolves a single gem" 


  it "resolves a gem with dependencies" 


  it "resolves a conflicting index" 


  it "resolves a complex conflicting index" 


  it "resolves a index with conflict on child" 


  it "prefers explicitly requested dependencies when resolving an index which would otherwise be ambiguous" 


  it "prefers non-prerelease resolutions in sort order" 


  it "resolves a index with root level conflict on child" 


  it "resolves a gem specified with a pre-release version" 


  it "doesn't select a pre-release if not specified in the Gemfile" 


  it "doesn't select a pre-release for sub-dependencies" 


  it "selects a pre-release for sub-dependencies if it's the only option" 


  it "raises an exception if a child dependency is not resolved" 


  it "raises an exception with the minimal set of conflicting dependencies" 


  it "should throw error in case of circular dependencies" 


  # Issue #3459
  it "should install the latest possible version of a direct requirement with no constraints given" 


  # Issue #3459
  it "should install the latest possible version of a direct requirement with constraints given" 


  it "takes into account required_ruby_version" 


  context "conservative" do
    before :each do
      @index = build_index do
        gem("foo", "1.3.7") { dep "bar", "~> 2.0" }
        gem("foo", "1.3.8") { dep "bar", "~> 2.0" }
        gem("foo", "1.4.3") { dep "bar", "~> 2.0" }
        gem("foo", "1.4.4") { dep "bar", "~> 2.0" }
        gem("foo", "1.4.5") { dep "bar", "~> 2.1" }
        gem("foo", "1.5.0") { dep "bar", "~> 2.1" }
        gem("foo", "1.5.1") { dep "bar", "~> 3.0" }
        gem("foo", "2.0.0") { dep "bar", "~> 3.0" }
        gem "bar", %w[2.0.3 2.0.4 2.0.5 2.1.0 2.1.1 3.0.0]
      end
      dep "foo"

      # base represents declared dependencies in the Gemfile that are still satisfied by the lockfile
      @base = Bundler::SpecSet.new([])

      # locked represents versions in lockfile
      @locked = locked(%w[foo 1.4.3], %w[bar 2.0.3])
    end

    it "resolves all gems to latest patch" 


    it "resolves all gems to latest patch strict" 


    it "resolves foo only to latest patch - same dependency case" 


    it "resolves foo only to latest patch - changing dependency not declared case" 


    it "resolves foo only to latest patch - changing dependency declared case" 


    it "resolves foo only to latest patch strict" 


    it "resolves bar only to latest patch" 


    it "resolves all gems to latest minor" 


    it "resolves all gems to latest minor strict" 


    it "resolves all gems to latest major" 


    it "resolves all gems to latest major strict" 


    # Why would this happen in real life? If bar 2.2 has a bug that the author of foo wants to bypass
    # by reverting the dependency, the author of foo could release a new gem with an older requirement.
    context "revert to previous" do
      before :each do
        @index = build_index do
          gem("foo", "1.4.3") { dep "bar", "~> 2.2" }
          gem("foo", "1.4.4") { dep "bar", "~> 2.1.0" }
          gem("foo", "1.5.0") { dep "bar", "~> 2.0.0" }
          gem "bar", %w[2.0.5 2.1.1 2.2.3]
        end
        dep "foo"

        # base represents declared dependencies in the Gemfile that are still satisfied by the lockfile
        @base = Bundler::SpecSet.new([])

        # locked represents versions in lockfile
        @locked = locked(%w[foo 1.4.3], %w[bar 2.2.3])
      end

      it "could revert to a previous version level patch" 


      it "cannot revert to a previous version in strict mode level patch" 


      it "could revert to a previous version level minor" 


      it "cannot revert to a previous version in strict mode level minor" 

    end
  end
end

