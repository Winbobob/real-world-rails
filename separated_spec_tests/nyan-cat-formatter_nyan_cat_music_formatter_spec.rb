require 'spec_helper'
require 'stringio'
require 'fileutils'
require 'nyan_cat_music_formatter'

class MockKernel
  def system(string)
    seen << string
  end

  def spawn(string)
    seen << string
    rand(10000)
  end

  def seen
    @seen ||= []
  end
end

describe NyanCatMusicFormatter do
  let(:path_to_mp3) { NyanCatMusicFormatter.new(NyanCatFormatter).nyan_mp3 }
  let(:stdout)      { StringIO.new }
  let(:formatter)   { described_class.new stdout }
  let(:mock_kernel) { MockKernel.new }

  before { formatter.kernel = mock_kernel }

  describe 'kernel' do
    it 'defaults to Kernel' 


    it 'can be set' 

  end

  describe 'platform' do
    it 'defaults to RUBY_PLATFORM' 


    it 'can be set' 

  end

  describe 'start' do
    before do
      allow(Process).to receive(:wait) { sleep 1 }
      allow(Process).to receive(:kill).and_return(true)
    end

    it 'sets the total amount of specs' 


    it 'sets the current to 0' 


    context 'when on OS X' do
      before { formatter.platform = 'darwin' }

      it 'plays the song in the background' 

    end

    context 'when on linux' do
      before { formatter.platform = 'linux'}

      it 'plays the song for linux too with mpg123 when available' 


      it 'plays the song for linux too with mpg321 when available' 

    end

    context 'when on Windows' do
      before { formatter.platform = 'windows' }

      it 'does not play the song' 

    end

    context 'when the music file does not exist' do
      before do
        FileUtils.mv path_to_mp3, "#{ path_to_mp3 }.tmp"
      end

      after do
        FileUtils.mv "#{ path_to_mp3 }.tmp", path_to_mp3
      end

      it "won't try to play anything" 

    end
  end
end

