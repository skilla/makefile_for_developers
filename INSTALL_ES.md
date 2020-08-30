# Instalación

## Para usuaios de [dotly](https://github.com/CodelyTV/dotly)

- clona el projecto en tu "HOME" (hazlo tal como indicamos para que los ejemplos te funcionen a la primera, después mueves o borrar la carpeta)
    ```
    git clone https://github.com/skilla/makefile_for_developers.git ~/makefile_for_developers
    ```

- copia los scripts en su ubicación final
    ```
    mkdir -p $DOTFILES_PATH/utils/make
    cp extras.sh $DOTFILES_PATH/utils/make/extras.sh
  
    cp only_source $DOTFILES_PATH/bin/only_source
    ```

- Ahora en tus proyectos copia la plantilla Makefile y adaptala a tus necesidades
    ```
    cp Makefile ~/path/de/tu/proyecto
    ```
  
- Ahora solo necesitas el repositorio como consulta y para copiar la plantilla del Makefile, así que si ya tienes la plantilla en un proyecto y has leido la documentación puedes borrar el directorio.
- Por favor si no has leido el "Cómo usarlo" hazlo antes de borrar la carpeta los ejemplos se basan es ella.
    ```
    cd ~
    rm -rf ~/makefile_for_developers
    ```

## Para usuarios sin [dotly](https://github.com/CodelyTV/dotly)

- clona el projecto en tu "HOME" (hazlo tal como indicamos para que los ejemplos te funcionen a la primera, después mueves o borrar la carpeta)
    ```
    git clone https://github.com/skilla/makefile_for_developers.git ~/makefile_for_developers
    ```

- copia los scripts en su ubicación final, asegurate de que el directorio esté el el PATH
    ```
    mkdir -p /usr/local/bin
    cp extras.sh /usr/local/bin/extras.sh
    cp only_source /usr/local/bin/only_source
    ```

- Ahora en tus proyectos copia la plantilla Makefile y adaptala a tus necesidades
    ```
    cp Makefile ~/path/de/tu/proyecto
    ```
  
- Ahora solo necesitas el repositorio como consulta y para copiar la plantilla del Makefile, así que si ya tienes la plantilla en un proyecto y has leido la documentación puedes borrar el directorio.
- Por favor si no has leido el "Cómo usarlo" hazlo antes de borrar la carpeta los ejemplos se basan es ella.
    ```
    cd ~
    rm -rf ~/makefile_for_developers
    ```
