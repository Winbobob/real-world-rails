# frozen_string_literal: true

describe 'UserCreatesAPublishedStrategy', js: true do
  let(:user) { create :user2, :with_allies }
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

