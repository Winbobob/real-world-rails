require 'spec_helper'

describe 'layouts/_head' do
  before do
    allow(view).to receive(:current_application_settings).and_return(Gitlab::CurrentSettings.current_application_settings)
  end

  it 'escapes HTML-safe strings in page_title' 


  it 'escapes HTML-safe strings in page_description' 


  it 'escapes HTML-safe strings in page_image' 


  def stub_helper_with_safe_string(method)
    allow_any_instance_of(PageLayoutHelper).to receive(method)
      .and_return(%q{foo" http-equiv="refresh}.html_safe)
  end
end

