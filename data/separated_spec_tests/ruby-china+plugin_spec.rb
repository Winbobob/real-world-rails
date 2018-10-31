# frozen_string_literal: true

require "rails_helper"

describe Homeland::Plugin do
  describe ".register_plugin" do
    before do
      @plugin = Homeland.register_plugin do |plugin|
        plugin.name              = "foo"
        plugin.version           = "0.1.0"
        plugin.display_name      = "Foo bar"
        plugin.root_path         = "/foo"
        plugin.admin_path        = "/admin/foo"
        plugin.description       = "Hello this is foo bar"
        plugin.navbar_link       = true
        plugin.user_menu_link    = true
        plugin.admin_navbar_link = true
      end

      @plugin1 = Homeland.register_plugin do |plugin|
        plugin.name           = "dar"
        plugin.display_name   = "Dar bar"
        plugin.navbar_link    = false
        plugin.user_menu_link = false
      end
    end

    it "should work" 


    it ".plugins work" 


    it ".sorted_plugins work" 


    it ".navbar_plugins work" 


    it ".admin_navbar_plugins work" 


    it ".user_menu_plugins work" 

  end
end

