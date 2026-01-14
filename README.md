# Script de Actualización Automática de Arch Linux y Neovim

Este script (`update-system.sh`) automatiza la actualización del sistema operativo Arch Linux, los paquetes de AUR gestionados por `paru` (si está instalado) y los plugins de Neovim (Lazy y Mason).

## Instalación del Script

Para utilizar este script en otro ordenador con Arch Linux, sigue estos pasos:

1.  **Clonar el Repositorio (Opcional):**
    Si el script se encuentra dentro de un repositorio Git, clónalo:

    ```bash
    git clone [https://github.com/tu-usuario/tu-repositorio-de-scripts.git](https://github.com/tu-usuario/tu-repositorio-de-scripts.git)
    cd tu-repositorio-de-scripts
    ```

2.  **Crear el Directorio para el Script:**
    Crea el directorio `/opt/scripts/` si no existe:

    ```bash
    sudo mkdir -p /opt/scripts/
    ```

3.  **Copiar el Script:**
    Copia el archivo `update-system.sh` al directorio `/opt/scripts/`:

    ```bash
    sudo cp update-system.sh /opt/scripts/
    ```

    (Reemplaza `update-system.sh` con la ubicación real del archivo si es diferente).

4.  **Hacer el Script Ejecutable:**
    Otorga permisos de ejecución al script:

    ```bash
    sudo chmod +x /opt/scripts/update-system.sh
    ```

## Configuración del Script

El script está diseñado para funcionar con una configuración predeterminada razonable. Sin embargo, puedes revisar y modificar el script directamente si deseas cambiar algún comportamiento, como:

- **Eliminar la opción `--noconfirm`:** Si prefieres revisar las actualizaciones de `pacman` y `paru` antes de confirmarlas, puedes eliminar la opción `--noconfirm` de las líneas correspondientes en el script.

**Importante:** Asegúrate de tener instalados `sudo`, `pacman`, y (opcionalmente) `paru` en el sistema donde ejecutes el script.

## Uso del Script

Puedes ejecutar el script manualmente desde la terminal con el siguiente comando:

```bash
sudo /opt/scripts/update-system.sh
```

## Automatización con systemd (Opcional)

Para automatizar la ejecución del script, puedes configurar un `systemd` timer y service. Aquí tienes un ejemplo de cómo hacerlo:

**1. Crear el archivo de servicio (`/etc/systemd/system/update-system.service`):**

```ini
[Unit]
Description=Servicio para actualizar el sistema Arch Linux y plugins de Neovim
After=network.target

[Service]
Type=oneshot
User=tu_usuario  # Reemplaza tu_usuario con tu nombre de usuario
ExecStart=/opt/scripts/update-system.sh
```

**2. Crear el archivo del timer (`/etc/systemd/system/update-system.timer`):**

```
[Unit]
Description=Ejecutar la actualización diaria del sistema y plugins de Neovim

[Timer]
OnCalendar=daily at 06:00  # Ejecutar diariamente a las 06:00 (puedes ajustar la hora)
Persistent=true

[Install]
WantedBy=timers.target
```

**3. Habilitar e iniciar el timer:**

sudo systemctl **enable** update-system.timer
sudo systemctl **start** update-system.timer

Con esta configuración de systemd, el script se ejecutará automáticamente todos los días a las 06:00. Puedes ajustar la hora en el archivo .timer según tus preferencias.
