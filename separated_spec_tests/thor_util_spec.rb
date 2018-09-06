require "helper"

module Thor::Util
  def self.clear_user_home!
    @@user_home = nil
  end
end

describe Thor::Util do
  describe "#find_by_namespace" do
    it "returns 'default' if no namespace is given" 


    it "adds 'default' if namespace starts with :" 


    it "returns nil if the namespace can't be found" 


    it "returns a class if it matches the namespace" 


    it "matches classes default namespace" 

  end

  describe "#namespace_from_thor_class" do
    it "replaces constant nesting with command namespacing" 


    it "snake-cases component strings" 


    it "accepts class and module objects" 


    it "removes Thor::Sandbox namespace" 

  end

  describe "#namespaces_in_content" do
    it "returns an array of names of constants defined in the string" 


    it "doesn't put the newly-defined constants in the enclosing namespace" 

  end

  describe "#snake_case" do
    it "preserves no-cap strings" 


    it "downcases all-caps strings" 


    it "downcases initial-cap strings" 


    it "replaces camel-casing with underscores" 


    it "places underscores between multiple capitals" 

  end

  describe "#find_class_and_command_by_namespace" do
    it "returns a Thor::Group class if full namespace matches" 


    it "returns a Thor class if full namespace matches" 


    it "returns a Thor class and the command name" 


    it "falls back in the namespace:command look up even if a full namespace does not match" 


    it "falls back on the default namespace class if nothing else matches" 

  end

  describe "#thor_classes_in" do
    it "returns thor classes inside the given class" 

  end

  describe "#user_home" do
    before do
      allow(ENV).to receive(:[])
      Thor::Util.clear_user_home!
    end

    it "returns the user path if no variable is set on the environment" 


    it "returns the *nix system path if file cannot be expanded and separator does not exist" 


    it "returns the windows system path if file cannot be expanded and a separator exists" 


    it "returns HOME/.thor if set" 


    it "returns path with HOMEDRIVE and HOMEPATH if set" 


    it "returns APPDATA/.thor if set" 

  end

  describe "#thor_root_glob" do
    before do
      allow(ENV).to receive(:[])
      Thor::Util.clear_user_home!
    end

    it "escapes globs in path" 

  end

  describe "#globs_for" do
    it "escapes globs in path" 

  end

  describe "#escape_globs" do
    it "escapes ? * { } [ ] glob characters" 

  end
end

