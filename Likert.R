# SIMULA RESPUESTAS DE UNA ESCALA LIKERT DE n PUNTOS
# Se le da el punto de comienzo (def = 1), el número de puntos (def = 5), el número de ítems que se quieren simular, 
# y el vector de probabilidades (def = mayor probabilidad de cincos)
completaEscala <- function(n_items, vp=c(0.1, 0.2, 0.1, 0.3, 0.3), comienzo=1, puntos=5) {
  return (sample(1:5, n_items, replace=TRUE, prob = vp))
}
