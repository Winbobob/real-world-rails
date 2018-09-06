require 'spec_helper'

describe LabelFormatsController, js: true do

  subject { page }
  let(:user) { people(:top_leader) }
  let(:toggle) { find('label[for=show_global_label_formats]') }

  before :each do
    sign_in
    visit label_formats_path
  end

  def expect_global_to_be(state)
    if state == :visible
      is_expected.to have_selector('.global-formats', visible: true)
    else
      is_expected.to have_selector('.global-formats', visible: false)
    end
  end

  context 'if display global enabled' do
    before :each do
      user.update(show_global_label_formats: true)
    end

    it 'displays global label formats' 


    it 'hides global formats if switch is toggled' 

  end

  context 'if display global is disabled' do
    before :each do
      user.update(show_global_label_formats: false)
    end

    it 'displays global label formats' 


    it 'hides global formats if switch is toggled' 

  end
end

