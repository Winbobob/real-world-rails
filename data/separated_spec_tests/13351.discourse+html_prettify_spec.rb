require 'rails_helper'
require 'html_prettify'

describe HtmlPrettify do

  def t(source, expected)
    expect(HtmlPrettify.render(source)).to eq(expected)
  end

  it 'correctly prettifies html' 


end

