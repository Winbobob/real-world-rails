require 'spec_helper'

module Spree
  describe Migrations do
    subject { described_class.new(config, 'spree') }

    let(:app_migrations) { ['.', '34_add_title.rb', '52_add_text.rb'] }
    let(:engine_migrations) { ['.', '334_create_orders.spree.rb', '777_create_products.spree.rb'] }

    let(:config) { double('Config', root: 'dir') }

    let(:engine_dir) { 'dir/db/migrate' }
    let(:app_dir) { "#{Rails.root}/db/migrate" }

    before do
      expect(File).to receive(:directory?).with(app_dir).and_return true
    end

    it 'warns about missing migrations' 


    context 'no missing migrations' do
      it 'says nothing' 

    end
  end
end
