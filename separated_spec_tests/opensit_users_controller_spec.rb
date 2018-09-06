require 'spec_helper'

describe UsersController, :type => :controller do
  before do
    @buddha = create(:user, username: 'buddha')
  end

  describe 'GET /me' do
    context 'signed in' do
      it 'should display the /me page' 

    end

    context 'logged out' do
      it 'redirects to the front page' 

    end
  end

  describe 'GET /u/:username' do
    context 'no date range' do
      it 'displays user page' 

    end

    context 'username has period' do
      it 'displays user page' 

    end

    context 'date specified' do
      # context 'year' do
      #   it 'loads sits from that year' do
      #     create :sit, user: @buddha, created_at: Date.today
      #     create :sit, user: @buddha, created_at: Date.today - 365
      #     expect(@buddha.sits.count).to eq 2

      #     get :show, username: 'buddha', year: Date.today.year
      #     expect(assigns(:sits)).to have(1).items
      #     expect(assigns(:sits)).to eq(@buddha.sits_by_year(Date.today.year).communal.newest_first)
      #     expect(response).to render_template("users/show")
      #   end

      #   context 'invalid year' do
      #     it 'over 3000' do
      #       get :show, username: 'buddha', year: '3001'
      #       expect(response).to redirect_to("/u/buddha")
      #       expect(flash[:error]).to eq('Invalid year!')
      #     end

      #     it 'non-numerical' do
      #       get :show, username: 'buddha', year: 'non-numerical'
      #       expect(response).to redirect_to("/u/buddha")
      #       expect(flash[:error]).to eq('Invalid year!')
      #     end
      #   end
      # end

      context 'month' do
        it 'loads sits from that month' 


        context 'invalid month' do
          it 'over 12' 


          it 'non-numerical' 

        end
      end
    end

  end

  describe 'Profiles details and edit' do
    context 'someone elses' do
      it 'load profile' 

    end
    context 'own profile' do
      it 'load profile with edit button' 

    end
  end

  describe 'GET /u/:username/following' do
    it 'loads following page' 

  end

  describe 'GET /u/:username/followers' do
    it 'loads followers page' 

  end

  describe 'GET /u/:username/export' do
    it 'returns XML' 


    it 'returns JSON' 

  end

  describe 'GET /feed' do
    before do
      @ananda = create :user, username: 'ananda'
      @sariputta = create :user, username: 'sariputta'

      create :sit, user: @ananda, body: 'un'
      create :sit, user: @sariputta, body: 'deux'
      create :sit, user: @sariputta, body: 'erpderp'
      create :sit, user: @buddha, body: 'trois'
      create :sit, user: @buddha, body: 'private!!!', private: true
    end

    context 'user feed' do
      it 'should generate an Atom feed' 


      it 'shows only posts from that user' 


      it 'should not include private posts' 

    end

    context 'global feed' do
      before do
        get :feed, format: 'atom', scope: 'global'
      end

      it 'should generate an Atom feed' 


      it 'should include content from all users' 


      it 'should not include private posts' 

    end
  end

end

