require 'rails_helper'

describe Event do
  describe '#title_call' do
    it 'titleが存在していればイベント名を返すこと' do
      title = '- NEW YEAR PARTY -'
      expect(Event.title_call(title)).to eq('- NEW YEAR PARTY -')
    end
  end
end
