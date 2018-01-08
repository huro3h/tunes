class Tune < ApplicationRecord
  require 'net/http'
  require 'uri'
  require 'json'
  require 'open-uri'

  def self.crawl
    uri = URI.parse('https://api.amebaowndme.com/v2/public/blogPosts/3484732')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)

    # p result['body']['title']
    list = result['body']['contents'][1]['value']
    self.to_list(list)
  end

  private

  def self.to_list(list)
    set_lists = list.split('<p>')
    ary = []

    set_lists.each do |set_list|
      set_list.gsub!(/(<br>|<\/p>|&nbsp;)/, '')
      set_list.gsub!(/\s{2,}/, ' ')
      set_list.strip!
      ary << set_list
    end
  end
end
