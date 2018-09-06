require 'spec_helper'

describe Locomotive::Shared::SiteMetafieldsHelper do

  let(:ui)            { { 'label' => 'Store settings', 'hint' => 'Lorem ipsum', 'icon' => 'shopping-cart' } }
  let(:current_site)  { build(:site, metafields_ui: ui) }

  subject { current_site_metafields_ui }

  it { expect(subject[:label]).to eq 'Store settings' }
  it { expect(subject[:title]).to eq 'Store settings' }
  it { expect(subject[:hint]).to eq 'Lorem ipsum' }
  it { expect(subject[:icon]).to eq 'far fa-shopping-cart' }

  describe 'no ui' do

    let(:ui) { {} }

    it { expect(subject[:label]).to eq 'Properties' }
    it { expect(subject[:title]).to eq 'Editing properties' }
    it { expect(subject[:hint]).to eq '' }
    it { expect(subject[:icon]).to eq 'far fa-newspaper' }

  end

  describe 'localized' do

    let(:ui) { { 'label' => { 'default' => 'Store settings', 'fr' => 'Paramètres e-commerce' } } }

    it { expect(subject[:label]).to eq 'Store settings' }

    it 'renders the label in a different locale' 


    it 'renders the default label in an unkown locale' 


  end

end


