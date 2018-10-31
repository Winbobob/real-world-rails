require 'rails_helper'
require 'rantly/rspec_extensions'

RSpec.describe Webui::PackageHelper, type: :helper do
  describe '#removable_file?' do
    let(:package) { create(:package, name: 'bar') }

    it { expect(removable_file?(file_name: 'foo',               package: package)).to be true }
    it { expect(removable_file?(file_name: '_service',          package: package)).to be true }
    it { expect(removable_file?(file_name: '_service:sub_file', package: package)).to be false }

    context 'a product package (_product)' do
      let(:package) { create(:package, name: '_product') }

      it 'can be removed' 

    end

    context 'a product sub package (_product:*)' do
      let(:project) { create(:project) }
      let(:product_sub_package) { create(:package, name: '_product:foo', project: project) }

      context 'that belongs to a _product file' do
        before do
          allow(product_sub_package).to receive(:belongs_to_product?).and_return(true)
        end

        it { expect(removable_file?(file_name: 'foo', package: product_sub_package)).to be false }
      end

      context 'that does not belong to a _product file' do
        before do
          allow(product_sub_package).to receive(:belongs_to_product?).and_return(false)
        end

        it { expect(removable_file?(file_name: 'foo', package: product_sub_package)).to be true }
      end
    end
  end

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
      it { expect(guess_code_class('debian.rules')).to eq('makefile') }
    end

    context 'is baselibs' do
      it { expect(guess_code_class('baselibs.conf')).to eq('baselibs') }
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
      it { expect(guess_code_class('other')).to eq('') }
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

  describe '#expand_diff?' do
    it { expect(expand_diff?('ctris.spec', 'added')).to be true }
    it { expect(expand_diff?('_patchinfo', 'added')).to be true }
    it { expect(expand_diff?('ctris.changes', 'added')).to be true }
    it { expect(expand_diff?('ctris.changes', 'deleted')).to be false }
    it { expect(expand_diff?('/foo/bar/test.txt', 'added')).to be false }
  end

  describe '#badge_for_diff_state' do
    it { expect(badge_for_diff_state('added')).to eq('badge-success') }
    it { expect(badge_for_diff_state('deleted')).to eq('badge-danger') }
    it { expect(badge_for_diff_state('changed')).to eq('badge-warning') }
    it { expect(badge_for_diff_state('other')).to eq('badge-primary') }
  end

  describe '#calculate_revision_on_state' do
    it { expect(calculate_revision_on_state('1', 'deleted')).to eq(0) }
    it { expect(calculate_revision_on_state('0', 'deleted')).to eq(0) }
    it { expect(calculate_revision_on_state('1', 'added')).to eq(1) }
  end
end

