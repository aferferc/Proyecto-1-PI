# Escenario Proyecto 1 PI

El escenario se levanta por completo con un solo comando de opentofu o terrafom y se configura de forma idempotente con ansible


## Primer arranque

En el primer arranque es necesario remontarse al derectorio `opentofu` y correr el comando `tofu init`


## Iniciar Escenario

- Correr el comando `tofu apply` desde el directorio `opentofu`

- Tras esto correr el comando `ansible-playbook sites.yaml` desde el directorio `ansible`