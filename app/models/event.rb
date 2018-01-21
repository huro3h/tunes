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
    return if url.nil?
    xml = Nokogiri::XML(open(url).read)
    item_nodes = xml.xpath('//item')
    item_nodes.each do |item|
      title = item.xpath('title').text
      link = item.xpath('link').text
      # a_record(title, link) if title =~ /「SETLIST」/
    end
  end

  # def a_record(title, link)
  #   @event = Event.new
  #   @event.title = title
  #   @event.url = link
  # end

  def date_format_from_title(title)
    title[0].to_s if title = title.match(/\d{4}.\d{1,2}.\d{1,2}/)
  end
end
