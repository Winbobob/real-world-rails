require 'rails_helper'

def shortcode_tests
  before(:each) do
    helper.shortcodes_init
    helper.shortcode_add("hello_world", lambda{|attrs, args|
      "Hello World"
    })
    helper.shortcode_add("hello", lambda{|attrs, args|
      "Hello #{attrs['name']}"
    })
    helper.shortcode_add("user_info", lambda{|attrs, args|
      "#{attrs['name']} #{attrs['lastname']}"
    })
    helper.shortcode_add("modal", lambda{|attrs, args|
      "modal body = #{args[:shortcode_content]}"
    })
    helper.shortcode_add("title", lambda{|attrs, args|
      "<h1>#{args[:shortcode_content]}</h1>"
    })
    helper.shortcode_add("sub_title", lambda{|attrs, args|
      "<h2 style='#{attrs['style']}'>#{args[:shortcode_content]}</h2>"
    })
    helper.shortcode_add("sub_title2", lambda{|attrs, args|
      "<h2 style='#{attrs['style']}' class='#{attrs['class']}'>#{args[:shortcode_content]}</h2>"
    })
  end
end

describe "CamaleonCms::ShortCodeHelper" do
  # get_current_test_site()
  describe "Shortcode Simple" do
    shortcode_tests
    it "No attributes" 

    it "With attribute" 

    it "With attributes" 

  end

  describe "Shortcode with Block" do
    shortcode_tests
    it "No attributes" 

    it "With attribute" 

    it "With attributes" 

  end

  describe "Shortcode Multiple" do
    shortcode_tests
    it "Many Shortcodes" 

  end
end

