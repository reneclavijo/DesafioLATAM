# Pruebas de software y TDD

El Test-Driven Development o Desarrollo Dirigido por Pruebas es una forma de programar donde definimos primero las pruebas que el código debería pasar y luego recién nos centramos en desarrollar la lógica para ello.

## Rspec

Para implementar las pruebas en Rails existen dos gemas, Minitest y Rspec. **MiniTest** viene ya instalado con Ruby  pero es más común ver proyectos en producción apoyados con **Rspec** que es el vamos a utilizar en esta ocasión.

### Instalación de Rspec

Dentro del `Gemfile` debemos agrear las siguientes gemas

```ruby
group :development, :test do
    gem "rspec-rails"
    gem 'rails-controller-testing'
end
```

Luego debemos ejecutar el `bundle` en consola para instalar las gemas

Dentro del proyecto de rails, debemos instalar la gema ejecutando 

```bash
rails g rspec:install
```

**NOTA** La gema rspec-rails agrega nuevos generadores en rails que podemos ver ejecutando el comando `rails g`

Ahora estamos listos para generar como estamos acostumbrados los modelos, controladores y scaffold para nuestro proyecto y las pruebas se generarán solas.

Para poder ejecutarlas debemos realizar el comando

```bash
rails spec
```

## TDD

![TDD - EDTeam](https://edteam-media.s3.amazonaws.com/infographics/original/cc48133c-dc30-4701-8de2-b2e9ffddebb4.png)

Los pasos para completar el TDD son los siguientes:

1. Escribir las pruebas (aunque sepamos que van a fallar)
2. Escribir el código mínimo para que la prueba pase
3. Verificar que el código pase la prueba
4. Refactorizar el código para mejorar el algoritmo

### Escribiendo las pruebas

Para escribir una buena prueba debemos tomar en cuenta que tenemos las 3A

- **A**rrange /   **A**comodar
- **A**ct     /   **A**ctuar
- **A**ssert  /   **A**firmar

Las cuáles nos ayudarán a acomodar las pruebas que tengamos en mente.

## Problema

### Enunciado

Se desea implementar una aplicación que permita registrar precios de productos de diferentes supermercados por diferentes usuarios para así obtener un promedio del precio del mismo producto y evitar que los clientes paguen sobre precios por el mismo producto

### Historia de usuario

| Registrar un producto |
|---|
| Yo como usuario quiero publicar un producto que no esté registrado en el sistema para que entre la comunidad de la aplicación agreguemos los diferentes precios |
| **Criterios de Aceptación** |
| - El producto debe tener un nombre y marca |
| - No debería poder existir muchos productos con los mismos nombres |
| - No debería poder existir muchos productos con los mismos nombres |
| - El  proudcto no debería tener un nombre que solamente sea 1 o 2 letras |
