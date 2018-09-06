require 'rails_helper'

describe Emojifier do
  let(:normal) { "Hi I'm some text" }
  let(:html) { "<a href=\"loomio.org\">Click me!</a><br/>" }
  let(:weird) { "&%<\n\r\"\u2028\u2029!+=" }
  let(:with_shortcode) { ":sad_noodle:" }
  let(:with_emoji) { ":heart:" }

  before do
    expect(Raven).to_not receive :capture_exception
  end

  it 'renders text normally' 


  it 'renders absolute urls for emojis' 


  it 'can handle html' 


  it 'can handle quotes and other odd characters' 


  it 'emojifies shortcodes with corresponding emoji' 


  it 'does not emojify non-shortcodes' 


  it 'can get just the image source for an emoji' 


  it 'returns nil if emoji shortcode not found' 


  def emojify(text)
    Emojifier.emojify!(text)
  end

  def emojify_src(text)
    Emojifier.emojify_src!(text)
  end

end

