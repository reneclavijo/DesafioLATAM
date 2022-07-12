#encoding: UTF-8
# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
#Reglas para probar

ActiveSupport::Inflector.inflections do |inflect|

    # La regla básica en Español es similar al Inglés, el plural de las palabras 
    # terminadas en vocal se obtiene agregándole una 's' al final. Sin embargo, 
    # para formar correctamente el plural de palabras como doctor, camion, 
    # universidad o pastel, se aplica una regla distinta: las palabras que 
    # terminen con r, n, d, l se convierten a plural agregando la sílaba "es", 
    # de otra forma, el plural se obtendrían como doctors, camions, universidads 
    # y pastels.
    inflect.plural(/([rndlj])([A-Z]|_|$)/, '\1es\2')
    inflect.plural(/([aeiou])([A-Z]|_|$)/, '\1s\2')
  
    # Las reglas anteriores funcionan incluso cuando son palabras compuestas por
    # dos o más palabras, siempre y cuando, todas sean del mismo tipo, es decir,
    # que ambas terminen con r, n, d o l, o bien, que ambas terminen en vocal;
    # por ejemplo "doctor_operacion", o "libro_revista", serán pluralizadas
    # correctamente a "doctores_operaciones" y "libros_revistas" respectivamente.
    # Sin embargo, si las palabras no son del mismo tipo, la pluralización no
    # ocurre correctamente. Por ejemplo, "autor_libro" es pluralizado como
    # "autor_libros", y "paciente_doctor" es pluralizado como
    # "paciente_doctores". Esto sucede porque al pluralizar, rails aplica sólo
    # la última regla que coincida y omite las demás.
    # Para soportar palabras compuestas, es necesario agregar otras reglas.
    inflect.plural(/([aeiou])([A-Z]|_)([a-z]+)([rndlj])([A-Z]|_|$)/, 
                   '\1s\2\3\4es\5')
    inflect.plural(/([rndlj])([A-Z]|_)([a-z]+)([aeiou])([A-Z]|_|$)/, 
                   '\1es\2\3\4s\5')
    # Con estas reglas, ya se pueden traducir correctamente las palabras compuestas
    # de dos palabras aunque no sean del mismo tipo.
    # Se pueden agregar, de la misma manera, reglas para cuando se trate de tres
    # palabras compuestas, pero esto significa tomar en cuenta más combinaciones.
    # En la mayoría de los casos, creo que es suficiente con estas dos.
  
    # Para obtener correctamente el plural de palablas como maiz => maices,
    # pez => peces, las palabras terminadas en z se cambian la z por c, y
    # se agrega "es"
    inflect.plural(/z([A-Z]|_|$)$/i, 'ces\1')
  
    #-----------------------------------------------------------------------------
  
    # Para singularizar, generalmente basta con eliminar la 's' del final, pero
    # palabras como doctores y universidades se convertirían erróneamente como
    # doctore y universidade.
    # Podemos agregar una nueva regla, cuando la palabra termina en "es", eliminar 
    # esa sílaba, pero esto tampoco es del todo cierto, ya que funciona con 
    # palabras como "doctores" o "camiones", porque su singular son "doctor" y 
    # "camion", respectivamente. Sin embargo, hay otras palabras que se 
    # convertirían erróneamente, como semestres, por ejemplo, que al eliminar la 
    # sílaba "es" del final, se singularizaría como 'semestr'. Para evitar eso, se 
    # obliga que la palabra que termina en "es" y venga precedida de r, n, d o l, 
    # deba también ser precedida por una vocal.
    # Para que la epresión no quede tan extensa, vamos a utilizar unas variables
    # para almacenar parte de la misma. También nos servirá para no tener que
    # repetir la mistra estructura.
  
    # Primero, definimos las palabras que terminen en 'es', precedido de r, n, d, 
    # l o j, precedido de una vocal.
    final_plural_rndlj = /([aeiou][rndlj])es([A-Z]|_|$)/
    # Después, definimos las palabras que terminen en vocal seguida de una 's'. En 
    # caso de que esa vocal sea la e, entonces no debe ser precedida de alguna 
    # combinación de vocal + r, n, d, l o j.
    final_plural_vocal = /((?<![aeiou][rndlj])e|a|i|o|u)s([A-Z]|_|$)/
    # Lsas palabras compuestas serán las siguientes: la primera palabra es con r,
    # n, d, l o j, seguida de una palabra terminada en vocal. La segunda palabra
    # compuesta, será al revés.
    palabra_compuesta_1 = /#{final_plural_rndlj}([a-z]+)#{final_plural_vocal}/
    palabra_compuesta_2 = /#{final_plural_vocal}([a-z]+)#{final_plural_rndlj}/
  
    # las palabras terminadas en ia ya están en singular
    inflect.singular(/(ia)([A-Z]|_|$)$/i, '\1')
  
    # Utilizando las variables creadas anteriormente, se generan las nuevas reglas
    # para obtener el singular de las palabras sencillas y compuetas que terminen
    # tanto en vocal, como en r, n, d, l, o j.
    inflect.singular(final_plural_rndlj, '\1\2')
    inflect.singular(final_plural_vocal, '\1\2')
    inflect.singular(palabra_compuesta_1, '\1\2\3\4\5')
    inflect.singular(palabra_compuesta_2, '\1\2\3\4\5')
  
    # Para singularizar palabras con 'ces', como 'maices'
    inflect.singular(/ces$/, 'z')
  
    #-----------------------------------------------------------------------------
  
    # Las palabras en singular que terminan con s son un caso especial, ya que 
    # rails infiere que ya están en plural, lo cual es falso. Por ejemplo, pais.
    # Es necesario indicar que el plural de pais es paises y viceversa. Esto se
    # puede hacer declarándolo como irregular:
    inflect.irregular 'pais', 'paises'
    # Pero es necesario agregar otra regla. Pais termina en s, pero ya está en
    # singular, por lo que hay que indicarle a rails que no elimine la s final.
    inflect.singular /(pais)([A-Z]|_|$)/, '\1\2'
  
    # Ejemplos cuyo plural y singular sea el mismo
    inflect.uncountable %w( campus lunes martes miercoles jueves viernes )
  
    #-----------------------------------------------------------------------------
  
    # Otros ejemplos de palabras irregulares
    # En ocasiones, quisiéramos aplicar reglas específicas que no cumplen con las
    # generales. Por ejemplo, si a estas alturas tratamos de obtener el plural de
    # "hermano_de_sangre", el resultado sería "hermanos_des_sangres", así que,
    # para estos casos, es necesario agregar reglas para indicar estos
    # comportamientos 'irregulares'.
  
    #inflect.irregular 'hermano_de_sangre', 'hermanos_de_sangre'
    #inflect.irregular 'HermanoDeSangre', 'HermanosDeSangre'
  
    # NOTA: es necesario indicar los dos modos (underscore y camelcase) porque el
    # método irregular no soporta expresiones regulares
  
    # Caso especial en el que la última palabra termina con 's' desde su versión
    # en singular (caso similar al de pais, pero en esta ocasión, con palabras
    # compuestas)
  
    #inflect.singular 'calificacion_matematicas', 'calificacion_matematicas'
    #inflect.singular 'CalificacionMatematicas', 'CalificacionMatematicas'
    #inflect.irregular 'calificacion_matematicas', 'calificaciones_matematicas'
    #inflect.irregular 'CalificacionMatematicas', 'CalificacionesMatematicas'
  
    # NOTA: por claridad, se indican los dos modos (underscore y camelcase)
    # porque el método irregular no soporta expresiones regulares, aunque en el
    # caso del singular sí, por lo que se puede escribir también de la siguiente
    # manera:
    #inflect.singular /([Cc])(alificacion)(_m|M)(atematicas)/, '\1\2\3\4'
  
  end