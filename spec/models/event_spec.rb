require 'rails_helper'

describe Event do
  let(:title) { '「SETLIST」2017.12.31(sun) COUNTDOWN PARTY 2017-2018' }
  let(:event) { Event.new(title: title, url: 'https://api.amebaowndme.com/v2/public/blogPosts/1234567') }
  describe '#title_call' do
    it 'titleが存在していればイベント名を返すこと' do
      expect(Event.title_call(title)).to eq('「SETLIST」2017.12.31(sun) COUNTDOWN PARTY 2017-2018')
    end
  end

  describe '#date_format_from_title' do
    it 'titleから開催日を検索して日付を返すこと' do
      expect(event.date_format_from_title(title)).to eq('2017-12-31'.to_time)
    end

    it 'nilが渡された場合は空の値を返すこと' do
      expect(event.date_format_from_title(nil)).to eq('')
    end
  end

  describe '#url' do
    it 'urlが重複する場合は無効な状態であること' do
      Event.create(url: 'https://api.amebaowndme.com/v2/public/blogPosts/1234567')
      event.valid?
      expect(event.errors[:url]).to include('has already been taken')
    end
  end
end
