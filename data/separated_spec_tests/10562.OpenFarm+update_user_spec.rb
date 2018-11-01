require 'spec_helper'
require 'openfarm_errors'

describe Users::UpdateUser do
  let(:mutation) { Users::UpdateUser }

  let(:other_user) { FactoryGirl.create(:user) }
  let(:current_user) { FactoryGirl.create(:user) }
  let(:crop) { FactoryGirl.create(:crop) }

  let(:params) do
    { id: "#{current_user.id}",
      attributes: {
        mailing_list: false
      },
      current_user: current_user
    }
  end
  let(:params_with_usersetting) do
    { id: "#{current_user.id}",
      attributes: {},
      user_setting: {
        location: "Manila"
      },
      current_user: current_user
    }
  end

  it 'requires fields' 


  it 'updates user featured image via URL' 


  it 'updates valid users' 


  it 'updates valid user_setting' 


  it 'adds valid favorite guides' 


  it 'rejects invalid favorite guides' 


  it 'doesnt remove user featured image when sending no featured_image'

  it 'does not add favorited guides that are already favorited' 


  it 'updates valid favorite_crop' 


  it 'rejects invalid favorite_crop' 


  it 'rejects users that are not themselves' 


  it 'rejects users without a valid featured image' 


  it 'handles users that have an existing image when image already exists' 


  it 'handles sending an empty user featured_image' 

end

