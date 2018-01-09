require 'rails_helper'

describe Tune do
  describe '#requested?' do
    it '受け取った値の末尾が * で終わればリクエスト曲であること' do
      set_list = 'The great sample tune *'
      requested?(set_list).to eq("#{set_list}はリクエスト曲です！")
    end
  end
end


