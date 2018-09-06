require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::SetFlashMatcher, type: :controller do
  it_behaves_like 'set session or flash matcher' do
    def store_name
      'flash'
    end

    def set_store
      set_flash
    end

    def store_within(controller)
      controller.flash
    end
  end

  it_behaves_like 'set session or flash matcher' do
    def store_name
      'flash.now'
    end

    def set_store
      set_flash.now
    end

    def store_within(controller)
      controller.flash.now
    end
  end

  context 'when the controller sets both flash and flash.now' do
    it 'does not mix flash and flash.now' 

  end

  context 'when the now qualifier is called after the key is set' do
    it 'raises a QualifierOrderError' 

  end

  context 'when the now qualifier is called after the to qualifier' do
    it 'raises a QualifierOrderError' 

  end
end

