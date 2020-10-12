#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: "sqlite3", database: "pizzashop.db" }

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base

end

before do
  @products = Product.all
end

get '/' do

  erb :index
end

get '/about' do
  erb :about
end

post '/cart' do
  @items_input = params[:orders]
  @items = parse_orders_line @items_input

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

post '/place_order' do 
    place_order = Order.new params[:order] do |o|
    o.save

    @items = parse_orders_line o.order_input
    @items.each do |item|
      item[0] = Product.find(item[0])
    end
    
  end

  erb :place_order
end
