FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# ---- essentials ----
RUN apt-get update && apt-get install -y \
    curl wget git vim nano htop \
    ca-certificates gnupg lsb-release \
    unzip zip xz-utils zstd \
    build-essential software-properties-common \
    python3 python3-pip python3-venv \
    && rm -rf /var/lib/apt/lists/*

# ---- Node LTS ----
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs

# ---- global tools ----
RUN npm install -g pnpm yarn

# ---- Ollama ----
RUN apt-get update && apt-get install -y zstd \
    && curl -fsSL https://ollama.com/install.sh | sh \
    && which ollama \
    && ollama -v

# ---- OpenCode ----
RUN curl -fsSL https://opencode.ai/install | bash \
    && command -v opencode \
    && opencode --version || true

WORKDIR /workspace

CMD ["bash"]