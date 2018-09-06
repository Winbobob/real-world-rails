require 'spec_helper'

describe LayoutHelper, :type => :helper do

  describe '#show_layout_flash?' do
    subject { show_layout_flash? }

    context 'without a layout flash' do
      before { @layout_flash = nil }
      it { is_expected.to be_truthy }
    end

    context 'with a layout flash' do
      before { @layout_flash = 'layout flash' }
      it { is_expected.to be_truthy }
    end
  end

  describe '#flash_messages' do

    context 'without :layout_flash set' do
      let(:opts){ Hash.new }
      before { flash_messages(opts) }

      it 'sets @layout_flash to true' 

    end

    context 'with :layout_flash set' do
      let(:opts){ {:layout_flash => false} }
      before { flash_messages(opts) }

      it 'sets @layout_flash opts(:layout_flash)' 

    end

    context 'with or without :layout_flash set' do
      before { flash[:notice] = 'notice_flash' }
      let(:opts){ {:layout_flash => false} }
      subject(:output) { flash_messages(opts) }

      it 'will have flash message' 

      it 'will have div with id for each flash' 

    end
  end
end

