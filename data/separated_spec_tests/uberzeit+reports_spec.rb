require 'spec_helper'

describe 'routing of the summaries' do


  context 'user specific' do

    describe 'overview' do
      it 'routes /reports/overview/users/:id to overview#index' 

    end

    describe 'work' do
      it 'routes /reports/work/users/:id to my_work#year' 

    end
  end

  context 'user list' do

    describe 'work' do
      it 'routes /reports/work to work#show' 

    end

    describe 'absence' do

      it 'routes /reports/absences to absence#show' 


      it 'routes /reports/absences-calendar to absence#calendar' 

    end

    describe 'vacation' do

      it 'routes /reports/vacation to vacation#show' 

    end

  end
end

