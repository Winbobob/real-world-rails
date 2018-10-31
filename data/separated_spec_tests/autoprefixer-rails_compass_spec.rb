require_relative 'spec_helper'

COMPASS_DIR     = Pathname(__FILE__).dirname.join('compass')
STYLESHEETS_DIR = COMPASS_DIR.join('stylesheets')

describe 'Compass integration' do
  after do
    STYLESHEETS_DIR.rmtree if STYLESHEETS_DIR.exist?
  end

  it 'works from config.rb' 


end

