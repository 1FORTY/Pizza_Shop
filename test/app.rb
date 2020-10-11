orders = "product_1=11,product_2=4,product_3=11,"


def parse_orders_line orders_line
  s1 = orders.split(',')

  order = []
  s = []
  s1.each do |x|
    id = x.split('=')[0].split('_')[1]
    cnt = x.split('=')[1]

    s = [id, cnt]
    order += [s]
  end
end
