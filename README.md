![banner](https://raw.githubusercontent.com/gutoccs/gutoccs/main/top_image.jpg)

## Prueba de Desarrollo en Flutter :wave:


### Características

- El Home por default carga los Gif que son tendencias (Gif Trending)
- Una vez colocado el texto a buscar, se puede presionar en el botón ✔️ del teclado o 🔍 del AppBar
- Si el texto a buscar es vacío vuelve a cargar Gif Trending
- El **Manejador de Estado:** utilizado fue Cubic, esto porque se trata de un proyecto pequeño, sin embargo, Cubic trabaja muy parecido a BLoC
- Solo utilizo dos estados dentro de la App: **InitialGif** Cuando la aplicación aún no tiene data y **UploadedGif** cuando se trae la data de Giphy
- No mapeé toda la data de los EndPoints, esto porque no era necesaria para este test
- La herramienta que me ayudó a mapear fue quicktype, sin embargo, también tuve que hacer una parte manual, por el exceso de datos en la petición
- Por no necesitarlo no coloqué el método toJson en cada modelo
- Por defecto una petición carga 11 elementos (gif)
- Utilicé solo dos EndPoints: **trending** y **search**
- Utilicé un paquete para el Staggered Grid View, específicamente el layout Masonry Grid View
- Dado que los Gif son pesados utilicé el modelo Downsized, el cual es una versión ligera del Gif
- Cambié el ícono, nombre y splash screen de la App


### Retos de Desarrollo
 
- Utilizar Cubit, auque al ser un proyecto pequeño no fue traumático
- Colocar el botón de favorito en la parte inferior derecha del GifCard, ya que debía conocer a priori el tamaño que tendría la card. Por ello, antes de crearlo calculaba el alto que tendría haciendo un prorateo según el ancho del Tile. Se puede apreciar en: MasonryGridView.builder


### Posibles mejoras

- Que el Usuario pueda pausar o reproducir los GIF
- Utilizar paginación (el api lo soporta) y esto utilizarlo con un Pull To Refresh
- Realizar tests, por lo menos, para verificar que los providers realicen la petición correctamente

### Demo

![Alt Text](https://media3.giphy.com/media/i0eukBT4TFAKZTLhkm/giphy.gif)

Si no se visualiza el Gif pueden verlo en: 

## [link](https://media3.giphy.com/media/i0eukBT4TFAKZTLhkm/giphy.gif)