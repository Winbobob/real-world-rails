require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/pages/new.html" do
  after(:each) do
    expect(rendered).to be_valid_html5_fragment
  end

  it 'should render' 

end

