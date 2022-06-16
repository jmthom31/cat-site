require 'uri'
require 'net/http'
require 'json'


class PagesController < ApplicationController
  def home
  end

  def json_parse(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-api-key'] = ENV['CAT_API_KEY']

    response = http.request(request)
    result = JSON.parse(response.read_body)
    result[0]['url']
  end

  def find_homepage_cat
    url = URI('https://api.thecatapi.com/v1/images/search?category_ids=3')
    json_parse(url)
  end

  def find_sunglasses_cat
    url = URI('https://api.thecatapi.com/v1/images/search?category_ids=4')
    json_parse(url)
  end

  def find_boxes_cat
    url = URI('https://api.thecatapi.com/v1/images/search?category_ids=5')
    json_parse(url)
  end

  def find_space_cat
    url = URI('https://api.thecatapi.com/v1/images/search?category_ids=2')
    json_parse(url)
  end

  def find_sink_cat
    url = URI('https://api.thecatapi.com/v1/images/search?category_ids=14')
    json_parse(url)
  end

  def find_clothes_cat
    url = URI('https://api.thecatapi.com/v1/images/search?category_ids=15')
    json_parse(url)
  end

  def find_tie_cat
    url = URI('https://api.thecatapi.com/v1/images/search?category_ids=7')
    json_parse(url)
  end

  helper_method :find_homepage_cat
  helper_method :find_sunglasses_cat
  helper_method :find_boxes_cat
  helper_method :find_sink_cat
  helper_method :find_space_cat
  helper_method :find_clothes_cat
  helper_method :find_tie_cat
end
