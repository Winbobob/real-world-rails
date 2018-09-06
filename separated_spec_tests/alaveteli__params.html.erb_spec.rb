# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe 'when showing diffs in info_request params' do
  def do_render(params)
    render :partial => 'admin_request/params', :locals => {:params => params}
  end

  it 'should differentiate between old, new and other' 


  it "should convert linebreaks to '<br>'s" 


  it 'should not report unchanged values as new' 

end

