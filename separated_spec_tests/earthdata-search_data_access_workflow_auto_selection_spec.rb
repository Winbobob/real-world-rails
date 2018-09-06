require 'spec_helper'

describe 'Data Access workflow', reset: false do
  context 'When a collection has only a single download mechanism' do
    before(:all) do
      load_page :search, project: ['C1000000020-LANCEAMSR2'], view: :project
      login

      click_button 'Download project data'
      wait_for_xhr
    end

    it 'preselects the only option available' 

  end

  context 'When a collection has two download mechanisms' do
    before(:all) do
      load_page :search, project: ['C179003620-ORNL_DAAC'], view: :project
      login

      click_button 'Download project data'
      wait_for_xhr
    end

    it 'does not select either option' 

  end
end

