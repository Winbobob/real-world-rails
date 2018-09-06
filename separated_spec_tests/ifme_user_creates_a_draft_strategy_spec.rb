# frozen_string_literal: true

describe 'UserCreatesADraftStrategy', js: true do
  let(:user) { create :user2, :with_allies }
  let(:ally) { user.allies.first }
  let!(:category) { create :category, userid: user.id }

  def hit_down_arrow
    keypress = 'var e = $.Event("keydown", { keyCode: 40 }); $("body").trigger(e);'
    page.driver.execute_script(keypress)
  end

  feature 'Creating, viewing, and editing a strategy' do
    it 'is not successful' 


    it 'is successful' 

  end
end

