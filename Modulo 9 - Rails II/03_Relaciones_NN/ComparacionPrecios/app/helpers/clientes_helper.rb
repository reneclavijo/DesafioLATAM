module ClientesHelper
    def generar_landingpage
        render Footer.find(user.langind_page.footer)
    end
end
