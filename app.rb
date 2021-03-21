require 'sinatra'
require 'nokogiri'
require 'httparty'
require 'byebug'
require_relative 'scraper'

get '/' do
  scraper
  erb :show
end
get '/no_japanese' do
  scraper
  erb :no_japanese
end
get '/resident' do
  scraper
  erb :resident
end
