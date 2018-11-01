require 'spec_helper'

class HelpersSpec < Less::Rails::Spec
  
  before { dummy_config.less.compress = false }
  
  let(:helpers) { dummy_asset('helpers') }
  
  it 'parse asset paths' 

  
  it 'parses data urls ' 



  private
  
  def line_for_helper(name)
    helpers.each_line.detect{ |line| line.include? name }.strip
  end

end

