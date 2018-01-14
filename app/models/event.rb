class Event < ApplicationRecord
  # require 'net/http'
  # require 'uri'
  require 'nokogiri'
  require 'open-uri'

  has_many :tunes

  def self.t # search_set_list
    url = 'https://groover-seo.amebaownd.com/rss.xml'
    xml = Nokogiri::XML(open(url).read)
    item_nodes = xml.xpath('//item')

    item_nodes.each do |item|
      title = item.xpath('title').text
      link = item.xpath('link').text
      if title =~ /「SETLIST」/
        # TODO: titleとlinkをEventテーブルに放り込む
      end
    end
  end

  def self.title_call(title)
    title unless title.nil?
  end
end
