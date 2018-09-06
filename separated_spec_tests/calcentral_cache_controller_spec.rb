describe CacheController do

  let (:user_id) { rand(99999).to_s }
  before do
    session['user_id'] = user_id
    Rails.env.stub(:production?).and_return(true)
  end

  context 'a non-superuser' do
    before do
      User::Auth.stub(:where).and_return([User::Auth.new(uid: user_id, is_superuser: false, active: true)])
    end

    it 'should not allow non-admin users to clear cache' 


    it 'should not allow non-admin users to delete a specific key' 

  end

  context 'a superuser' do

    before do
      User::Auth.stub(:where).and_return([User::Auth.new(uid: user_id, is_superuser: true, active: true)])
    end

    it 'should allow superusers to clear the cache' 


    it 'should delete a specific key' 

  end

end

