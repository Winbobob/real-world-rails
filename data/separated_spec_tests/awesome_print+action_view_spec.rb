require 'spec_helper'

RSpec.describe 'AwesomePrint ActionView extensions', skip: -> { !ExtVerifier.has_rails? }.call do

  before do
    @view = ActionView::Base.new
  end

  it "uses HTML and adds 'debug_dump' class to plain <pre> tag" 


  it "uses HTML and adds 'debug_dump' class to colorized <pre> tag" 

end

