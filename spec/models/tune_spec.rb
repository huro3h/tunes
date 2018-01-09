require 'rails_helper'

describe Tune do
  describe '#requested?' do
    it '受け取った値の末尾が * で終わればリクエスト曲であること' do
      tune = 'The great sample tune *'
      expect(Tune.requested?(tune)).to eq("#{tune}はリクエスト曲です！")
    end
  end

  describe '#list_format' do
    it '値に<br>のタグ文字が含まれていれば取り除くこと' do
      str = '<br>The great <br>sample tune'
      expect(Tune.list_format(str)).to eq('The great sample tune')
    end

    it '2個以上連続する半角スペースを半角スペース1個に変換すること' do
      str = 'The    great sample     tune'
      expect(Tune.list_format(str)).to eq('The great sample tune')
    end

    it '"/"で区切られたセパレーターを"-"に変換すること' do
      str = 'Special Artist / The great sample tune'
      expect(Tune.list_format(str)).to eq('Special Artist - The great sample tune')
    end
  end
end
