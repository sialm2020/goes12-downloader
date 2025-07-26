# 🌎 goes12-downloader
Script Bash para baixar e descompactar imagens do satélite GOES-12 a partir da DISSM/INPE

Script Bash para baixar e descompactar imagens do satélite meteorológico **GOES-12** (Canal 4 – Infravermelho) fornecidas pela Divisão de Satélites e Sensores Ambientais do INPE (**DISSM/INPE**), referentes aos meses de **novembro e dezembro de 2011**, como exemplo. Considere estar conectado na rede cabeada para ter acesso ao ftp.

---

## Overview:

- Faz download automático de arquivos `.gz` do satélite GOES-12 (formato binário).
- Utiliza o canal 4 (Infravermelho) com resolução de 4 km.
- Baixa arquivos de hora em hora (a cada 3 horas).
- Descompacta os arquivos `.gz` automaticamente.
- Organiza os dados por data em pastas separadas.

---

## 🌐 Fonte dos dados

Os dados são obtidos do FTP oficial do INPE/CPTEC: https://ftp.cptec.inpe.br/goes/goes12/retangular_4km/ch4_bin/2011

---

## 🛠️ Requisitos

- `bash`
- `wget`
- `gunzip`

Instale no Ubuntu/Debian com:

```bash
sudo apt update
sudo apt install wget gzip

## Uso:
1. Clone este repositório com:
git clone https://github.com/sialm2020/goes12-downloader.git
cd goes12-downloader

2. Dê permissão de execução

chmod +x baixar_goes12.sh

3. Mude sua o destino 
DESTINO="/home/seu_usuario/GOES12"





