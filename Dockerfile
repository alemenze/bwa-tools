FROM continuumio/miniconda3:4.9.2
LABEL authors="Alex Lemenze" \
    description="Docker image containing the tools commonly used with bwa."

COPY environment.yml /
RUN apt-get update \
 && apt-get install -y procps \
 && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN conda env create -f /environment.yml && conda clean --all
ENV PATH /opt/conda/envs/bwa-tools/bin:$PATH