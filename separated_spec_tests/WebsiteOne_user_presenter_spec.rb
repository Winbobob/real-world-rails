require 'spec_helper'

describe UserPresenter do
  subject { UserPresenter.new(user) }
  let(:user) { FactoryBot.build_stubbed(:user, first_name: '', last_name: '', email: '') }

  describe '#display_name' do
    it 'should display the first part of the email address when no name is given' 


    it 'should display the full name when first and last name fields are given' 


    it 'should display the first name when the last name field is empty' 


    it 'should ignore extra whitespaces' 


    it 'should display anonymous when there is no first name, last name or email' 

  end

  describe '#timezone' do
    it 'should display timezone when it can be determined' 

  end

  describe '#timezone_formatted_offset' do
    it 'should display timezone formatted offset when it can be determined' 

  end

  describe '#contributors' do
    let(:user) { create(:user) }
    let(:commit_counts) { create_list(:commit_count, 2, user: user) }

    before do
      user.follow commit_counts.first.project
    end

    it 'should only return commit counts for the projects that the user follows' 

  end

  describe 'user status' do
    let(:user) { FactoryBot.create(:user) }

    before(:each) do
      @status = FactoryBot.create_list(:status, 3,
                                        status: Status::OPTIONS[rand(Status::OPTIONS.length)],
                                        user: user)
      user.reload
    end

    it 'should have a status' 


    it 'status should be html_safe' 


    it 'status? should be true' 

  end

  describe 'empty profile fields' do
    let!(:user) { FactoryBot.create(:user) }

    it 'should return a list of all fields if they are nil' 


    it 'should return a list of all fields if they are empty' 


    it 'should return only empty fields' 

  end
end

