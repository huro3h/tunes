require 'rails_helper'

describe Event do
  describe '#title_call' do
    it 'titleが存在していればイベント名を返すこと' do
      title = '- NEW YEAR PARTY -'
      expect(Event.title_call(title)).to eq('- NEW YEAR PARTY -')
    end
  end

  describe '#date_format_from_title' do
    it 'titleから開催日を検索して返すこと' do
      @event = Event.new
      title = '「SETLIST」2017.12.31(sun) COUNTDOWN PARTY 2017-2018'
      expect(@event.date_format_from_title(title)).to eq('2017.12.31')
    end
  end
end
