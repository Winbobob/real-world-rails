require 'spec_helper'

describe PreferencesHelper do
  describe '#dashboard_choices' do
    it 'raises an exception when defined choices may be missing' 


    it 'raises an exception when defined choices may be using the wrong key' 


    it 'provides better option descriptions' 

  end

  describe '#user_application_theme' do
    context 'with a user' do
      it "returns user's theme's css_class" 


      it 'returns the default when id is invalid' 

    end

    context 'without a user' do
      it 'returns the default theme' 

    end
  end

  describe '#user_color_scheme' do
    context 'with a user' do
      it "returns user's scheme's css_class" 


      it 'returns the default when id is invalid' 

    end

    context 'without a user' do
      it 'returns the default theme' 

    end
  end

  def stub_user(messages = {})
    if messages.empty?
      allow(helper).to receive(:current_user).and_return(nil)
    else
      allow(helper).to receive(:current_user)
        .and_return(double('user', messages))
    end
  end
end

