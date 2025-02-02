# Dockerfile

# Étape 1 : Utiliser une image Python slim
# [🇬🇧 Step 1: Use a slim Python image] | [🇪🇸 Paso 1: Usar una imagen de Python slim] | [🇵🇹 Etapa 1: Usar uma imagem Python slim] | [🇯🇵 ステップ 1: スリムな Python イメージを使用] | [🇷🇺 Шаг 1: Используем облегченное изображение Python] | [🇸🇦 الخطوة 1: استخدام صورة Python صغيرة]
FROM python:3.10-slim

# Étape 2 : Installer les dépendances nécessaires
# [🇬🇧 Step 2: Install necessary dependencies] | [🇪🇸 Paso 2: Instalar dependencias necesarias] | [🇵🇹 Etapa 2: Instalar dependências necessárias] | [🇯🇵 ステップ 2: 必要な依存関係をインストール] | [🇷🇺 Шаг 2: Установить необходимые зависимости] | [🇸🇦 الخطوة 2: تثبيت التبعيات اللازمة]
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Étape 3 : Installer Ollama
# [🇬🇧 Step 3: Install Ollama] | [🇪🇸 Paso 3: Instalar Ollama] | [🇵🇹 Etapa 3: Instalar Ollama] | [🇯🇵 ステップ 3: Ollama をインストール] | [🇷🇺 Шаг 3: Установить Ollama] | [🇸🇦 الخطوة 3: تثبيت Ollama]
RUN curl -fsSL https://ollama.com/install.sh | sh

# Étape 4 : Configurer le dossier de l'application
# [🇬🇧 Step 4: Set up the application folder] | [🇪🇸 Paso 4: Configurar la carpeta de la aplicación] | [🇵🇹 Etapa 4: Configurar a pasta da aplicação] | [🇯🇵 ステップ 4: アプリケーションフォルダーを設定] | [🇷🇺 Шаг 4: Настроить папку приложения] | [🇸🇦 الخطوة 4: إعداد مجلد التطبيق]
WORKDIR /app

# Étape 5 : Copier les fichiers de dépendances Python
# [🇬🇧 Step 5: Copy Python dependency files] | [🇪🇸 Paso 5: Copiar archivos de dependencias de Python] | [🇵🇹 Etapa 5: Copiar arquivos de dependências do Python] | [🇯🇵 ステップ 5: Python の依存ファイルをコピー] | [🇷🇺 Шаг 5: Скопировать файлы зависимостей Python] | [🇸🇦 الخطوة 5: نسخ ملفات تبعيات Python]
COPY requirements.txt ./

# Étape 6 : Installer les dépendances Python
# [🇬🇧 Step 6: Install Python dependencies] | [🇪🇸 Paso 6: Instalar dependencias de Python] | [🇵🇹 Etapa 6: Instalar dependências do Python] | [🇯🇵 ステップ 6: Python の依存関係をインストール] | [🇷🇺 Шаг 6: Установить зависимости Python] | [🇸🇦 الخطوة 6: تثبيت تبعيات Python]
RUN pip install --no-cache-dir -r requirements.txt

# Étape 7 : Copier les fichiers de l'application
# [🇬🇧 Step 7: Copy application files] | [🇪🇸 Paso 7: Copiar archivos de la aplicación] | [🇵🇹 Etapa 7: Copiar arquivos da aplicação] | [🇯🇵 ステップ 7: アプリケーションファイルをコピー] | [🇷🇺 Шаг 7: Скопировать файлы приложения] | [🇸🇦 الخطوة 7: نسخ ملفات التطبيق]
COPY . .

# Étape 8 : Copier le script d'initialisation
# [🇬🇧 Step 8: Copy initialization script] | [🇪🇸 Paso 8: Copiar el script de inicialización] | [🇵🇹 Etapa 8: Copiar o script de inicialização] | [🇯🇵 ステップ 8: 初期化スクリプトをコピー] | [🇷🇺 Шаг 8: Скопировать скрипт инициализации] | [🇸🇦 الخطوة 8: نسخ برنامج التهيئة]
COPY init.sh /app/init.sh
RUN chmod +x /app/init.sh

# Étape 9 : Exposer les ports nécessaires
# [🇬🇧 Step 9: Expose necessary ports] | [🇪🇸 Paso 9: Exponer los puertos necesarios] | [🇵🇹 Etapa 9: Expor portas necessárias] | [🇯🇵 ステップ 9: 必要なポートを公開] | [🇷🇺 Шаг 9: Открыть необходимые порты] | [🇸🇦 الخطوة 9: كشف المنافذ اللازمة]
EXPOSE 8000
EXPOSE 11434

# Étape 10 : Configurer le script comme point d'entrée
# [🇬🇧 Step 10: Set the script as entrypoint] | [🇪🇸 Paso 10: Configurar el script como punto de entrada] | [🇵🇹 Etapa 10: Definir o script como ponto de entrada] | [🇯🇵 ステップ 10: スクリプトをエントリポイントとして設定] | [🇷🇺 Шаг 10: Установить скрипт в качестве точки входа] | [🇸🇦 الخطوة 10: تعيين البرنامج النصي كنقطة دخول]
ENTRYPOINT ["/app/init.sh"]
