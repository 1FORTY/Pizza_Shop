orders = "product_1=11,product_2=4,product_3=11,"

s1 = orders.split(',')

order = []
s = []
s1.each do |x|
  s2 = x.split('=')[0].split('_')[1]
  s3 = x.split('=')[1]

  s = [s2, s3]
  order += [s]
end

puts order.inspect
