require 'sinatra'
require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'https://www.tokyodev.com/'
  unparsed_page = HTTParty.get(url)
  data = Nokogiri::HTML(unparsed_page.body)
  @jobs = []
  @job_listings = data.css('div.jobs-list-item')
  @job_listings.each do |list|
    job = {
      title: list.css('a.job-title').text,
      company: list.css('div.media-object-text').text,
      location: list.css('span.ts-quiet').text,
      warning: list.css('span.tag').text,
      url: list.css('div.media-object-text').text.downcase
    }
    @jobs << job unless job[:title] == ""
  end
end
get '/' do
  scraper
  erb :show
end

get '/tag' do
  scraper
  erb :tag
end
