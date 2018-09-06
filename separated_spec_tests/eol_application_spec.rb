require "spec_helper"

# TODO - these are fragile tests. We should mock the responses: we shouldn't have to be connected to get these, and
# we shouldn't have to change our tests if, say, CNN changes its title.
#
# Also, why is this file named features/application_spec ? It's testing #fetch_external_page_title in application_controller, so
# it should be a "controller spec," but also that method really doesn't belong in the controller; it should be in a model, and
# this should be a model spec. This is NOT testing the behavior of the site. ...This spec is just ... misplaced. 
#
# Looking at the method, there's also a ton there that isn't being spec'ed.  :\
describe 'Application' do

  it 'should be able to get external page titles' 


  it 'should not require an http prefix' 


  it 'should be able to follow redirects' 


  it 'should be able to get titles from compressed pages' 


  it 'should fail on inaccessible URLs' 


  it 'should give a message if a title is not identified' 


  it "gives a message if the doi-link and accepts it" do 
    url= "http://dx.doi.org/10.1038/nature13812"
    redirected_url= 'http://www.nature.com/doifinder/10.1038/nature13812'
    stub_request(:get, url).to_return(status: 302, headers: { location: redirected_url } )
    stub_request(:get, redirected_url).to_return(status: 301)
    response = get_as_json(fetch_external_page_title_path(lang: 'en', url: url))
    expect(response.class).to eq(Hash)
    expect(response['message']).to eq(I18n.t(:redirect_url_ok_title_unavailable))
    expect(response['exception']).to be_true
  end

end

