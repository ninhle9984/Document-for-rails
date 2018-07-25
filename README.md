# Document-for-rails
### Xem log của server:
- Log sever môi trường development được xem hiện thị ở terminal (ubuntu), bash ( mac OS), powershell (window)
- Check log đã được lưu trữ ở log/development.log, đối với linux, có thể lọc thông tin của log bằng cách sử dụng 
``` tail -f log/development.log | grep ```
### Thông tin của log :
```sql
Started GET "/vi/products/50" for 127.0.0.1 at 2018-07-25 16:17:40 +0700
Processing by ProductsController#show as HTML
  Parameters: {"locale"=>"vi", "id"=>"50"}
  Cart Load (0.3ms)  SELECT  "carts".* FROM "carts" WHERE "carts"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  Product Load (0.3ms)  SELECT  "products".* FROM "products" WHERE "products"."id" = ? LIMIT ?  [["id", 50], ["LIMIT", 1]]
  Rendering products/show.html.erb within layouts/application
  Brand Load (0.2ms)  SELECT "brands".* FROM "brands" ORDER BY "brands"."created_at" DESC
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 10]]
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 9]]
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 8]]
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 7]]
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 6]]
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 5]]
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 4]]
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 3]]
   (0.2ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 2]]
   (0.1ms)  SELECT COUNT(*) FROM "products" WHERE "products"."brand_id" = ?  [["brand_id", 1]]
  Rendered brands/_brand.html.erb (8.5ms)
  ItemPhoto Load (0.1ms)  SELECT  "item_photos".* FROM "item_photos" WHERE "item_photos"."product_id" = ? ORDER BY "item_photos"."id" ASC LIMIT ?  [["product_id", 50], ["LIMIT", 1]]
  ItemPhoto Load (0.1ms)  SELECT "item_photos".* FROM "item_photos" WHERE "item_photos"."product_id" = ?  [["product_id", 50]]
  Brand Load (0.1ms)  SELECT  "brands".* FROM "brands" WHERE "brands"."id" = ? LIMIT ?  [["id", 7], ["LIMIT", 1]]
  Comment Load (0.1ms)  SELECT  "comments".* FROM "comments" WHERE "comments"."product_id" = ? ORDER BY "comments"."created_at" DESC LIMIT ? OFFSET ?  [["product_id", 50], ["LIMIT", 30], ["OFFSET", 0]]
  Rendered comments/_comment.html.erb (0.8ms)
  Rendered comments/_new_comment.html.erb (0.8ms)
  Rendered products/show.html.erb within layouts/application (35.3ms)
  CACHE Cart Load (0.0ms)  SELECT  "carts".* FROM "carts" WHERE "carts"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
   (0.1ms)  SELECT COUNT(*) FROM "line_items" WHERE "line_items"."cart_id" = ?  [["cart_id", 1]]
  CACHE Cart Load (0.0ms)  SELECT  "carts".* FROM "carts" WHERE "carts"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  CACHE  (0.0ms)  SELECT COUNT(*) FROM "line_items" WHERE "line_items"."cart_id" = ?  [["cart_id", 1]]
  Rendered layouts/_header.html.erb (3.6ms)
  Rendered layouts/_footer.html.erb (0.5ms)
Completed 200 OK in 87ms (Views: 77.9ms | ActiveRecord: 3.1ms)
```
- URL được gọi đến : log tách riêng mỗi request bằng 1 dòng trống . Ở đầu dòng ta có thể thấy request, thời điểm request cho 1 URL cụ thể. Ví dụ:<br/>
  * `Started GET "/vi/products/49" for 127.0.0.1 at 2018-07-18 13:42:13 +0700 `có nghĩa là một `GET` request được gửi đến URL `/vi/products/49`.
- Controller và action xử lí request: dòng tiếp theo cho biết request được xử lí bởi controller nào và action nào? Processing by `ProductsController#show` as HTML có nghĩa là GET request trên được xử lí bở ProductController và action Show, thành phần HTML đằng sau có nghĩa là định dạng HTML được request ( có thể request nhiều định dạng khác nhau Json, XML, JS :v)
- Parameter được truyền lên: mỗi request có thể truyền lên các paramter (trong controller có thể truy cập qua params), các parameter sẽ được hiển thi trên log. VD: <br/>
* `Parameters: {"locale"=>"vi", "id"=>"49"}` bên trên tương ứng với param được truyền lên là locale và id, trong controller có thể truy cập qua `params[:id]` và `params[:locale]`
- Các câu lệnh SQL được chạy: Rails hỗ trợ ORM, nên ít khi phải viết truy vẫn thuần, mọi câu lệnh SQL sinh ra chạy trong quá trình xử lí request sẽ được hiển thị tại log. Trong hình bên trên, để hiện thị page show của product (chưa kể partial trong layout), cần load thông tin của card và thông tin của product, câu lệnh SQL sinh ra được hiện thị tại log:<br/>
```sql
  Cart Load (0.7ms)  SELECT  "carts".* FROM "carts" WHERE "carts"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
  Product Load (0.1ms)  SELECT  "products".* FROM "products" WHERE "products"."id" = ? LIMIT ?  [["id", 49], ["LIMIT", 1]]

```
- Các template và partial được render : trong log list ra tất cả các view và các partial được sử dụng để compile cho froned output :<br/>
```
Rendered brands/_brand.html.erb (15.6ms)
Rendered comments/_comment.html.erb (1.1ms)
Rendered comments/_new_comment.html.erb (0.9ms)
Rendered products/show.html.erb within layouts/application (24.9ms)
Rendered layouts/_header.html.erb (6.4ms)
Rendered layouts/_footer.html.erb (1.1ms)
```
- Cache được sử dụng : trong ví dụ bên trên 
```sql
  CACHE  (0.0ms)  SELECT COUNT(*) FROM "line_items" WHERE "line_items"."cart_id" = ?  [["cart_id", 2]]
```
 câu lệnh SQL được cache và dữ liệu được lấy từ cache ra mà không truy cập vào database (thời gian excute là 0.0ms)
 - Các exception, và warning : các exception, các lỗi backtrace đều được hiển thị ở log. VD lỗi chưa migration:
 ```
 Started GET "/" for 127.0.0.1 at 2018-07-25 16:38:45 +0700
   (0.1ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC

ActiveRecord::PendingMigrationError - Migrations are pending. To resolve this issue, run:

        bin/rails db:migrate RAILS_ENV=development

:

Started POST "/__better_errors/e00ddf35df005747/variables" for 127.0.0.1 at 2018-07-25 16:38:45 +0700
```

### Các quan hệ của ActiveRecord:

