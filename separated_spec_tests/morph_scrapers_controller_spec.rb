require 'spec_helper'

describe ScrapersController do
  let(:user) { create(:user, nickname: 'mlandauer') }
  let(:organization) do
    o = create(:organization, nickname: 'org')
    o.users << user
    o
  end

  describe '#destroy' do
    context 'not signed in' do
      it 'should not allow you to delete a scraper' 

    end

    context 'signed in' do
      before :each do
        sign_in user
      end

      context 'you own the scraper' do
        before :each do
          VCR.use_cassette('scraper_validations',
                           allow_playback_repeats: true) do
            Scraper.create(owner: user, name: 'a_scraper',
                           full_name: 'mlandauer/a_scraper')
          end
        end

        it 'should allow you to delete the scraper' 


        it 'should redirect to the owning user' 

      end

      context "an organisation you're part of owns the scraper" do
        before :each do
          VCR.use_cassette('scraper_validations',
                           allow_playback_repeats: true) do
            Scraper.create(owner: organization, name: 'a_scraper',
                           full_name: 'org/a_scraper')
          end
        end

        it "should allow you to delete a scraper if it's owner by an "\
           "organisation you're part of" do
          delete :destroy, id: 'org/a_scraper'
          expect(Scraper.count).to eq 0
        end

        it 'should redirect to the owning organisation' 

      end

      it "should not allow you to delete a scraper if you don't own the "\
         'scraper' do
        other_user = User.create(nickname: 'otheruser')
        VCR.use_cassette('scraper_validations', allow_playback_repeats: true) do
          Scraper.create(owner: other_user, name: 'a_scraper',
                         full_name: 'otheruser/a_scraper')
        end
        expect { delete :destroy, id: 'otheruser/a_scraper' }
          .to raise_error(CanCan::AccessDenied)
        expect(Scraper.count).to eq 1
      end

      it "should not allow you to delete a scraper if it's owner is an "\
         "organisation your're not part of" do
        other_organisation = Organization.create(nickname: 'otherorg')
        VCR.use_cassette('scraper_validations', allow_playback_repeats: true) do
          Scraper.create(owner: other_organisation, name: 'a_scraper',
                         full_name: 'otherorg/a_scraper')
        end
        expect { delete :destroy, id: 'otherorg/a_scraper' }
          .to raise_error(CanCan::AccessDenied)
        expect(Scraper.count).to eq 1
      end
    end
  end

  describe '#create_scraperwiki' do
    before :each do
      sign_in user
    end

    it 'should error if the scraper already exists on morph.io' 


    it 'should error if the scraper already exists on GitHub' 


    it 'should error if the ScraperWiki shortname is not set' 


    it "should error if the scraper doesn't exist on ScraperWiki" 


    it 'should error if the ScraperWiki scraper is private' 


    it 'should error if the ScraperWiki scraper is private' 


    it 'should call ForkScraperwikiWorker if all looks good' 


    it 'should not attempt to fork if ScraperWiki shortname is not set' 

  end
end

