require 'rails_helper'

describe Comic do
    let(:older_comic){Comic.create(title:"Old Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "I'm older", post_date: "2016-03-12")}
    let(:comic){Comic.create(title:"Test Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "alt text", post_date:"2016-04-12")}
  it 'should return a title' do
    expect(comic.title).to eq("Test Comic")
  end

  it 'should return an image url' do
    expect(comic.img_url).to eq("https://placehold.it/300x300.png/000")
  end

  it 'should return an alt text' do
    expect(comic.alt_text).to eq("alt text")
  end
  
  it 'should return a post date' do
    expect(comic.post_date).to eq("2016-04-12")
  end

  it 'should return the most recent comic' do
    expect(Comic.latest_comic).to be_an_instance_of(Comic)
  end


end
