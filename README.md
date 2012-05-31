## Conteo Ciudadano

### ¿Que és?

Es un proyecto para crear una base de datos de los resultados de las elecciones federales 2012 en México, basándose en las mantas electorales colocadas afuera de las casillas.

### ¿Cómo funcionará?

Tomas una foto clara de la manta de resultados de la casilla
Entras a Conteo Ciudadano e ingresas los resultados junto con la fotografía.
Cuando los datos que ingresaste sean verificados con la fotografía que tomaste, el resultado será contabilizado.
Una vez que el acta de la casilla este disponible en el IFE de ligara a Conteo Ciudadano.

*Todos los registros de las casillas serán públicos.*


### Como Instalar

Haz un fork del proyecto en el botón de arriba.

Clona el repositorio en tu local.

	> git clone git@github.com:tu-usuario/conteo-ciudadano.git

Instala las gemas con bundle.

	> bundle install

Renombra el archivo *config/database.yml.example* por *config/database.yml* e introduce los datos para conectarte a tu base de datos.

Crear la base de datos.

	> rake db:create

Corre las migraciones para crear las tablas.

	> rake db:migrate

Descarga al directorio */doc* del proyecto el archivo [casillas_2012.csv](http://commondatastorage.googleapis.com/conteo_ciudadano/docs/casillas_2012.csv).

Correr los seeds.

	> rake db:seed

Ten paciencia, son 143 190 casillas.

Correr el servidor.

	> rails server

### Como aportar

Para aportar, toma una de las funcionalidades de la lista, trabaja en ella y cuando este lista, haz tu commit y el pull request.

### Funcionalidades Pendientes
+ Subir imagen de la manta por ajax.
+ Signup y login de usuario con [devise](https://github.com/plataformatec/devise) por medio twitter y facebook.
+ Administradores con diversos permisos con [can can](https://github.com/ryanb/cancan).
+ Botón para denunciar un resultado erróneo.

Comentarios [jorge.parbros@parbros.net](mail_to:jorge.parbros@parbros.net)
