# 1. Aşama: Derleme (Builder)
FROM python:3.12-slim AS builder
# uv sürümünü latest yerine sabit bir sürüme (ör. 0.4.20) sabitliyoruz
COPY --from=ghcr.io/astral-sh/uv:0.4.20 /uv /uvx /bin/
WORKDIR /app
# COPY . . kullanmak yerine sadece gerekenleri kopyalıyoruz
COPY pyproject.toml uv.lock ./
RUN uv sync --no-dev
COPY src ./src

# 2. Aşama: Üretim / Çalışma Ortamı (Final)
FROM python:3.12-slim
WORKDIR /app
# Sanal ortamı birinci aşamadan kopyalıyoruz
COPY --from=builder /app/.venv /app/.venv
COPY src ./src
# Sanal ortamı PATH'e ekliyoruz
ENV PATH="/app/.venv/bin:$PATH"

CMD ["python", "-m", "src.dev_setup.main"]
