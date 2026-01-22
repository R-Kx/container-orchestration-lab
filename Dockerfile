FROM python:3.11-slim AS builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONBUFFERED=1

COPY requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


FROM builder AS final-image

WORKDIR /app

RUN useradd -m random_user

COPY --from=builder /install /usr/local
COPY . . 

RUN chown -R random_user:random_user /app

HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
	CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:6767')" || exit 1

USER random_user

CMD [ "python", "app/main.py"]