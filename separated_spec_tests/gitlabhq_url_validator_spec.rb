require 'spec_helper'

describe UrlValidator do
  let(:validator) { described_class.new(attributes: [:link_url],  **options) }
  let!(:badge) { build(:badge) }

  subject { validator.validate_each(badge, :link_url, badge.link_url) }

  describe '#validates_each' do
    context 'with no options' do
      let(:options) { {} }

      it 'allows http and https protocols by default' 


      it 'checks that the url structure is valid' 

    end

    context 'with protocols' do
      let(:options) { { protocols: %w(http) } }

      it 'allows urls with the defined protocols' 


      it 'add error if the url protocol does not match the selected ones' 

    end
  end
end

