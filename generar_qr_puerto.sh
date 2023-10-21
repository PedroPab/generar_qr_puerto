#!/bin/bash

# Leer el puerto del usuario
read -p "Ingrese el número de puerto: " port_number
printf "\n"

# Obtener la dirección IP
ip_address=$(hostname -I | awk '{print $1}')

# Si no se proporciona un puerto, iterar sobre todos los puertos
if [[ -z "$port_number" ]]; then
  # Obtener la lista de puertos
  ports=$(netstat -tuln | awk '/^tcp/ {print $4}' | cut -d':' -f2)

  # Iterar sobre los puertos
  for port in $ports; do
    # Generar el código QR
    qrencode -o network_qr_$port.png "http://$ip_address:$port" -s 1 -m 1
    printf "\n"

    echo "http://$ip_address:$port"
    printf "\n"
    catimg network_qr_$port.png

    #borramos la imgen del qr
    rm network_qr_$port.png

    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
  done
else
  # Verificar si el puerto es válido
  if ! [[ "$port_number" =~ ^[0-9]+$ ]] || ((port_number < 1 || port_number > 65535)); then
    echo "El puerto ingresado no es válido."
    exit 1
  fi

  # Generar el código QR con 1  pixel de margen
  qrencode -o network_qr.png "http://$ip_address:$port_number" -s 1 -m 1

  # Mostrar el código QR en la terminal
  printf "\n"
  echo "http://$ip_address:$port_number"
  printf "\n"

  catimg network_qr.png -w 68

  #borramos la imgen del qr
  rm network_qr.png
fi
