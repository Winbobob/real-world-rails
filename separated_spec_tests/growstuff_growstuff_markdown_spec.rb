require 'rails_helper'
require 'haml/filters'
require 'haml/filters/growstuff_markdown'

def input_link(name)
  "[#{name}](crop)"
end

def output_link(crop, name = nil)
  url = Rails.application.routes.url_helpers.crop_url(crop, host: Growstuff::Application.config.host)
  return "<a href=\"#{url}\">#{name}</a>" if name
  "<a href=\"#{url}\">#{crop.name}</a>"
end

def input_member_link(name)
  "[#{name}](member)"
end

def output_member_link(member, name = nil)
  url = Rails.application.routes.url_helpers.member_url(member, only_path: true)
  return "<a href=\"#{url}\">#{name}</a>" if name
  "<a href=\"#{url}\">#{member.login_name}</a>"
end

describe 'Haml::Filters::Growstuff_Markdown' do
  it 'is registered as the handler for :growstuff_markdown' 


  it 'converts quick crop links' 


  it "doesn't convert nonexistent crops" 


  it "doesn't convert escaped crop links" 


  it "handles multiple crop links" 


  it "converts normal markdown" 


  it "finds crops case insensitively" 


  it "fixes PT bug #78615258 (Markdown rendering bug with URLs and crops in same text)" 


  it 'converts quick member links' 


  it "doesn't convert nonexistent members" 


  it "doesn't convert escaped members" 


  it 'converts @ member links' 


  it "doesn't convert invalid @ members" 


  it "doesn't convert nonexistent @ members" 


  it "doesn't convert escaped @ members" 

end

