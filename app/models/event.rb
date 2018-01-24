class Event < ApplicationRecord
  # require 'net/http'
  # require 'uri'
  require 'nokogiri'
  require 'open-uri'

  has_many :tunes, dependent: :destroy

  validates :url, uniqueness: true

  def self.title_call(title)
    title unless title.nil?
  end

  def search_from_sources
    url = 'https://groover-seo.amebaownd.com/rss.xml'
    ary = []
    return if url.nil?
    xml = Nokogiri::XML(open(url).read)
    item_nodes = xml.xpath('//item')
    item_nodes.each do |item|
      title = item.xpath('title').text
      link = item.xpath('link').text
      if title =~ /「SETLIST」/
        date_at = date_format_from_title(title)
        ary << [title, link, date_at]
      end
    end
    record_events(ary)
  end

  def date_format_from_title(title)
    return '' if title.nil?
    if title =~ /(\d{4}.\d{1,2}.\d{1,2})/
      date = $1
      Time.parse(date)
    end
  end

  def record_events(events)
    p events
  end
end
