require 'rails_helper'

describe 'comics#index' do
  let!(:older_comic){Comic.create(title:"Old Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "I'm older", post_date: "2016-03-12")}
  let!(:comic){Comic.create(title:"Test Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "alt text", post_date:"2016-04-12")}

end
