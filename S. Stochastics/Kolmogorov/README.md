# Kolmogorov_Spaces

Espacio de probabilidad (Omega, F, P) de Kolmogorov sobre un espacio muestral finito,
como paquete generico de Ada 2012. Los tres axiomas son contratos del paquete.

Compilar y ejecutar la prueba del dado (con `-gnata` para activar los contratos):

```bash
gnatmake -gnata -gnatwa -gnat2012 -D obj -o obj/dice_test dice_test.adb
./obj/dice_test
```
