import time
import threading


acumulador = 0


def sumador(proteccion):
    global acumulador

    for _ in range(1000):
        with proteccion:
            tmp = acumulador

            time.sleep(0)
            tmp = tmp + 5
            time.sleep(0)

            acumulador = tmp


def restador(proteccion):
    global acumulador

    for _ in range(1000):
        with proteccion:
            tmp = acumulador

            time.sleep(0)
            tmp = tmp - 5
            time.sleep(0)

            acumulador = tmp


proteccion = threading.Lock()

momento_arranque = time.perf_counter()
hilo1 = threading.Thread(target=sumador, args=(proteccion,))
hilo2 = threading.Thread(target=restador, args=(proteccion,))

hilo1.start()
hilo2.start()

hilo1.join()
hilo2.join()
momento_parada = time.perf_counter()

print(f'El valor calculado final es: {acumulador}')
print(f'Tomó un total de {momento_parada - momento_arranque: 0.5f} segundos completar las tareas.')