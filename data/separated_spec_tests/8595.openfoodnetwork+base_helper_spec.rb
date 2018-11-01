require 'spec_helper'

describe Spree::BaseHelper, type: :helper do
  describe "#link_to_remove_fields" do
    let(:name) { 'Hola' }
    let(:form) { double('form_for', hidden_field: '<input type="hidden" name="_method" value="destroy">') }
    let(:options) { {} }

    subject { helper.link_to_remove_fields(name, form, options) }

    it 'returns an `a` tag followed by a hidden `input` tag' 

  end
end

