require 'rails_helper'

describe do
  describe '#name?' do
    it '受け取った値の先頭が "dj "で始まればDJ名であること' do
      str = 'dj Super-man'
      expect(Dj.name?(str)).to eq("#{str}はDJ名です!")
    end
  end
end
