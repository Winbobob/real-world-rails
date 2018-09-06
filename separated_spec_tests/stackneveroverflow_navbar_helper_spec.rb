# encoding: utf-8
#Credit for this goes to https://github.com/julescopeland/Rails-Bootstrap-Navbar
require 'spec_helper'
require 'action_view'
require 'active_support'
require_relative '../../../app/helpers/navbar_helper'

include ActionView::Helpers
include ActionView::Context
include NavbarHelper

describe NavbarHelper, :type => :helper do
  before do
    allow(self).to receive(:uri_state) { :inactive }
    allow(self).to receive(:root_url) { '/' }
  end
  describe "nav_bar" do
    it "should return a basic bootstrap navbar" 


    it "should set the fixed position to top" 


    it "should set the static position to top" 


    it "should set the fixed position to bottom" 


    it "should set the style to inverse" 


    it "should add the brand name and link it to the home page" 


    it "should be able to set the brand link url" 


    it "should add the buttons etc for a responsive layout with no block passed" 


    it "should add the buttons etc for a responsive layout with block passed" 


    it "should render contained items" 


    it "should still render the brand name even with other options turned on" 

  end

  describe "menu_group" do
    it "should return a ul with the class 'nav'" 


    it "should return a ul with class .navbar-left when passed the {pull: :left} option" 

  end

  describe "menu_item" do
    it "should return a link within an li tag" 


    it "should return the link with class 'active' if on current page" 


    it "should pass any other options through to the link_to method" 


    it "should pass a block but no name if a block is present" 


    it "should work with just a block" 


    it "should return the link with class 'active' if on current page with a block" 

  end

  describe "drop_down" do
    it "should do render the proper drop down code" 

  end

  describe "drop_down_with_submenu" do
    it "should do render the proper drop down code" 

  end

  describe "menu_divider" do
    it "should render <li class='divider-vertical'></li>" 

  end

  describe "menu_text" do
    it "should render text within p tags with class 'navbar-text" 


    it "should be able to be pulled right or left" 


    it "should be able to cope with arbitrary options being passed to the p tag" 


    it "should be able to cope with a block too" 

  end

  describe "rendering forms ok" do
    it "should not escape anything unexpectedly" 

  end

  describe "default navbar" do
    it "renders a navbar" 

  end

end

# HTML output

BASIC_NAVBAR = <<-HTML
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
  </div>
</nav>
HTML

FIXED_TOP_NAVBAR = <<-HTML
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
  </div>
</nav>
HTML

STATIC_TOP_NAVBAR = <<-HTML
<nav class="navbar navbar-default navbar-static-top" role="navigation">
  <div class="container">
  </div>
</nav>
HTML

FIXED_BOTTOM_NAVBAR = <<-HTML
<nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
  <div class="container">
  </div>
</nav>
HTML

INVERSE_NAVBAR = <<-HTML
<nav class="navbar navbar-default navbar-inverse" role="navigation">
  <div class="container">
  </div>
</nav>
HTML

NAVBAR_WITH_BRAND = <<-HTML
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <a class="navbar-brand" href="/">
      Ninety Ten
    </a>
  </div>
</nav>
HTML

NAVBAR_WITH_BRAND_AND_LINK = <<-HTML
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <a class="navbar-brand" href="http://www.ninetyten.com">
      Ninety Ten
    </a>
  </div>
</nav>
HTML

RESPONSIVE_NAVBAR = <<-HTML
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle Navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="navbar-collapse collapse">
    </div>
  </div>
</nav>
HTML

RESPONSIVE_NAVBAR_WITH_BLOCK = <<-HTML
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle Navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="navbar-collapse collapse">
              <p>Passing a block</p>
    </div>
  </div>
</nav>
HTML

PLAIN_NAVBAR_WITH_ITEM = <<-HTML
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <ul class="nav navbar-nav">
      <li>
        <a href="/">Home</a>
      </li>
      <li>
        <a href="/products">Products</a>
      </li>
    </ul>
  </div>
</nav>
HTML

BRANDED_NAVBAR_WITH_ITEM = <<-HTML
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <a class="navbar-brand" href="/">
      Something
    </a>
    <ul class="nav navbar-nav">
      <li>
        <a href="/">Home</a>
      </li>
    </ul>
  </div>
</nav>
HTML

DROPDOWN_MENU = <<-HTML
<li class="dropdown"> <a class="dropdown-toggle"data-toggle="dropdown"href="#"> Products <b class="caret"></b> </a> <ul class="dropdown-menu"> <li><a href="/">Latest</a></li> </ul> </li>
HTML

DROPDOWN_MENU_WITH_SUBMENU = <<-HTML
<li class="dropdown">
  <a class="dropdown-toggle" data-toggle="dropdown" href="#">Products <b class="caret"></b></a>
  <ul class="dropdown-menu">
    <li class="dropdown-submenu">
      <a href="">Latest</a>
      <ul class="dropdown-menu">
        <li><a href="/">Option1</a></li>
      </ul>
    </li>
  </ul>
</li>
HTML

PLAIN_NAVBAR_WITH_FORM = <<-HTML
<nav class=\"navbar navbar-default\"role=\"navigation\">
  <div class=\"container\">
    <form accept-charset=\"utf-8\" action=\"/\" method=\"get\">
      <div style=\"display:none\">
        <input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\"/>
      </div>
      <input id=\"search_stub\" name=\"search[stub]\" type=\"text\"/>
    </form>
  </div>
</nav>
HTML

