json.extract! producto, :id, :nombre, :descripcion, :stock, :precio, :sku, :created_at, :updated_at
json.url producto_url(producto, format: :json)
