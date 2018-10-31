require 'spec_helper'

describe 'File constants' do
  context 'on windows', :if => windows? do
    specify('File::PATH_SEPARATOR') { expect(File::PATH_SEPARATOR).to eq(';') }
    specify('File::ALT_SEPARATOR') { expect(File::ALT_SEPARATOR).to eq("\\") }
  end

  context 'on non-windows', :unless => windows? do
    specify('File::PATH_SEPARATOR') { expect(File::PATH_SEPARATOR).to eq(':') }
    specify('File::ALT_SEPARATOR') { expect(File::ALT_SEPARATOR).to be_nil }
  end
end

describe 'Pathname constants' do
  context 'on windows', :if => windows? do
    specify('Pathname::SEPARATOR_PAT') { expect(Pathname::SEPARATOR_PAT.to_s).to eq(%r{[\\\/]}.to_s) }
  end

  context 'on non-windows', :unless => windows? do
    specify('Pathname::SEPARATOR_PAT') { expect(Pathname::SEPARATOR_PAT.to_s).to eq(%r{\/}.to_s) }
  end
end

# These specs taken from the official ruby spec for File.basename
describe 'Pathname#rspec_puppet_basename' do
  subject { Pathname.new('test') }

  it 'is not enabled by default' 


  context 'when enabled' do
    before do
      RSpec.configuration.enable_pathname_stubbing = true
    end

    it 'returns the basename of a path (basic cases)' 


    it 'returns the last component of the filename' 


    it 'returns a string' 


    it 'returns the basename for unix format' 


    it 'returns the basename for edgecases' 


    context 'on posix' do
      before do
        stub_const('Pathname::SEPARATOR_PAT', /\//)
      end

      it 'returns the basename for edgecases' 


      it 'takes into consideration the platform path separators' 

    end

    context 'on windows' do
      before do
        stub_const('Pathname::SEPARATOR_PAT', /[\\\/]/)
      end

      it 'handles UNC pathnames' 


      it 'takes into consideration the platform path separators' 


      it 'returns the basename for windows' 


      it 'returns the basename for windows with forward slash' 

    end
  end
end

