library(ape)
library(phangorn)

# Cargar el archivo de alineación
alignment <- read.dna("aligned_sequences.aln", format = "fasta")
print("Alineación cargada correctamente")

# Calcular la matriz de distancias
dist_matrix <- dist.dna(alignment, model = "JC69")
print("Matriz de distancias calculada correctamente")

# Construir el árbol filogenético
nj_tree <- nj(dist_matrix)
print("Árbol filogenético construido correctamente")

graphics.off()
tryCatch({
  png("arbol_filogenetico.png", width = 1200, height = 900, res = 150)
  
  branch_colors <- rainbow(n = length(nj_tree$edge[, 1]))  # Colores para cada rama
  
  # Ajustes de plot para mejorar la apariencia
  plot(nj_tree,
       main = "Árbol filogenético (Neighbor-Joining)",
       cex = 0.8,                       # Tamaño de las etiquetas
       label.offset = 0.02,             # Separación de etiquetas respecto a las ramas
       x.lim = c(0, 1.5),               # Ajustar el límite horizontal para más espacio
       edge.color = branch_colors,      # Colorear cada rama
       edge.width = 2,                  # Ancho de las ramas
       align.tip.label = TRUE)          # Alinear las etiquetas en el borde
  
  dev.off()
  print("El árbol filogenético se ha guardado como 'arbol_filogenetico.png'")
}, error = function(e) {
  print("No se pudo guardar el archivo.")
  print(e)
})


