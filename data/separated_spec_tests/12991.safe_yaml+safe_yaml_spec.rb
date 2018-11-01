require "spec_helper"

describe YAML do
  def safe_load_round_trip(object, options={})
    yaml = object.to_yaml
    if SafeYAML::YAML_ENGINE == "psych"
      YAML.safe_load(yaml, nil, options)
    else
      YAML.safe_load(yaml, options)
    end
  end

  before :each do
    # Need to require this here (as opposed to somewhere up higher in the file)
    # to ensure that safe_yaml isn't loaded and therefore YAML isn't monkey-
    # patched, for tests that require only safe_yaml/load.
    require "safe_yaml"
    require "exploitable_back_door"

    SafeYAML.restore_defaults!
  end

  after :each do
    SafeYAML.restore_defaults!
  end

  describe "unsafe_load" do
    if SafeYAML::YAML_ENGINE == "psych" && RUBY_VERSION >= "1.9.3"
      it "allows exploits through objects defined in YAML w/ !ruby/hash via custom :[]= methods" 


      it "allows exploits through objects defined in YAML w/ !ruby/object via the :init_with method" 

    end

    it "allows exploits through objects w/ sensitive instance variables defined in YAML w/ !ruby/object" 


    context "with special whitelisted tags defined" do
      before :each do
        SafeYAML::whitelist!(OpenStruct)
      end

      it "effectively ignores the whitelist (since everything is whitelisted)" 

    end
  end

  describe "safe_load" do
    it "does NOT allow exploits through objects defined in YAML w/ !ruby/hash" 


    it "does NOT allow exploits through objects defined in YAML w/ !ruby/object" 


    context "for YAML engine #{SafeYAML::YAML_ENGINE}" do
      if SafeYAML::YAML_ENGINE == "psych"
        let(:options) { nil }
        let(:arguments) { ["foo: bar", nil, options] }

        context "when no tags are whitelisted" do
          it "constructs a SafeYAML::PsychHandler to resolve nodes as they're parsed, for optimal performance" 

        end

        context "when whitelisted tags are specified" do
          let(:options) {
            { :whitelisted_tags => ["foo"] }
          }

          it "instead uses Psych to construct a full tree before examining the nodes" 

        end
      end

      if SafeYAML::YAML_ENGINE == "syck"
        it "uses Syck internally to parse YAML" 

      end
    end

    it "loads a plain ol' YAML document just fine" 


    it "works for YAML documents with anchors and aliases" 


    it "works for YAML documents with binary tagged keys" 


    it "works for YAML documents with binary tagged values" 


    it "works for YAML documents with binary tagged array values" 


    it "works for YAML documents with sections" 


    it "correctly prefers explicitly defined values over default values from included sections" 


    it "works with multi-level inheritance" 


    it "returns false when parsing an empty document" 


    it "returns nil when parsing a single value representing nil" 


    context "with custom initializers defined" do
      before :each do
        if SafeYAML::YAML_ENGINE == "psych"
          SafeYAML::OPTIONS[:custom_initializers] = {
            "!set" => lambda { Set.new },
            "!hashiemash" => lambda { Hashie::Mash.new }
          }
        else
          SafeYAML::OPTIONS[:custom_initializers] = {
            "tag:yaml.org,2002:set" => lambda { Set.new },
            "tag:yaml.org,2002:hashiemash" => lambda { Hashie::Mash.new }
          }
        end
      end

      it "will use a custom initializer to instantiate an array-like class upon deserialization" 


      it "will use a custom initializer to instantiate a hash-like class upon deserialization" 

    end

    context "with special whitelisted tags defined" do
      before :each do
        SafeYAML::whitelist!(OpenStruct)

        # Necessary for deserializing OpenStructs properly.
        SafeYAML::OPTIONS[:deserialize_symbols] = true
      end

      it "will allow objects to be deserialized for whitelisted tags" 


      it "will not deserialize objects without whitelisted tags" 


      it "will not allow non-whitelisted objects to be embedded within objects with whitelisted tags" 


      context "with the :raise_on_unknown_tag option enabled" do
        before :each do
          SafeYAML::OPTIONS[:raise_on_unknown_tag] = true
        end

        after :each do
          SafeYAML.restore_defaults!
        end

        it "raises an exception if a non-nil, non-whitelisted tag is encountered" 


        it "checks all tags, even those within objects with trusted tags" 


        it "does not raise an exception as long as all tags are whitelisted" 


        it "does not raise an exception on the non-specific '!' tag" 


        context "with whitelisted custom class" do
          class SomeClass
            attr_accessor :foo
          end
          let(:instance) { SomeClass.new }

          before do
            SafeYAML::whitelist!(SomeClass)
            instance.foo = 'with trailing whitespace: '
          end

          it "does not raise an exception on the non-specific '!' tag" 

        end
      end
    end

    context "when options are passed direclty to #load which differ from the defaults" do
      let(:default_options) { {} }

      before :each do
        SafeYAML::OPTIONS.merge!(default_options)
      end

      context "(for example, when symbol deserialization is enabled by default)" do
        let(:default_options) { { :deserialize_symbols => true } }

        it "goes with the default option when it is not overridden" 


        it "allows the default option to be overridden on a per-call basis" 

      end

      context "(or, for example, when certain tags are whitelisted)" do
        let(:default_options) {
          {
            :deserialize_symbols => true,
            :whitelisted_tags => SafeYAML::YAML_ENGINE == "psych" ?
              ["!ruby/object:OpenStruct"] :
              ["tag:ruby.yaml.org,2002:object:OpenStruct"]
          }
        }

        it "goes with the default option when it is not overridden" 


        it "allows the default option to be overridden on a per-call basis" 

      end
    end
  end

  describe "unsafe_load_file" do
    if SafeYAML::YAML_ENGINE == "psych" && RUBY_VERSION >= "1.9.3"
      it "allows exploits through objects defined in YAML w/ !ruby/hash via custom :[]= methods" 

    end

    if SafeYAML::YAML_ENGINE == "psych" && RUBY_VERSION >= "1.9.2"
      it "allows exploits through objects defined in YAML w/ !ruby/object via the :init_with method" 

    end

    it "allows exploits through objects w/ sensitive instance variables defined in YAML w/ !ruby/object" 

  end

  describe "safe_load_file" do
    it "does NOT allow exploits through objects defined in YAML w/ !ruby/hash" 


    it "does NOT allow exploits through objects defined in YAML w/ !ruby/object" 

    
    it "returns false when parsing an empty file" 

  end

  describe "load" do
    let(:options) { {} }

    let (:arguments) {
      if SafeYAML::MULTI_ARGUMENT_YAML_LOAD
        ["foo: bar", nil, options]
      else
        ["foo: bar", options]
      end
    }

    context "as long as a :default_mode has been specified" do
      it "doesn't issue a warning for safe mode, since an explicit mode has been set" 


      it "doesn't issue a warning for unsafe mode, since an explicit mode has been set" 

    end

    context "when the :safe options is specified" do
      let(:safe_mode) { true }
      let(:options) { { :safe => safe_mode } }

      it "doesn't issue a warning" 


      it "calls #safe_load if the :safe option is set to true" 


      context "when the :safe option is set to false" do
        let(:safe_mode) { false }

        it "calls #unsafe_load if the :safe option is set to false" 

      end
    end

    it "issues a warning when the :safe option is omitted" 


    it "only issues a warning once (to avoid spamming an app's output)" 


    it "defaults to safe mode if the :safe option is omitted" 


    context "with the default mode set to :unsafe" do
      before :each do
        SafeYAML::OPTIONS[:default_mode] = :unsafe
      end

      it "defaults to unsafe mode if the :safe option is omitted" 


      it "calls #safe_load if the :safe option is set to true" 

    end
  end

  describe "load_file" do
    let(:filename) { "spec/exploit.1.9.2.yaml" } # doesn't really matter

    it "issues a warning if the :safe option is omitted" 


    it "doesn't issue a warning as long as the :safe option is specified" 


    it "defaults to safe mode if the :safe option is omitted" 


    it "calls #safe_load_file if the :safe option is set to true" 


    it "calls #unsafe_load_file if the :safe option is set to false" 


    context "with arbitrary object deserialization enabled by default" do
      before :each do
        SafeYAML::OPTIONS[:default_mode] = :unsafe
      end

      it "defaults to unsafe mode if the :safe option is omitted" 


      it "calls #safe_load if the :safe option is set to true" 

    end

    it "handles files starting with --- (see issue #48)" 


    it "handles content starting with --- (see issue #48)" 

  end

  describe "whitelist!" do
    context "not a class" do
      it "should raise" 

    end

    context "anonymous class" do
      it "should raise" 

    end

    context "with a Class as its argument" do
      it "should configure correctly" 


      it "successfully deserializes the specified class" 


      it "works for ranges" 


      it "works for regular expressions" 


      it "works for multiple classes" 


      it "works for arbitrary Exception subclasses" 

    end
  end
end

