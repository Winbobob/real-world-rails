require_relative 'spec_helper'

describe CssController, type: :controller do
  before :all do
    cache = Rails.root.join('tmp/cache')
    cache.rmtree if cache.exist?
  end

  def test_file(file)
    if Rails.version.split('.').first.to_i >= 5
      get :test, params: { file: file }
    else
      get :test, file: file
    end
  end

  it "integrates with Rails and Sass" 


  if Sprockets::Context.instance_methods.include?(:evaluate)
    it 'supports evaluate' 

  end

  if sprockets_4?
    it "works with sprockets 4 source maps" 

  end
end

describe 'Rake task' do
  it "shows debug" 

end

