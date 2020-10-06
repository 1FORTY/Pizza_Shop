function something() 
{
  let x = window.localStorage.getItem('bbb'); // x = hh['bbb']

  x = x * 1 + 1; // x += 1

  window.localStorage.setItem('bbb', x); // hh['bbb'] = x

  alert(x);
}

function add_to_cart(id)
{
  let key = 'product_' + id;
  let x = window.localStorage.getItem(key); // x = hh['product_id']

  x = x * 1 + 1; // x += 1

  window.localStorage.setItem(key, x); // hh['product_id'] = x - то есть присваиваем значение ключу
}

function cart_get_number_of_items()
{
  let cnt = 0;
  for (let i = 0; i < window.localStorage.length; i++) {
    let key = window.localStorage.key(i);
    let value = window.localStorage.getItem(key);

    if (key.indexOf('product_') == 0) {
      cnt += value * 1;
    }
  }

  return cnt;
}
