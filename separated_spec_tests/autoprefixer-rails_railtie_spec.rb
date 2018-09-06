require_relative 'spec_helper'

describe AutoprefixedRails::Railtie do
  before do
    @railtie = AutoprefixedRails::Railtie.instance
  end

  context 'with config/autoprefixer.yml' do
    it 'works' 

  end

  context 'with empty config/autoprefixer.yml' do
    before do
      file_path = File.join(Rails.application.root, 'config/autoprefixer.yml')
      allow(File).to receive(:exists?).with(file_path) { true }
      allow(::YAML).to receive(:load_file).with(file_path) { false } # empty yaml
    end

    it 'skips empty YAML' 


    it 'works' 

  end
end

