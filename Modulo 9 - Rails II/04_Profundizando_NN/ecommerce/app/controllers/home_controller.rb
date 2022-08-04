class HomeController < ApplicationController

    def index
        @productos = Producto.all
    end
end