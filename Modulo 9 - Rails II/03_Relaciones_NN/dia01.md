# Relaciones N a N

Existen 2 formas de implementar estas relaciones dependiendo la lógica que estemos aplicando en  nuestra base de datos

## has_and_belongs_to_many

Esta relación debemos utilizarla cuando la tabla intermedia no nos interesa que tenga una representación con un modelo. Eso quiere decir que solamente está para crear las relaciones, pero no representan algo importante en el diagrama

Un ejemplo podría ser que una película puede tener muchas categorías y una categoría puede estar en muchas películas, en este caso tendríamos que crear una tabla intermedia que nos permita relacionar estos dos, pero no estamos utilizándola para nada más

## has_many :through

En este caso nos interesa tener la tabla intermedia representada con un modelo, por ejemplo si tenemos clientes que quiren reservar una habitación, la relación de muchos a muchos entre estas dos tablas daría como resultado una tabla intermedia que podría representar la reserva y al contener más datos que solamente las llaves primarias, se vuelve un candidado a un modelo.

