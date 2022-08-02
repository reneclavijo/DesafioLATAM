class Orden < ApplicationRecord
  before_create -> { generar_numero(tam_hash) } # solamente se va a ejecutar la primera que se guarde una orden
  before_create :asignar_monto_inicial

  belongs_to :usuario
  has_many :detalles_ordenes
  has_many :productos, through: :detalles_ordenes
  has_many :pagos
  has_many :metodos_pago, through: :pagos
  
  validates :numero, uniqueness: true

  def asignar_monto_inicial
    self.total = 0
  end

  def generar_numero(tam_hash)
    self.numero ||= loop do
      random = generar_codigo_candidato(tam_hash)
      break random unless self.class.exists?(numero: random)
    end
  end
  
  def generar_codigo_candidato(tam)
    "#{prefijo_hash}#{Array.new(tam){rand(tam)}.join}"
  end
  
  def prefijo_hash
    "BO"
  end
  
  def tam_hash
    5
  end

  def agregar_producto(id_producto, cantidad)
    producto = Producto.find(id_producto)
    if producto && producto.stock > 0
      detalles_ordenes.create(
        producto_id: producto.id, 
        cantidad: cantidad, 
        precio: producto.precio
      )
      calcular_total
    end
  end

  def calcular_total
    precios = self.detalles_ordenes.map{ |p| p.cantidad * p.precio}
    self.total = precios.sum
    save
  end
end
