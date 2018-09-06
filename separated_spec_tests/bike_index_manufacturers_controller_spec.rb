require 'spec_helper'

describe ManufacturersController do
  describe 'index' do
    it 'renders with revised_layout' 

  end
  describe 'tsv' do
    before do
      get :tsv
    end
    it { is_expected.to respond_with(:redirect) }
  end
end

