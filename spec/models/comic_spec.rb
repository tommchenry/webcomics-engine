# == Schema Information
#
# Table name: comics
#
#  id                 :integer          not null, primary key
#  title              :string
#  alt_text           :string
#  created_at         :datetime
#  updated_at         :datetime
#  url_slug           :string
#  post_date          :datetime
#  visible            :boolean          default(TRUE)
#  keywords           :string           default("")
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'rails_helper'

describe Comic do

  let!(:older_comic){Comic.create(title:"Old Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "I'm older", post_date: "2016-03-12")}
  let!(:comic){Comic.create(title:"Test Comic", img_url:"https://placehold.it/300x300.png/000", alt_text: "alt text", post_date:"2016-04-12")}

  describe 'basic model' do
    it 'should return a title' do
      expect(comic.title).to eq("Test Comic")
    end

    it 'should return an alt text' do
      expect(comic.alt_text).to eq("alt text")
    end

    it 'should return a post date' do
      expect(comic.post_date).to eq("2016-04-12")
    end
  end

  describe '#latest_comic' do
    it 'should return a comic' do
      expect(Comic.latest_comic).to be_an_instance_of(Comic)
    end

    it 'should return the most recent comic' do
      expect(Comic.latest_comic).to eq(comic)
    end
  end

  describe '#random_comic' do
    it 'should return a random comic' do
      expect(Comic.random_comic(comic)).to be_an_instance_of(Comic)
    end

    it 'should return a random comic that is not the current_comic' do
      expect(Comic.random_comic(comic)).not_to eq(comic)
    end
  end

  describe '#next_comic' do
    it 'should return the next comic' do
      expect(Comic.next_comic(older_comic)).to eq(comic)
    end
  end

  describe '#previous_comic' do
    it 'should return the previous comic' do
      expect(Comic.previous_comic(comic)).to eq(older_comic)
    end
  end

  describe '#first_comic' do
    it 'should return the first comic' do
      expect(Comic.first_comic).to eq(older_comic)
    end
  end
end
