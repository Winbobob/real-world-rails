require "rails_helper"

describe "Oauth::Authorization" do
  
  #credentials=#<OmniAuth::AuthHash expires=false token="fc6c66e14ccfe22e33ae2390d9db791a23b89415">
  let(:credentials) { OmniAuth::AuthHash.new({expires: false, token: "fc6c66e14ccfe22e33ae2390d9db791a23b89415"}) }
  
  #raw_info=#<OmniAuth::AuthHash avatar_url="https://avatars.githubusercontent.com/u/498298?v=3" bio=nil blog="http://www.youboox.fr" company="Youboox" created_at="2010-11-26T20:03:04Z" email="vdaubry@gmail.com" events_url="https://api.github.com/users/vdaubry/events{/privacy}" followers=23 followers_url="https://api.github.com/users/vdaubry/followers" following=6 following_url="https://api.github.com/users/vdaubry/following{/other_user}" gists_url="https://api.github.com/users/vdaubry/gists{/gist_id}" gravatar_id="" hireable=false html_url="https://github.com/vdaubry" id=498298 location="Paris" login="vdaubry" name="vincent daubry" organizations_url="https://api.github.com/users/vdaubry/orgs" public_gists=12 public_repos=40 received_events_url="https://api.github.com/users/vdaubry/received_events" repos_url="https://api.github.com/users/vdaubry/repos" site_admin=false starred_url="https://api.github.com/users/vdaubry/starred{/owner}{/repo}" subscriptions_url="https://api.github.com/users/vdaubry/subscriptions" type="User" updated_at="2015-03-27T11:45:03Z" url="https://api.github.com/users/vdaubry">
  let(:raw_info) { OmniAuth::AuthHash.new({avatar_url:"https://avatars.githubusercontent.com/u/498298?v=3", bio: nil, blog: "http://www.youboox.fr", company: "Youboox", created_at: "2010-11-26T20:03:04Z", email: "vdaubry@gmail.com", followers: 23, following: 6, gravatar_id: "", hireable: false, html_url: "https://github.com/vdaubry", id: 498298, location: "Paris", login: "vdaubry", name: "vincent daubry", public_gists: 12, public_repos: 40, site_admin: false,  type: "User", updated_at: "2015-03-27T11:45:03Z" }) }
  
  #extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash>>
  let(:extra) { OmniAuth::AuthHash.new({raw_info: raw_info}) }
  
  #info=<OmniAuth::AuthHash::InfoHash email="vdaubry@gmail.com" image="https://avatars.githubusercontent.com/u/498298?v=3" name="vincent daubry" nickname="vdaubry" urls=#<OmniAuth::AuthHash Blog="http://www.youboox.fr" GitHub="https://github.com/vdaubry">>
  let(:info) { OmniAuth::AuthHash.new({email: "vdaubry@gmail.com", image: "https://avatars.githubusercontent.com/u/498298?v=3", name: "vincent daubry", nickname: "vdaubry"}) }
  
  #<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash> extra=#<OmniAuth::AuthHash> info=#<OmniAuth::AuthHash::InfoHash> provider="github" uid="498298">
  let(:auth_hash) { OmniAuth::AuthHash.new({credentials: credentials, extra: extra, info: info, provider: "github", uid: "498298"}) }
  
  
  describe "authorize" do
    context "new user" do
      it "creates user" 

      
      it "creates authentication provider" 

      
      it "returns user" 

    end
    
    context "user already exists" do
      before(:each) do
        @user = FactoryGirl.create(:user, github_id: '498298', location: "foo", email: nil)
      end
      
      it "updates the user" 

      
      context "not connected to github" do
        it "connects to github" 

        
        it "returns user" 

      end
      
      context "already connected to github" do
        before(:each) do
          FactoryGirl.create(:authentication_provider, uid: '498298', token: "foo", user: @user)
        end
        
        it "updates authentication provider" 

        
        it "returns user" 

      end
      
      context "race condition" do
        it "catches error and updates user" 

      end
    end
  end
end

