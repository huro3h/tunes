require 'rails_helper'

describe Tune do
  describe '#requested?' do
    it '受け取った値の末尾が * で終わればリクエスト曲であること' do
      tune = 'The great sample tune *'
      expect(Tune.requested?(tune)).to eq("#{tune}はリクエスト曲です！")
    end
  end
end
