# frozen_string_literal: true

require 'rails_helper'
require 'rake'

describe 'sitemap:generate' do
  def sitemap_path
    Gem.loaded_specs['sitemap'].full_gem_path
  end

  let(:user) { create(:user) }
  let!(:file) { create(:public_work, depositor: user.login) }
  let!(:private_file) { create(:private_work, depositor: user.login) }
  let!(:collection) { create(:collection, depositor: user.login) }

  before do
    # set up the rake environment
    load_rake_environment ["#{sitemap_path}/lib/tasks/sitemap.rake"]
  end

  describe 'sitemap generation', clean: true do
    it 'includes public generic files and users' 

  end
end

