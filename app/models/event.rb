class Event < ApplicationRecord
  # require 'net/http'
  # require 'uri'
  require 'nokogiri'
  require 'open-uri'

  has_many :tunes, dependent: :destroy

  def self.title_call(title)
    title unless title.nil?
  end

  def search_from_sources
    url = 'https://groover-seo.amebaownd.com/rss.xml'
    return if url.nil?
    xml = Nokogiri::XML(open(url).read)
    item_nodes = xml.xpath('//item')
    ary = []
    item_nodes.each do |item|
      title = item.xpath('title').text
      link = item.xpath('link').text
      ary << [title, link] if title =~ /「SETLIST」/
    end
    ary
  end

end
