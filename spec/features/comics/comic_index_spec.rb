require 'rails_helper'

describe 'comics#index' do
  let!(:comic){Comic.create(title:"Test Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "alt text", post_date:"2016-04-12")}

  it 'displays a comic' do
    visit '/'
    expect(page).to have_content comic.title
  end
end
