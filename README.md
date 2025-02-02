# Microservice Ollama - Python API

## 🌍 Description

### [🇬🇧 English]
This project is a Python microservice providing an API with three endpoints. Each endpoint interacts with a different Ollama model to generate responses based on user input.

### [🇫🇷 Français]
Ce projet est un microservice Python fournissant une API avec trois endpoints. Chaque endpoint interagit avec un modèle Ollama différent pour générer des réponses basées sur l'entrée de l'utilisateur.

### [🇪🇸 Español]
Este proyecto es un microservicio en Python que proporciona una API con tres endpoints. Cada endpoint interactúa con un modelo Ollama diferente para generar respuestas basadas en la entrada del usuario.

### [🇵🇹 Português]
Este projeto é um microsserviço em Python que fornece uma API com três endpoints. Cada endpoint interage com um modelo Ollama diferente para gerar respostas com base na entrada do usuário.

### [🇯🇵 日本語]
このプロジェクトは、Pythonマイクロサービスで、3つのエンドポイントを持つAPIを提供します。各エンドポイントは異なるOllamaモデルと対話し、ユーザーの入力に基づいて応答を生成します。

### [🇷🇺 Русский]
Этот проект представляет собой микросервис на Python, предоставляющий API с тремя конечными точками. Каждая конечная точка взаимодействует с разной моделью Ollama для генерации ответов на основе ввода пользователя.

### [🇸🇦 العربية]
هذا المشروع هو خدمة مصغرة مكتوبة بلغة بايثون توفر واجهة برمجة تطبيقات بثلاث نقاط نهاية. يتفاعل كل نقطة نهاية مع نموذج مختلف من Ollama لإنشاء استجابات بناءً على إدخال المستخدم.

---

## 🚀 Endpoints

### `/api/general`
- Uses **Llama3.2** model to generate a response to general queries.
   ```sh
   ollama run llama3.2:3b
   ```

### `/api/economic`
- Uses **Deepseek-r1:8b** model to provide economic insights.
   ```sh
   ollama run deepseek-r1:8b
   ```
### `/api/legal`
- Uses **Gemma** model to generate legal-related responses.
   ```sh
   ollama run gemma:7b
   ```
---

## 🛠 Installation & Execution

### [🇬🇧 English]
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/ollama-microservice.git
   cd ollama-microservice
   ```
2. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
3. Start the service:
   ```sh
   uvicorn app.main:app --host 0.0.0.0 --port 8000
   ```

### [🇫🇷 Français]
1. Cloner le dépôt :
   ```sh
   git clone https://github.com/your-repo/ollama-microservice.git
   cd ollama-microservice
   ```
2. Installer les dépendances :
   ```sh
   pip install -r requirements.txt
   ```
3. Démarrer le service :
   ```sh
   uvicorn app.main:app --host 0.0.0.0 --port 8000
   ```

### [🇪🇸 Español]
1. Clonar el repositorio:
   ```sh
   git clone https://github.com/your-repo/ollama-microservice.git
   cd ollama-microservice
   ```
2. Instalar dependencias:
   ```sh
   pip install -r requirements.txt
   ```
3. Iniciar el servicio:
   ```sh
   uvicorn app.main:app --host 0.0.0.0 --port 8000
   ```

---

## 📄 License
This project is licensed under the MIT License.

