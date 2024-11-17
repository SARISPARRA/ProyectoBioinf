library(ape)
library(phangorn)
library(ggplot2)
library(reshape2)

# Cargar el archivo de alineación
alignment <- read.dna("aligned_sequences.aln", format = "fasta")
print("Alineación cargada correctamente")

# Calcular la matriz de distancias
dist_matrix <- dist.dna(alignment, model = "JC69")
print("Matriz de distancias calculada correctamente")

# Construir el árbol filogenético
nj_tree <- nj(dist_matrix)
print("Árbol filogenético construido correctamente")

# Calcular la matriz de distancias entre las especies usando el árbol filogenético
distance_matrix <- cophenetic.phylo(nj_tree)

# Convertir la matriz a formato largo para ggplot
distance_melted <- melt(distance_matrix)

# Crear el gráfico de calor
ggplot(distance_melted, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "Matriz de Distancias entre Especies",
       x = "Especies",
       y = "Especies",
       fill = "Distancia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Guardar el gráfico de calor
ggsave("distancias_especies.png", width = 10, height = 8, dpi = 300)

