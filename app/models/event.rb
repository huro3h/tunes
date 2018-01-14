class Event < ApplicationRecord

  has_many :tunes

  def self.title_call(title)
    title unless title.nil?
  end
end
