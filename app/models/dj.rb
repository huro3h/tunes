class Dj < ApplicationRecord

  has_many :tunes

  def self.name?(str)
    # /i を加えることで大文字小文字区別せずマッチを行う(/i修飾子)
    "#{str}はDJ名です!" if str =~ /^dj /i
  end
end
