require 'rails_helper'

describe Event do
  let(:title) { '「SETLIST」2017.12.31(sun) COUNTDOWN PARTY 2017-2018' }

  describe '#title_call' do
    it 'titleが存在していればイベント名を返すこと' do
      expect(Event.title_call(title)).to eq('「SETLIST」2017.12.31(sun) COUNTDOWN PARTY 2017-2018')
    end
  end

  describe '#date_format_from_title' do
    it 'titleから開催日を検索して返すこと' do
      event = Event.new
      expect(event.date_format_from_title(title)).to eq('2017.12.31')
    end
  end
end
