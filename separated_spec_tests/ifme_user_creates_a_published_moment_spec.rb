describe 'UserCreatesAPublishedMoment', js: true do
  let(:user) { create :user2, :with_allies }
  let!(:category) { create :category, userid: user.id }
  let!(:mood) { create :mood, userid: user.id }
  let!(:strategy) { create :strategy, userid: user.id }

  def hit_down_arrow
    page.driver.execute_script(<<~JS)
      var e = $.Event("keydown", { keyCode: 40 });
      $("body").trigger(e);
    JS
  end

  feature 'Creating, viewing, and editing a moment' do
    it 'is not successful' 


    it 'is successful' 

  end
end

