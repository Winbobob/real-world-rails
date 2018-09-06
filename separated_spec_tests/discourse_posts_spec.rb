require 'rails_helper'
require 'highline/import'
require 'highline/simulate'

RSpec.describe "Post rake tasks" do
  let!(:post) { Fabricate(:post, raw: 'The quick brown fox jumps over the lazy dog') }
  let!(:tricky_post) { Fabricate(:post, raw: 'Today ^Today') }

  before do
    Rake::Task.clear
    Discourse::Application.load_tasks
    STDOUT.stubs(:write)
  end

  describe 'remap' do
    it 'should remap posts' 


    context 'when type == string' do
      it 'remaps input as string' 

    end

    context 'when type == regex' do
      it 'remaps input as regex' 

    end
  end

  describe 'rebake_match' do
    it 'rebakes matched posts' 

  end
end

