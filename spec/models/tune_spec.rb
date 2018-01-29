require 'rails_helper'

describe Tune do
  describe '#requested?' do
    let(:tune_title) {
      Tune.create!(
        title: 'The great sample tune *',
        selected_at: Time.now,
        dj_id: 1,
        event_id: 1)
    }

    it '受け取った値の末尾が * で終わればリクエスト曲であること' do
      dj = create(:dj)
      event = create(:event)
      expect(tune_title.requested?).to eq(tune_title.is_request == true)
    end
  end

  describe '#list_format' do
    let(:tune) { Tune.new }

    it '値に改行を表すタグ文字が含まれていれば取り除くこと' do
      str = '<br>The great <br>sample tune'
      expect(tune.list_format(str)).to eq('The great sample tune')
    end

    it '値に<p>の閉じタグが含まれていれば取り除くこと' do
      str = 'The great sample tune</p>'
      expect(tune.list_format(str)).to eq('The great sample tune')
    end

    it '値に"&nbsp;"が含まれていれば取り除くこと' do
      str = 'The great &nbsp;sample tu&nbsp;ne'
      expect(tune.list_format(str)).to eq('The great sample tune')
    end

    it '2個以上連続する半角スペースを半角スペース1個に変換すること' do
      str = 'The    great sample     tune'
      expect(tune.list_format(str)).to eq('The great sample tune')
    end

    it '"/"で区切られたセパレーターを"-"に変換すること' do
      str = 'Special Artist / The great sample tune'
      expect(tune.list_format(str)).to eq('Special Artist - The great sample tune')
    end
  end
end
