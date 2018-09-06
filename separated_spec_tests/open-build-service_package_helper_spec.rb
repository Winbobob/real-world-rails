require 'rails_helper'
require 'rantly/rspec_extensions'

RSpec.describe Webui::PackageHelper, type: :helper do
  describe '#nbsp' do
    it 'produces a SafeBuffer' 


    it 'escapes html' 


    it 'converts space to nbsp' 


    it 'breaks up long strings' 

  end

  describe '#title_or_name' do
    it 'returns package name when title is empty' 


    it 'returns package name when title is nil' 


    it 'returns package title when title is set' 

  end

  describe '#humanize_time' do
    it 'returns seconds' 


    it 'returns minutes and seconds' 


    it 'returns hours, minutes and seconds' 

  end

  describe '#file_url' do
    skip
  end

  describe '#rpm_url' do
    skip
  end

  describe '#human_readable_fsize' do
    skip
  end

  describe '#guess_code_class' do
    RSpec.shared_examples 'file with extension' do |extension, extension_class|
      it 'returns correct extension' 

    end
    context 'is xml' do
      it { expect(guess_code_class('_aggregate')).to eq('xml') }
      it { expect(guess_code_class('_link')).to eq('xml') }
      it { expect(guess_code_class('_patchinfo')).to eq('xml') }
      it { expect(guess_code_class('_service')).to eq('xml') }

      it 'when it ends by .service' 


      it_should_behave_like 'file with extension', 'group', 'xml'
      it_should_behave_like 'file with extension', 'kiwi', 'xml'
      it_should_behave_like 'file with extension', 'product', 'xml'
      it_should_behave_like 'file with extension', 'xml', 'xml'
    end

    context 'is shell' do
      it 'with rc-scripts' 

    end

    context 'is python' do
      it 'when it ends in rpmlintrc' 

    end

    context 'is makefile' do
      it { expect(guess_code_class('debian.rules')).to eq 'makefile' }
    end

    context 'is baselibs' do
      it { expect(guess_code_class('baselibs.conf')).to eq 'baselibs' }
    end

    context 'is spec' do
      it 'when it starts with macros.' 

    end

    context 'is diff' do
      it_should_behave_like 'file with extension', 'patch', 'diff'
      it_should_behave_like 'file with extension', 'dif', 'diff'
      it_should_behave_like 'file with extension', 'diff', 'diff'
    end

    context 'is perl' do
      it_should_behave_like 'file with extension', 'pl', 'perl'
      it_should_behave_like 'file with extension', 'pm', 'perl'
      it_should_behave_like 'file with extension', 'perl', 'perl'
    end

    context 'is python' do
      it_should_behave_like 'file with extension', 'py', 'python'
    end

    context 'is ruby' do
      it_should_behave_like 'file with extension', 'rb', 'ruby'
    end

    context 'is latex' do
      it_should_behave_like 'file with extension', 'tex', 'latex'
    end

    context 'is javascript' do
      it_should_behave_like 'file with extension', 'js', 'javascript'
    end

    context 'is shell' do
      it_should_behave_like 'file with extension', 'sh', 'shell'
    end

    context 'is rpm-spec' do
      it_should_behave_like 'file with extension', 'spec', 'rpm-spec'
    end

    context 'is rpm-changes' do
      it_should_behave_like 'file with extension', 'changes', 'rpm-changes'
    end

    context 'is php' do
      it_should_behave_like 'file with extension', 'php', 'php'
    end

    context 'is html' do
      it_should_behave_like 'file with extension', 'html', 'html'
    end

    context 'is dockerfile' do
      it 'when it starts with Dockerfile.' 


      it { expect(guess_code_class('Dockerfile')).to eq('dockerfile') }
      it { expect(guess_code_class('dockerfile')).to eq('dockerfile') }
    end

    context 'css' do
      it_should_behave_like 'file with extension', 'css', 'css'
    end

    context 'other' do
      it { expect(guess_code_class('other')).to eq '' }
    end
  end

  describe '#package_bread_crumb' do
    skip
  end

  describe '#uploadable?' do
    it { expect(uploadable?('image.raw.xz', 'x86_64')).to be_truthy }
    it { expect(uploadable?('image.vhdfixed.xz', 'x86_64')).to be_truthy }
    it { expect(uploadable?('image.vhdfixed.xz', 'i386')).to be_falsy }
    it { expect(uploadable?('apache2.rpm', 'x86_64')).to be_falsy }
  end
end

