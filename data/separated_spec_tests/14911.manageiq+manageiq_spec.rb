# These tests are done in a way that assume the Rails environment for ManageIQ are
# loaded, and that Rails is present to do the comparisons.  Tests that confirm
# that this works when rails is not present use a subprocess to run the
# `lib/manageiq.rb` file in isolation.
#
# If tests are not passing, check to see if the spec/spec_helper.rb is being
# loaded properly and initailizing the Vmdb::Application.

require 'manageiq'

describe ManageIQ do
  def without_rails(rb_cmd)
    miq_lib_file = Rails.root.join("lib", "manageiq.rb")
    `#{Gem.ruby} -e 'require "#{miq_lib_file}"; print #{rb_cmd}'`
  end

  describe ".env" do
    before do
      ManageIQ.instance_variable_set(:@_env, nil)
    end

    it "equivalent to Rails.root when Rails is present" 


    it "equivalent to Rails.root even when Rails is not present" 


    it "responds to .test?" 


    it "responds to .development?" 


    it "responds to .production?" 

  end

  describe ".root" do
    before do
      ManageIQ.instance_variable_set(:@_root, nil)
    end

    it "equivalent to Rails.root when Rails is present" 


    it "equivalent to Rails.root even when Rails is not present" 


    it "responds to .join" 

  end
end

