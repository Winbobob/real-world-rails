# frozen_string_literal: true

RSpec.describe "Resolving platform craziness" do
  describe "with cross-platform gems" do
    before :each do
      @index = an_awesome_index
    end

    it "resolves a simple multi platform gem" 


    it "doesn't pull gems that don't exist for the current platform" 


    it "doesn't pull gems when the version is available for all requested platforms" 

  end

  describe "with mingw32" do
    before :each do
      @index = build_index do
        platforms "mingw32 mswin32 x64-mingw32" do |platform|
          gem "thin", "1.2.7", platform
        end
        gem "win32-api", "1.5.1", "universal-mingw32"
      end
    end

    it "finds mswin gems" 


    it "finds mingw gems" 


    it "finds x64-mingw gems" 


    it "finds universal-mingw gems on x86-mingw" 


    it "finds universal-mingw gems on x64-mingw" 

  end

  describe "with conflicting cases" do
    before :each do
      @index = build_index do
        gem "foo", "1.0.0" do
          dep "bar", ">= 0"
        end

        gem "bar", "1.0.0" do
          dep "baz", "~> 1.0.0"
        end

        gem "bar", "1.0.0", "java" do
          dep "baz", " ~> 1.1.0"
        end

        gem "baz", %w[1.0.0 1.1.0 1.2.0]
      end
    end

    it "reports on the conflict" 

  end
end

