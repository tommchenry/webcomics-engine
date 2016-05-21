require 'rails_helper'

describe 'comics#index' do
  let!(:older_comic){Comic.create(title:"Old Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "I'm older", post_date: "2016-03-12")}
  let!(:comic){Comic.create(title:"Test Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "alt text", post_date:"2016-04-12")}

  it 'displays the most recent comic' do
    visit '/'
    expect(page).to have_content comic.title
    expect(page).to have_css('.comic-image')
  end

  it 'displays navigation' do
    visit '/'
    expect(page).to have_css('#comic-navigation')
    expect(page).to have_css('#first-comic')
    expect(page).to have_css('#previous-comic')
    expect(page).to have_css('#random-comic')
    expect(page).to have_css('#next-comic')
    expect(page).to have_css('#last-comic')
  end
end
