#!/bin/bash

DESTINO="/home/sindy/GOES12"
BASE_URL="https://ftp.cptec.inpe.br/goes/goes12/retangular_4km/ch4_bin/2011"

# Prefixo dos arquivos (muda para diferentes canais)
PREFIX="S10216956"

# Horários (3 em 3 horas)
HORAS=(0000 0300 0600 0900 1200 1500 1800 2100)

# Dias (sem aspas!)
NOVEMBRO=(8 9 10 11 12 13 14 15 29 30)
DEZEMBRO=(1 2 3 4 5 6 7 8 9 10 30)

baixar_mes() {
    local MES=$1
    shift
    local DIAS=("$@")

    for DIA in "${DIAS[@]}"; do
        DIA_PAD=$(printf "%02d" "$DIA")
        MES_PAD=$(printf "%02d" "$MES")
        for HORA in "${HORAS[@]}"; do
            DATA="2011${MES_PAD}${DIA_PAD}${HORA}"
            ARQ="${PREFIX}_${DATA}.gz"
            URL="${BASE_URL}/${MES_PAD}/$ARQ"
            DEST_DIR="${DESTINO}/${MES_PAD}_${DIA_PAD}"
            mkdir -p "$DEST_DIR"
            echo "🔽 Baixando: $ARQ"
            wget -nc -q -P "$DEST_DIR" "$URL"
            
            #DESCOMPACTAR OS ARQUIVOS .gz
            if [ -f "$DEST_DIR/$ARQ" ]; then
                echo "Extraindo: $ARQ"
            gunzip -f "$DEST_DIR/$ARQ"
            else
                echo "⚠️ Arquivo não encontrado: $ARQ"
            fi
            
        done
    done
}

# Rodar para cada mês
baixar_mes 11 "${NOVEMBRO[@]}"
baixar_mes 12 "${DEZEMBRO[@]}"

echo "✅ Download completo!"
