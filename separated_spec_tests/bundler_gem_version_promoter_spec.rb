# frozen_string_literal: true

RSpec.describe Bundler::GemVersionPromoter do
  context "conservative resolver" do
    def versions(result)
      result.flatten.map(&:version).map(&:to_s)
    end

    def make_instance(*args)
      @gvp = Bundler::GemVersionPromoter.new(*args).tap do |gvp|
        gvp.class.class_eval { public :filter_dep_specs, :sort_dep_specs }
      end
    end

    def unlocking(options)
      make_instance(Bundler::SpecSet.new([]), ["foo"]).tap do |p|
        p.level = options[:level] if options[:level]
        p.strict = options[:strict] if options[:strict]
      end
    end

    def keep_locked(options)
      make_instance(Bundler::SpecSet.new([]), ["bar"]).tap do |p|
        p.level = options[:level] if options[:level]
        p.strict = options[:strict] if options[:strict]
      end
    end

    def build_spec_groups(name, versions)
      versions.map do |v|
        Bundler::Resolver::SpecGroup.new(build_spec(name, v))
      end
    end

    # Rightmost (highest array index) in result is most preferred.
    # Leftmost (lowest array index) in result is least preferred.
    # `build_spec_groups` has all versions of gem in index.
    # `build_spec` is the version currently in the .lock file.
    #
    # In default (not strict) mode, all versions in the index will
    # be returned, allowing Bundler the best chance to resolve all
    # dependencies, but sometimes resulting in upgrades that some
    # would not consider conservative.
    context "filter specs (strict) level patch" do
      it "when keeping build_spec, keep current, next release" 


      it "when unlocking prefer next release first" 


      it "when unlocking keep current when already at latest release" 

    end

    context "filter specs (strict) level minor" do
      it "when unlocking favor next releases, remove minor and major increases" 


      it "when keep locked, keep current, then favor next release, remove minor and major increases" 

    end

    context "sort specs (not strict) level patch" do
      it "when not unlocking, same order but make sure build_spec version is most preferred to stay put" 


      it "when unlocking favor next release, then current over minor increase" 


      it "when unlocking do proper integer comparison, not string" 


      it "leave current when unlocking but already at latest release" 

    end

    context "sort specs (not strict) level minor" do
      it "when unlocking favor next release, then minor increase over current" 

    end

    context "level error handling" do
      subject { Bundler::GemVersionPromoter.new }

      it "should raise if not major, minor or patch is passed" 


      it "should raise if invalid classes passed" 


      it "should accept major, minor patch symbols" 


      it "should accept major, minor patch strings" 

    end

    context "debug output" do
      it "should not kerblooie on its own debug output" 

    end
  end
end

