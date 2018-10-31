require 'rails_helper'

RSpec.describe UsersHelper do
  let(:user) {
     double(
      'User',
      lesson_completion_time: lesson_completion_time,
      learning_goal: learning_goal
    )
  }

  let(:lesson_completion_time) { DateTime.new(2016, 10, 11, 19) }
  let(:learning_goal) { 'To be the best' }

  describe '#lesson_time' do
    let(:lesson) { double('Lesson') }

    it 'returns formatted lesson completion time' 

  end

  describe '#display_dashboard_learning_goal' do
    it 'returns the users learning goal' 


    context 'when the user does not have a learning goal' do
      let(:learning_goal) { '' }
      let(:settings_link) {
        "Set a learning goal in your <a class=\"profile-card__link\" href=\"/users/edit\">settings</a>."
      }

      it 'returns a link to the users settings page' 

    end
  end

  describe '#display_learning_goal' do
    it 'returns the users learning goal' 


    context 'when the user does not have a learning goal set' do
      let(:learning_goal) { '' }
      it 'returns default text' 

    end
  end

  describe '#avatar_path' do
    let(:avatar) { 'http://www.github.com/image' }

    it 'returns the users image path' 


    context 'when the user doesnt have a avatar' do
      let(:avatar) { nil }

      it 'returns the default Odin avatar' 

    end
  end
end

