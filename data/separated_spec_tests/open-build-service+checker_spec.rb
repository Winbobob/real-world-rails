require 'rails_helper'
require File.expand_path(File.join(Rails.root, 'db', 'checker'))

RSpec.describe DB::Checker do
  let!(:checker) { DB::Checker.new }

  describe '#warn_for_rerun' do
    it 'shows a warning message if failed' 


    it 'shows a greeting message if worked' 

  end

  describe '#warn_for_environment' do
    it 'shows a warning message if not in production environment' 


    it 'shows nothing if in production environment' 

  end

  describe '#initialize' do
    it "can't be failed before runnig" 

  end

  describe '#contraints_to_check' do
    it { expect(checker.contraints_to_check).to be_a(Array) }
    it { expect(checker.contraints_to_check).not_to be_empty }
    it 'constraints are well defined' 

  end

  describe '#check_foreign_keys' do
    context 'without inconsistent records' do
      before do
        allow(checker).to receive(:check_foreign_key).and_return([])
      end

      it { expect { checker.check_foreign_keys }.to output(/OK/).to_stdout }
      it { expect { checker.check_foreign_keys }.not_to output(/Trying to fix/).to_stdout }
    end

    context 'with inconsistent records' do
      before do
        allow(checker).to receive(:check_foreign_key).and_return([1, 2, 3])
        allow(checker).to receive(:ask_for_fixing)
      end

      it { expect { checker.check_foreign_keys }.to output(/FAIL/).to_stdout }
      it { expect { checker.check_foreign_keys }.to output(/Trying to fix/).to_stdout }
    end
  end

  describe '#resolve_devel_packages' do
    let(:project) { create(:project) }
    let(:package_without_cycle) do
      package = create(:package, project: project)
      package.develpackage = create(:package, project: project)
      package.save
    end
    let(:package_with_cycle) do
      package = create(:package, project: project)
      package.develpackage = package
      package.save
    end

    context 'without problematic packages' do
      before { package_without_cycle }

      it { expect { checker.resolve_devel_packages }.to output(/OK/).to_stdout }
      it { expect { checker.resolve_devel_packages }.not_to output(/Errors detected at project/).to_stdout }
    end

    context 'with problematic packages' do
      before { package_with_cycle }

      it { expect { checker.resolve_devel_packages }.to output(/FAIL/).to_stdout }
      it { expect { checker.resolve_devel_packages }.to output(/Errors detected at project/).to_stdout }
    end
  end
end

