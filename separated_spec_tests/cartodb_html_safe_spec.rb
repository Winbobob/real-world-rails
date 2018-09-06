require 'active_support/core_ext/object/blank'
require_relative '../../../app/helpers/carto/html_safe'

describe Carto::HtmlSafe do
  let(:html_safe) do
    class TestModule; include Carto::HtmlSafe; end.new
  end

  it 'sets target="blank" for links' 


  it 'does not set target="blank" for mailto markdown' 


  it 'does not set target="blank" for mailto links' 

end

