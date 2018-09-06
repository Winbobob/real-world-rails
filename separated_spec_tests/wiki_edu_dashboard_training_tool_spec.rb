# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/training_module"

DESIRED_TRAINING_MODULES = [{ slug: 'editing-basics' }].freeze

describe 'Training', type: :feature, js: true do
  let(:user) { create(:user, id: 1) }
  let(:module_2) { TrainingModule.find_by(slug: 'editing-basics') }

  before do
    login_as(user, scope: :user)
    page.driver.browser.url_blacklist = ['https://www.youtube.com', 'https://upload.wikimedia.org']
  end

  describe 'root library' do
    library_names = TrainingLibrary.all.map(&:slug)
    it 'loads for a logged-in user' 


    it 'loads for a logged-out user' 


    after do
      login_as(user, scope: :user)
    end
  end

  describe 'libraries' do
    TrainingLibrary.all.each do |library|
      describe "'#{library.name}' library" do
        it 'renders the overview' 

      end
    end

    it 'load for a logged out user' 


    after do
      login_as(user, scope: :user)
    end
  end

  describe 'module index page' do
    before do
      TrainingSlide.load
      visit "/training/students/#{module_2.slug}"
    end

    it 'describes the module' 


    it 'renders the table of contents' 


    it 'lets the user start the module' 


    it 'updates the last_slide_completed upon viewing a slide (not after clicking `next`)' 


    it 'sets the module completed on viewing the last slide' 


    it 'disables slides that have not been seen' 


    it 'shows a 404 page for non-existent slides' 


    it 'loads for a logged out user' 


    after do
      login_as(user, scope: :user)
    end
  end

  describe 'finish module button' do
    context 'logged in user' do
      it 'redirects to their dashboard' 

    end

    context 'logged out user' do
      it 'redirects to library index page' 

    end
  end

  DESIRED_TRAINING_MODULES.each do |module_slug|
    describe "'#{module_slug}' module" do
      before do
        TrainingSlide.load
        TrainingModule.flush
      end
      it 'lets the user go from start to finish' 

    end
  end
end

def go_through_module_from_start_to_finish(training_module)
  visit "/training/students/#{training_module.slug}"
  click_link 'Start'
  click_through_slides(training_module)
  sleep 1
  expect(TrainingModulesUsers.find_by(
    user_id: 1,
    training_module_id: training_module.id
  ).completed_at).not_to be_nil
end

def click_through_slides(training_module)
  slide_count = training_module.slides.count
  training_module.slides.each_with_index do |slide, i|
    check_slide_contents(slide, i, slide_count)
    unless i == slide_count - 1
      proceed_to_next_slide
      next
    end
    click_link 'Done!'
  end
end

def check_slide_contents(slide, slide_number, slide_count)
  expect(page).to have_content slide.title
  expect(page).to have_content "Page #{slide_number + 1} of #{slide_count}"
end

def proceed_to_next_slide
  button = page.first('button.ghost-button')
  find_correct_answer_by_trial_and_error unless button.nil?
  page.first('a.slide-nav.btn.btn-primary.icon-rt_arrow').trigger('click')
end

def find_correct_answer_by_trial_and_error
  (0..10).each do |current_answer|
    within('.training__slide') do
      all('input')[current_answer].click
    end
    click_button 'Check Answer'
    next_button = page.first('a.slide-nav.btn.btn-primary')
    break unless next_button['disabled'] == 'true'
  end
end

