#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: "sqlite3", database: "pizzashop.db" }

class Product < ActiveRecord::Base

end

get '/' do
  @products = Product.all

  erb :index
end

get '/about' do
  erb :about
end

post '/cart' do
  items_input = params[:orders]
  @items = parse_orders_line items_input

  @items.each do |item|
    item[0] = Product.find(item[0])
  end

  erb :cart
end

def parse_orders_line orders_line
  s1 = orders_line.split(',')

  order = []
  s = []
  s1.each do |x|
    id = x.split('=')[0].split('_')[1]
    cnt = x.split('=')[1]

    s = [id, cnt]
    order += [s]
  end

  return order
end
