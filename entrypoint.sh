#Obtener la IP del host en tiempo de ejecucion
SERVER_IP=$(ip route get 1 | awk '{print $NF;exit}')
# Mostrar la IP obtenida (puedes eliminar esto en producción)
echo "La IP del host es: $SERVER_IP"

echo "Run the container"

export FLASK_RUN_HOST="$SERVER_IP"

flask run

