require 'rails_helper'

describe UserLoginWorker, type: :worker do
  let(:worker) { UserLoginWorker.new }
  let(:analyzer) { double(:analyzerm ,track: true, track_with_attributes: true) }
  let(:classroom) { create(:classroom) }
  let(:teacher) { classroom.owner }
  let(:student) { create(:student, classrooms: [classroom]) }

  before do
    allow(Analyzer).to receive(:new) { analyzer }
  end

  context 'when a teacher logs in' do
    it 'track teacher sign in' 

  end

  context 'when student with teacher logs in' do

    it 'track teacher student sign in and student sign in' 

  end

  context 'student with no teacher logs in' do
    let(:student) { create(:student, classrooms: []) }

    it 'should track student signin' 

  end
end

