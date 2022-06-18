class Usuario < ApplicationRecord
  # callback es a un método propio
  after_save :enviar_correo

  validates :nombre,          presence: true
  validates :apellido,        presence: true
  validates :correo,          presence: true
  validates :password,        presence: true
  validates :color_favorito,  presence: true
  
  # visibilidad
  private # de aquí para abajo, todo es de uso interno de Usuario
  def enviar_correo
    puts "ENVIANDO CORREO DE BIENVENIDA "
    puts "Registro completo de #{self.nombre}"
  end
end
