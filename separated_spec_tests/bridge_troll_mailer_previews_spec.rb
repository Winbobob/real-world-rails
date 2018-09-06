require 'rails_helper'

require Rails.root.join('db', 'seeds', 'seed_event')
Dir[Rails.root.join("app", "mailers", "*.rb")].each { |f| require f }
Dir[Rails.root.join("spec", "mailers", "previews", "**", "*.rb")].each { |f| require f }

RSpec.describe 'mailer previews' do
  def find_preview_class(mailer_class)
    mailer_name = mailer_class.to_s.sub('Mailer', '')
    "#{mailer_name}Preview".constantize
  end

  def find_leaves(klass)
    subclasses = klass.subclasses
    return klass if subclasses.empty?

    subclasses.map { |klass| find_leaves(klass) }.flatten
  end

  before do
    Seeder.seed_event(students_per_level_range: (1..1))
    Seeder.seed_multiple_location_event
  end

  it 'has a preview for every devise mail' 


  describe 'for non-devise mailer classes' do
    before do
      @mailer_classes = find_leaves(ActionMailer::Base) - [Devise::Mailer]

      # Sanity check that these subclass shenanigans are still working
      expect(@mailer_classes.length).to be > 2
    end

    it 'has a preview for every normal mail' 

  end
end

