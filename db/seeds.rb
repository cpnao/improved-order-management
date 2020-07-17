# frozen_string_literal: true

Faker::Config.locale = :ja

states = ['🐣未対応', '🐥対応済', '🍳納期変更', '🥚質問', '👨🏻‍🍳 催促', '']
silk_screen_a = ['🐤', '💭', '💭田邊', '💭大塚', '💭石井', '💭町田(将)', '💭大内', '💭坂元', '💭梶原', '💭佐野', '💭山本(弥)', '🐔', '🍗', '💩', '元野', '立石', '古川', '久保田', '吉田', '岡村', '西山', '前田', '相原', '楠本', '宮下', '白石', '鈴木', '大崎', '谷口', '秋山', '小出', '小野', '清谷', '岡安', '中島', '廣尾', '小笠原', '町田(浩)', '橋爪', '高橋', '内田', '網本', '深澤', '不明', '']
silk_screen_b = ['🐤', '💭', '💭田邊', '💭大塚', '💭石井', '💭町田(将)', '💭大内', '💭坂元', '💭梶原', '💭佐野', '💭山本(弥)', '🐔', '🍗', '💩', '古川', '立石', '不明', '']
silk_screen_c = ['🍮', '💭', '💭田邊', '💭大塚', '💭石井', '💭町田(将)', '💭大内', '💭坂元', '💭梶原', '💭佐野', '💭山本(弥)', '🐔', '🍗', '💩', '古川', '立石', '不明', '']
inkjet = ['🐤', '💭', '💭田邊', '💭大塚', '💭石井', '💭町田(将)', '💭大内', '💭坂元', '💭梶原', '💭佐野', '💭山本(弥)', '🐔', '🍗', '岩井', '佐藤(航)' '後藤', '河内', '齋藤', '那倉', '齋藤(雅)', '真田', '竹村', '大澤', '不明', '']
embroidery = ['🐤', '🐧', '🆙', '💭', '💭田邊', '💭大塚', '💭石井', '💭町田(将)', '💭大内', '💭坂元', '💭梶原', '💭佐野', '💭山本(弥)', '🐔', '🍗', '💩', '玉野', '前', '田尻', '岩本', '岡本', '大隅', '竹内', '不明', '']
sewing = ['🔖', '🦔', '🔖+🦔', '💭+🔖', '💭+📬', '💭+🔖+🦔', '💭+📬+🦔', '💭大塚+🔖', '🐔+🔖', '💭大塚+🔖+🦔', '🐔+🔖+🦔', '💭大塚+📬', '🐔+📬', '💭大塚+📬+🦔', '🐔+📬+🦔', '🍗+🔖', '🍗+📬', '🍗+🦔', '🍗+📬+🦔', '牧野', '石原', '榎畑', '伊勢', '不明', '']
uv = ['🐤', '🏂', '✇', '💭', '💭田邊', '💭大塚', '💭石井', '💭町田(将)', '💭大内', '💭坂元', '💭梶原', '💭佐野', '💭山本(弥)', '🐔', '🍺', '🍗', '稲嶺', '津田', '佐藤(和)', '諸井', '鈴木', '内田', '上遠野', '奥山', '不明', '']
silk_screen_d = ['🐤', '💭', '💭田邊', '💭大塚', '💭石井', '💭町田(将)', '💭大内', '💭坂元', '💭梶原', '💭佐野', '💭山本(弥)', '🐔', '🍗', '💩', '佐藤(和)', '鈴木', '不明', '']
option_a = ['🎁', '💧', '📷', '㊕', '🎁+💧', '🎁+📷', '🎁+㊕', '💧+📷', '💧+㊕', '📷+㊕', '🎁+💧+📷', '🎁+💧+㊕', '🎁+📷+㊕', '💧+📷+㊕', '🎁+💧+📷+㊕', '']
option_b = ['🍡', '🐚', '🈚', '🍡+🐚', '🈚️+🐚', '🍡+🐚+🈚️', '']
location_name = ['🐭', '🐰', '🐲', '🐭+🐰', '🐭+🐲', '🐰+🐲', '🐭+🐰+🐲', '全工場', '']
amount = (0..1000000).to_a
check = ["✅", ""]

50000.times do
  Order.create(
    uuid: Faker::Number.number(digits: 16),
    name: Faker::Name.name,
    ordered_date: Faker::Date.between(from: '2015-09-23', to: '2020-08-17'),
    responsed_date: Faker::Date.between(from: '2015-09-23', to: '2020-08-17'),
    contact_person: Faker::Name.last_name,
    states: states.sample,
    silk_screen_a: silk_screen_a.sample,
    silk_screen_b: silk_screen_b.sample,
    silk_screen_c: silk_screen_c.sample,
    inkjet: inkjet.sample,
    embroidery: embroidery.sample,
    sewing: sewing.sample,
    uv: uv.sample,
    silk_screen_d: silk_screen_d.sample,
    option_a: option_a.sample,
    option_b: option_b.sample,
    delivery_address: Faker::Address.state,
    desired_delivery_date: Faker::Date.between(from: '2015-09-23', to: '2020-08-17'),
    internal_delivery_date: Faker::Date.between(from: '2015-09-23', to: '2020-08-17'),
    payment_date: Faker::Date.between(from: '2015-09-23', to: '2020-08-17'),
    amount_paid: amount.sample,
    location_name: location_name.sample,
    purchase_domestic_products: check.sample,
    purchase_oversea_products: check.sample,
    sorting: check.sample
  )
end
