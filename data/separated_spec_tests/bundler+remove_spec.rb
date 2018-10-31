# frozen_string_literal: true

RSpec.describe "bundle remove" do
  context "when no gems are specified" do
    it "throws error" 

  end

  context "when --install flag is specified" do
    it "removes gems from .bundle" 

  end

  describe "remove single gem from gemfile" do
    context "when gem is present in gemfile" do
      it "shows success for removed gem" 

    end

    context "when gem is not present in gemfile" do
      it "shows warning for gem that could not be removed" 

    end
  end

  describe "remove mutiple gems from gemfile" do
    context "when all gems are present in gemfile" do
      it "shows success fir all removed gems" 

    end

    context "when some gems are not present in the gemfile" do
      it "shows warning for those not present and success for those that can be removed" 

    end
  end

  context "with inline groups" do
    it "removes the specified gem" 

  end

  describe "with group blocks" do
    context "when single group block with gem to be removed is present" do
      it "removes the group block" 

    end

    context "when gem to be removed is outside block" do
      it "does not modify group" 

    end

    context "when an empty block is also present" do
      it "removes all empty blocks" 

    end

    context "when the gem belongs to mutiple groups" do
      it "removes the groups" 

    end

    context "when the gem is present in mutiple groups" do
      it "removes all empty blocks" 

    end
  end

  describe "nested group blocks" do
    context "when all the groups will be empty after removal" do
      it "removes the empty nested blocks" 

    end

    context "when outer group will not be empty after removal" do
      it "removes only empty blocks" 

    end

    context "when inner group will not be empty after removal" do
      it "removes only empty blocks" 

    end
  end

  describe "arbitrary gemfile" do
    context "when mutiple gems are present in same line" do
      it "shows warning for gems not removed" 

    end

    context "when some gems could not be removed" do
      it "shows warning for gems not removed and success for those removed" 

    end
  end

  context "with sources" do
    before do
      build_repo gem_repo3 do
        build_gem "rspec"
      end
    end

    it "removes gems and empty source blocks" 

  end

  describe "with eval_gemfile" do
    context "when gems are present in both gemfiles" do
      it "removes the gems" 

    end

    context "when gems are present in other gemfile" do
      it "removes the gems" 

    end

    context "when gems to be removed are not specified in any of the gemfiles" do
      it "throws error for the gems not present" 

    end

    context "when the gem is present in parent file but not in gemfile specified by eval_gemfile" do
      it "removes the gem" 

    end

    context "when gems can not be removed from other gemfile" do
      it "shows error" 

    end

    context "when gems could not be removed from parent gemfile" do
      it "shows error" 

    end

    context "when gem present in gemfiles but could not be removed from one from one of them" do
      it "removes gem which can be removed and shows warning for file from which it can not be removed" 

    end
  end

  context "with install_if" do
    it "removes gems inside blocks and empty blocks" 

  end

  context "with env" do
    it "removes gems inside blocks and empty blocks" 

  end

  context "with gemspec" do
    it "should not remove the gem" 

  end
end

