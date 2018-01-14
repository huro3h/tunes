class Event < ApplicationRecord
  def self.title_call(title)
    title unless title.nil?
  end
end
