
# Escaneador de QR para Proyectos Locales

Este script de Bash te permite generar códigos QR para acceder a proyectos locales desde tu dispositivo móvil de manera sencilla.

## Cómo Usar

1. Ejecuta el script `generar_qr_puerto.sh` proporcionando un número de puerto o dejándolo vacío para iterar sobre todos los puertos que estan abirtos en tu maquina.

   ```bash
   ./generar_qr_puerto.sh
   ```

2. Si ingresas un número de puerto, se generará un código QR que apunta a `http://<tu_dirección_IP>:<puerto>`.

3. Si no proporcionas un puerto, se generarán códigos QR para cada puerto disponible en tu máquina local.

4. Escanea el código QR con la aplicación de escaneo de QR de tu dispositivo móvil.

![GIF de ejemplo](./example.gif)

## Requisitos

- Linux (probado en Ubuntu)
- `qrencode` instalado (puede instalarse con `sudo apt-get install qrencode`)
- `catimg` instalado (puede instalarse con `sudo apt-get install catimg`)

## Notas

- Asegúrate de estar en una red local para que el enlace funcione correctamente.

---

**Nota:** Si estás en una red diferente a la local, asegúrate de configurar el enrutamiento y los cortafuegos adecuadamente para permitir el acceso al puerto específico.
