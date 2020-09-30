require(tidyverse)
download <- read.csv("Ejercicio probabilidad.download.csv", encoding="UTF-8", stringsAsFactors = TRUE)

# Deja solamente las respuestas (vxs que comienzan con "Respuesta")
base <- download %>% select(starts_with("Respuesta"))

# Crear un vector con los números de siete dígitos de la 1ra respuesta
numeros <- as.numeric(unlist(regmatches(base$Respuesta.1, gregexpr("[[:digit:]]+", base$Respuesta.1))))

# Ver la distribución de los primeros dígitos con el paquete benford.analysis
require(benford.analysis)
plot(benford(numeros))

# Ver las respuestas a la pregunta del avión - dónde necesita refuerzo
ggplot(data=base, aes(Respuesta.2)) + 
  geom_bar(fill="darkgreen") +
  ggtitle("¿Dónde necesitan más refuerzo los aviones?") +
  ylab("Número de personas") + xlab("Opción") + 
  theme_minimal()

# Ver las respuestas a la pregunta de los dados
ggplot(data=base, aes(Respuesta.3)) + 
  geom_bar(fill="black") +
  ggtitle("¿Cuántos seis deben salir en los dados?") +
  xlab("Opción") + ylab("Número de personas") +
  theme_minimal()

# Ver las respuestas a la pregunta de la ruleta
ggplot(data=base, aes(Respuesta.4)) + 
  geom_bar(fill="black") +
  ggtitle("¿Qué debe hacer una jugadora con 50 dólares?") +
  xlab("Opción") + ylab("Número de personas") +
  theme_minimal() + coord_flip()

# Ver las respuestas a las preguntas de riesgo
