class Tune < ApplicationRecord
  require 'net/http'
  require 'uri'
  require 'json'
  require 'open-uri'

  def self.crawl
    # p page = agent.get("https://groover-seo.amebaownd.com/posts/3484732")
    uri = URI.parse('https://api.amebaowndme.com/v2/public/blogPosts/3484732')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)

    # p result['body']['title']
    list = result['body']['contents'][1]['value']
    self.to_list(list)
  end

  # private

  def self.to_list(list)
    set_lists = list.split('<p>')
    ary = []

    set_lists.each do |set_list|
      self.list_format(set_list)

      next if set_list.blank?
      self.requested?(set_list)
      ary << set_list
    end
    ary
  end

  def self.list_format(set_list)
    set_list.gsub!(/(<br>|<\/p>|&nbsp;)/, '')
    set_list.gsub!(/\s{2,}/, ' ')
    set_list.gsub!(/ \/ /, ' - ')
    set_list.strip!
    set_list
  end

  def self.requested?(set_list)
    "#{set_list}はリクエスト曲です！" if set_list =~ /\*$/
  end
end
