# 🛣️ Modelagem do Uso e Cobertura do Solo das Margens da BR-101/PE

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6975391.svg)](https://doi.org/10.5281/zenodo.6975391)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language](https://img.shields.io/badge/Python-Jupyter-orange?logo=jupyter)](https://jupyter.org)
[![Language](https://img.shields.io/badge/R-4.x-blue?logo=r)](https://www.r-project.org)
[![GitHub stars](https://img.shields.io/github/stars/ErisonBarros/Repositorio_BR101?style=social)](https://github.com/ErisonBarros/Repositorio_BR101/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/ErisonBarros/Repositorio_BR101?style=social)](https://github.com/ErisonBarros/Repositorio_BR101/network/members)
[![GitHub issues](https://img.shields.io/github/issues/ErisonBarros/Repositorio_BR101)](https://github.com/ErisonBarros/Repositorio_BR101/issues)
[![Pages](https://img.shields.io/badge/GitHub%20Pages-Live-brightgreen)](https://erisonbarros.github.io/Repositorio_BR101/)

> **Ocupações irregulares sobre a faixa de domínio da rodovia BR-101 em Pernambuco, Brasil.**

Repositório de pesquisa de pós-graduação (UFPE) que investiga o crescimento urbano nas margens da BR-101/PE utilizando modelos matemáticos baseados em autômatos celulares, com o objetivo de prever ocupações irregulares na faixa de domínio da rodovia.

---

## 📑 sumário

- [📍 sobre o projeto](#-sobre-o-projeto)
- [🎯 objetivos](#-objetivos)
- [🔬 abordagem metodológica](#-abordagem-metodológica)
- [📊 resultados principais](#-resultados-principais)
- [👥 colaboradores](#-colaboradores)
- [📂 estrutura do repositório](#-estrutura-do-repositório)
- [🚀 como usar](#-como-usar)
- [📚 como citar](#-como-citar)
- [🌐 documentação online](#-documentação-online)
- [📜 licença](#-licença)

---

## 📍 sobre o projeto

| | |
| :--- | :--- |
| 🏛️ **Instituição** | Universidade Federal de Pernambuco (UFPE) |
| 🎓 **Programa** | Pós-Graduação em Engenharia Civil |
| 🏢 **Centro** | Center for Technology and Geosciences (CTG) |
| 🛣️ **Rodovia** | BR-101/PE — trecho da Zona da Mata Pernambucana |
| 📅 **Período de estudo** | 2000–2010 (calibração) + 10 anos de projeção |
| 📐 **Área** | Faixa de domínio da BR-101 e entorno urbano |

### 🎯 objetivos

Investigar o crescimento urbano e a expansão de ocupações irregulares nas margens da rodovia BR-101/PE, gerando cenários anuais de cobertura do solo para um horizonte de **10 anos** com base em:

- 🗺️ Mapas de cobertura do solo do Projeto MapBiomas (2000 e 2010)
- 📊 4 variáveis explicativas: Densidade Populacional, Valor de Terra Nua, Índice de Vulnerabilidade Social (IVS) e Distância à BR
- 🤖 Calibração via Rede Neural Artificial + Regressão Logística
- ✅ Validação pelo índice Kappa

### 🔬 abordagem metodológica

| etapa | método | ferramenta |
| :--- | :--- | :--- |
| **1. dados** | classificação MapBiomas | Google Earth Engine |
| **2. simulação** | autômato celular | **MOLUSCE** (QGIS plugin) |
| **3. calibração** | redes neurais + regressão logística | Python (`openland`), R |
| **4. validação** | índice Kappa | R, Jupyter |
| **5. análise espacial** | correlação + densidade | Jupyter Notebook |

---

## 📊 resultados principais

- 📈 **Crescimento urbano projetado** nas áreas periféricas das cidades cortadas pela rodovia caso não haja ações integradas nos próximos **40 anos**.
- 🌳 **Contribuição de células** anteriormente em estágio inicial: Floresta/Formação Não Florestal, Agricultura e Área Não Vegetada.
- ⚠️ **Tendência de expansão** das ocupações em direção à faixa de domínio da rodovia.

> Veja o relatório completo: [`Mapa de Classificação de Densidade de Ocupações.pdf`](./Mapa%20de%20Classifica%C3%A7%C3%A3o%20de%20Densidade%20de%20Ocupa%C3%A7%C3%B5es.pdf)

---

## 👥 colaboradores

| autor | orcid | instituição |
| :--- | :--- | :--- |
| **Erison Rosa de Oliveira Barros** | [0000-0003-4879-6880](https://orcid.org/0000-0003-4879-6880) | UFPE |
| **Maurício de O. Andrade** | [0000-0002-7377-7668](https://orcid.org/0000-0002-7377-7668) | UFPE |
| **Fernando Lourenço de Souza Júnior** | [0000-0002-6000-149X](https://orcid.org/0000-0002-6000-149X) | UFPE |

---

## 📂 estrutura do repositório

```
Repositorio_BR101/
│
├── 📓 Analise_Espacial_IVS_10X_Dens.ipynb      # Análise espacial Jupyter (Python)
├── 🗺️ Mapa de Classificação...ocupações.pdf     # Mapa principal do estudo (2.3 MB)
├── 📍 Ocupações.kml                            # Dados geográficos Google Earth (18 MB)
├── 📊 dataset.csv                              # Dataset tabular processado (4.5 MB)
├── 📜 CITATION.cff                             # Metadados de citação (Zenodo)
├── ⚙️ openland_aplicação.R                     # Script principal R (openland)
│
├── 📁 script_R/                                # Scripts auxiliares R
│   ├── Bibliometrix.Rmd
│   ├── conversão_lulcc.R
│   ├── lulccR.R
│   └── openlandR.R
│
├── 📁 env/                                     # Ambiente virtual Python (lib/Scripts)
├── 📁 site/                                    # MkDocs build (documentação online)
│
├── 📄 README.md                                # Este arquivo
├── 📄 PASSO A PASSO.md                         # Tutorial de uso
├── 📄 Relatório de Processamento MOLUSCE.md    # Relatório técnico MOLUSCE
├── 📄 documentação Instação.md                 # Guia de instalação
├── 📄 Deploying Your Docs - MkDocs.md          # Tutorial MkDocs
├── 📄 ajuda-mkdocs.md                          # Ajuda MkDocs
├── 📄 Exploratória                             # Análise exploratória
│
├── ⚙️ _config.yml                              # Config Jekyll (GitHub Pages)
├── 📦 Repositorio_BR101.Rproj                  # Projeto RStudio
└ 🙈 .gitignore
```

### 📌 artefatos principais

| arquivo | tipo | descrição |
| :--- | :--- | :--- |
| [`Analise_Espacial_IVS_10X_Dens.ipynb`](./Analise_Espacial_IVS_10X_Dens.ipynb) | Jupyter Notebook | Análise espacial completa |
| [`Mapa de Classificação de Densidade de Ocupações.pdf`](./Mapa%20de%20Classifica%C3%A7%C3%A3o%20de%20Densidade%20de%20Ocupa%C3%A7%C3%B5es.pdf) | PDF (2.3 MB) | Mapa de classificação final |
| [`Ocupações.kml`](./Ocupa%C3%A7%C3%B5es.kml) | KML (18 MB) | Dados geográficos |
| [`dataset.csv`](./dataset.csv) | CSV (4.5 MB) | Dataset processado |
| [`openland_aplicação.R`](./openland_aplica%C3%A7%C3%A3o.R) | R script | Script de simulação principal |
| [`Relatório de Processamento MOLUSCE.md`](./Relat%C3%B3rio%20de%20Processamento%20MOLUSCE.md) | Markdown | Relatório técnico MOLUSCE |
| [`PASSO A PASSO.md`](./PASSO%20A%20PASSO.md) | Markdown | Tutorial de uso |
| [`documentação Instação.md`](./documenta%C3%A7%C3%A3o%20Insta%C3%A7%C3%A3o.md) | Markdown | Guia de instalação |

---

## 🚀 como usar

### 1. clonar o repositório

```bash
git clone https://github.com/ErisonBarros/Repositorio_BR101.git
cd Repositorio_BR101
```

### 2. explorar a documentação online

A documentação completa está publicada via GitHub Pages:

🌐 **https://erisonbarros.github.io/Repositorio_BR101/**

### 3. executar a análise (opcional)

#### pré-requisitos

- **Python 3.11+** com `geopandas`, `rasterio`, `numpy`, `pandas`, `matplotlib`
- **R 4.x** com `openland`, `lulcc`, `bibliometrix`
- **QGIS 3.x** com plugin **MOLUSCE**

#### ativar ambiente Python

```bash
source env/Scripts/activate    # Windows
source env/bin/activate        # Linux/macOS
```

#### abrir Jupyter

```bash
jupyter notebook Analise_Espacial_IVS_10X_Dens.ipynb
```

#### rodar simulação R

```r
source("openland_aplicação.R")
```

> 📖 Para instruções detalhadas, consulte [`PASSO A PASSO.md`](./PASSO%20A%20PASSO.md).

---

## 📚 como citar

Se você usar este repositório em pesquisa, por favor cite:

```bibtex
@software{barros_br101_2022,
  author    = {Barros, Erison Rosa de Oliveira and
               Andrade, Maurício de O. and
               Souza Júnior, Fernando Lourenço de},
  title     = {Modelagem do Uso e Cobertura do Solo das Margens da BR-101/PE:
               Ocupações Irregulares sobre a Faixa de Domínio},
  year      = {2022},
  publisher = {Zenodo},
  doi       = {10.5281/zenodo.6975391},
  url       = {https://github.com/ErisonBarros/Repositorio_BR101}
}
```

> 📄 Formato CFF: [`CITATION.cff`](./CITATION.cff)

---

## 🌐 documentação online

A documentação deste projeto é publicada via **MkDocs + GitHub Pages**:

🔗 **https://erisonbarros.github.io/Repositorio_BR101/**

Para rebuild local:

```bash
cd site
mkdocs serve
```

Para deploy:

```bash
mkdocs gh-deploy
```

> Veja [`Deploying Your Docs - MkDocs.md`](./Deploying%20Your%20Docs%20-%20MkDocs.md) para detalhes.

---

## 📜 licença

Este projeto está licenciado sob a **MIT License** — veja o arquivo [`LICENSE`](./LICENSE) para detalhes.

```
MIT License - Copyright (c) 2022 Erison Rosa de Oliveira Barros
```

---

## 🔗 links úteis

| recurso | link |
| :--- | :--- |
| 🐙 **Repositório GitHub** | https://github.com/ErisonBarros/Repositorio_BR101 |
| 🌐 **Documentação online** | https://erisonbarros.github.io/Repositorio_BR101/ |
| 📚 **DOI Zenodo** | https://doi.org/10.5281/zenodo.6975391 |
| 🗺️ **Projeto MapBiomas** | https://mapbiomas.org/ |
| 🤖 **Plugin MOLUSCE** | https://github.com/asprino-GitHub/MOLUSCE |

---

<div align="center">

**⭐ Se este projeto foi útil para sua pesquisa, considere dar uma estrela no GitHub! ⭐**

<sub>Curadoria do README: Erison Barros • 2026-08-06</sub>

</div>
