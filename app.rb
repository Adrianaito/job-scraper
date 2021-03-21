require 'sinatra'
require 'nokogiri'
require 'httparty'
require 'byebug'
require_relative 'scraper'

get '/' do
  scraper
  erb :show
end

get '/tag' do
  scraper
  erb :tag
end
