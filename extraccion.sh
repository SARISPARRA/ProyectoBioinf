# Script para extraer la secuencia del gen gyrB en Lactobacillus acidophilus La14

# Nombre del archivo de secuencia completa
fasta_file = "acidophilusLa14_complete.fasta"

# Posiciones específicas para gyrB en L. acidophilus La14
start = 4283
end = 6247

# Leer el archivo FASTA
with open(fasta_file, "r") as file:
    lines = file.readlines()

# Concatenar toda la secuencia en una sola cadena (omitiendo la línea de encabezado)
sequence = "".join(line.strip() for line in lines if not line.startswith(">"))

# Extraer la secuencia específica entre las posiciones indicadas (ajuste a índice 0)
gyrB_sequence = sequence[start-1:end]

# Guardar la secuencia en un nuevo archivo
with open("gyrB_acidophilusLa14.fasta", "w") as output:
    output.write(">gyrB_Lactobacillus_acidophilus_La14\n")
    output.write("\n".join([gyrB_sequence[i:i+60] for i in range(0, len(gyrB_sequence), 60)]))

print("Extracción completada para L. acidophilus La14, gen gyrB.")
