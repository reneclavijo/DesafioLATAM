class EjecutarComandosJob < ApplicationJob
  queue_as :default

  def perform(*args)
    
    system("rails g scaffold #{args[0]} #{args[1]}")
    system("rails db:migrate")
  end
end
