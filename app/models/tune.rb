class Tune < ApplicationRecord
  require 'net/http'
  require 'uri'
  require 'json'
  require 'open-uri'

  belongs_to :dj

  def crawl
    # p page = agent.get("https://groover-seo.amebaownd.com/posts/3484732")
    uri = URI.parse('https://api.amebaowndme.com/v2/public/blogPosts/3484732')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)

    # p result['body']['title']
    list = result['body']['contents'][1]['value']

    to_list(list)
  end

  def to_list(list)
    ary = []
    set_lists = list.split('<p>')

    set_lists.each do |set_list|
      self.list_format(set_list)
      next if set_list.blank?
      self.requested?(set_list)
      ary << set_list
    end
    ary
  end

  def list_format(set_list)
    set_list.gsub!(%r{<br>|<\/p>|&nbsp;}, '')
    set_list.gsub!(/\s{2,}/, ' ')
    set_list.gsub!(%r{ \/ }, ' - ')
    set_list.strip!
    set_list
  end

  def requested?(set_list)
    "#{set_list}はリクエスト曲です！" if set_list =~ /\*$/
  end

end
