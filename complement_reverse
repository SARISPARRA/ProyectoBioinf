# Script para extraer y obtener el complemento inverso del gen gyrB en L. acidophilus

# Nombre del archivo de secuencia completa
fasta_file = "acidophilusLa14.fasta"

# Posiciones específicas para gyrB en L. acidophilus
start = 4283
end = 6247

# Leer el archivo FASTA
with open(fasta_file, "r") as file:
    lines = file.readlines()

# Concatenar toda la secuencia en una sola cadena (omitiendo la línea de encabezado)
sequence = "".join(line.strip() for line in lines if not line.startswith(">"))

# Extraer la secuencia específica entre las posiciones indicadas (ajuste a índice 0)
gyrB_sequence = sequence[start-1:end]

# Generar el complemento inverso
complement_reverse = gyrB_sequence.translate(str.maketrans("ATCGatcg", "TAGCtagc"))[::-1]

# Guardar el complemento inverso en un nuevo archivo
with open("gyrB_acidophilusLa14_complement_reverse.fasta", "w") as output:
    output.write(">gyrB_acidophilus_La14\n")
    output.write("\n".join([complement_reverse[i:i+60] for i in range(0, len(complement_reverse), 60)]))

print("Extracción y complemento inverso completados para L. acidophilus La14.")
