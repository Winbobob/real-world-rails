require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/dashboard/show.html" do
  before(:each) do
    allow(view).to receive(:enki_config).and_return(Enki::Config.default)
  end

  after(:each) do
    expect(rendered).to be_valid_html5_fragment
  end

  it 'should render' 

end

