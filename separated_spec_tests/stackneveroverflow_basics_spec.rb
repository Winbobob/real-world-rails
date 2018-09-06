require 'spec_helper'

class BasicsSpec < Less::Rails::Spec
  
  it 'must render variables' 

  
  it 'must render mixins' 

  
  it 'must be able to use vendored less files' 

  
  describe 'less import dependency hooks' do
    
    it 'must update when imported file changes' 

    
    it 'must update when an imported file of another imported file changes' 


    it 'must update when an imported file of another imported file changes, and that file is imported via a relative path' 


  end

  describe 'relative path setting must be effective' do
    after do
      Rails.application.config.less.raw.clear
    end

    it 'must use relavite paths by default' 


    it 'should respond to config modification' 

  end

  protected
  
  def basics
    dummy_asset 'basics'
  end
  
  def mixins_asset
    dummy_assets['frameworks/bootstrap/mixins.less']
  end
  
  def variables_asset
    dummy_assets['frameworks/bootstrap/variables.less']
  end

  def variables_via_relative_path_asset
    dummy_assets['frameworks/bootstrap/variables_via_relative_path.less']
  end

  def safely_edit(name)
    asset = send :"#{name}_asset"
    data = File.read(asset.pathname)
    begin
      yield data.dup, asset
    ensure
      File.open(asset.pathname,'w') { |f| f.write(data) }
    end
  end
end

