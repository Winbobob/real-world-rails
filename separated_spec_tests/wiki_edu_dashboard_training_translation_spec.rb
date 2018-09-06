# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/training_module"
require "#{Rails.root}/lib/data_cycle/training_update"

def flush_training_caches
  TrainingModule.flush
  TrainingLibrary.flush
end

describe 'Training Translations', type: :feature, js: true do
  let(:basque_user) { create(:user, id: 2, username: 'ibarra', locale: 'eu') }

  before do
    page.driver.browser.url_blacklist = ['https://www.youtube.com', 'https://upload.wikimedia.org']
    allow(Features).to receive(:wiki_trainings?).and_return(true)
    flush_training_caches
    VCR.use_cassette 'training/slide_translations' do
      TrainingUpdate.new(module_slug: 'all')
    end
    login_as(basque_user, scope: :user)
  end

  after { flush_training_caches }

  it 'shows the translated text of a quiz' 


  it 'shows the translated names in the table of contents' 


  # Make sure default trainings get reloaded
  after(:all) { TrainingModule.load_all }
end
