require 'spec_helper'

RSpec.describe SeriesController, type: :controller do
  include LoginMacros
  include RedirectExpectationHelper
  let(:user) { create(:user) }
  let(:series) { create(:series, pseuds: user.pseuds) }

  describe 'new' do
    it 'assigns a series' 

  end

  describe 'edit' do
    it 'redirects to orphan if there are no pseuds left' 

  end

  describe 'create' do
    it 'renders new if the series is invalid' 


    it 'gives notice and redirects on a valid series' 

  end

  describe 'update' do
    it 'redirects and errors if removing the last author of a series' 


    xit 'allows you to change the pseuds associated with the series' do
      fake_login_known_user(user)
      new_pseud = create(:pseud)
        put :update, params: { series: { author_attributes: { ids: [user.id] } }, id: series, pseud: { byline: new_pseud.byline } }
      it_redirects_to_with_notice(series_path(series), \
                                  "Series was successfully updated.")
      series.reload
      expect(series.pseuds).to include(new_pseud)
    end

    it 'renders the edit template if the update fails' 

  end

  describe 'update_positions' do
    it 'updates the position and redirects' 

  end

  describe 'destory' do
    it 'on an exception gives an error and redirects' 

  end
end

