require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = "https://www.tokyodev.com/"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page.body)
  jobs = Array.new
  job_listings = parsed_page.css('div.jobs-list-item')
  job_listings.each do |list|
    job = {
      title: list.css('a.job-title').text,
      company: list.css('div.media-object-text').text,
      location: list.css('span.ts-quiet').text,
      warning: list.css('span.tag').text,

    }
    unless job[:title] == ""
      jobs << job
    end
  end
  jobs.each do |job|
    puts "#{job[:title]}, #{job[:company]}, #{job[:location]}, #{job[:warning]}, #{job[:url]}" +
      'url:' "https://www.tokyodev.com/companies/#{job[:company]}"

  end
end

scraper
