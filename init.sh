#!/bin/bash

# Attendre qu'Ollama soit prêt
# [🇬🇧 Waiting for Ollama to be ready] | [🇪🇸 Esperando que Ollama esté listo] | [🇵🇹 Aguardando Ollama ficar pronto] | [🇯🇵 Ollama の準備ができるのを待っています] | [🇷🇺 Ожидание готовности Ollama] | [🇸🇦 انتظار جاهزية Ollama]
echo "Waiting for Ollama to be available..."
until curl -s http://localhost:11434/api/models > /dev/null; do
  # Ollama n'est pas encore prêt. Nouvelle tentative dans 5 secondes...
  # [🇬🇧 Ollama is not ready yet. Retrying in 5 seconds...] | [🇪🇸 Ollama aún no está listo. Reintentando en 5 segundos...] | [🇵🇹 Ollama ainda não está pronto. Tentando novamente em 5 segundos...] | [🇯🇵 Ollama はまだ準備ができていません。5秒後に再試行...] | [🇷🇺 Ollama еще не готов. Повторная попытка через 5 секунд...] | [🇸🇦 Ollama لم يصبح جاهزًا بعد. المحاولة مرة أخرى في 5 ثوانٍ...]
  echo "Ollama is not ready yet. Retrying in 5 seconds..."
  sleep 5
done

# Télécharger les modèles nécessaires
# [🇬🇧 Downloading necessary models] | [🇪🇸 Descargando modelos necesarios] | [🇵🇹 Baixando modelos necessários] | [🇯🇵 必要なモデルをダウンロード中] | [🇷🇺 Загрузка необходимых моделей] | [🇸🇦 تنزيل النماذج المطلوبة]
echo "Downloading models with Ollama..."
ollama pull gemma
ollama pull deepseek-r1:8b
ollama pull llama3.2

# Lancer l'application FastAPI
# [🇬🇧 Starting FastAPI application] | [🇪🇸 Iniciando aplicación FastAPI] | [🇵🇹 Iniciando aplicação FastAPI] | [🇯🇵 FastAPIアプリケーションを起動] | [🇷🇺 Запуск приложения FastAPI] | [🇸🇦 بدء تشغيل تطبيق FastAPI]
echo "Starting FastAPI application..."
uvicorn app.main:app --host 0.0.0.0 --port 8000
