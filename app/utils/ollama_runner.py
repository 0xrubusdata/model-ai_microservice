import json
import requests

def ollama_generate(model: str, prompt: str) -> dict:
    """
    Appelle l'API HTTP d'Ollama pour exécuter un modèle donné avec un prompt.
    
    # [🇬🇧 Calls the Ollama HTTP API to execute a given model with a prompt.] 
    # [🇪🇸 Llama a la API HTTP de Ollama para ejecutar un modelo con un prompt.] 
    # [🇵🇹 Chama a API HTTP do Ollama para executar um modelo com um prompt.] 
    # [🇯🇵 Ollama の HTTP API を呼び出して、指定されたモデルをプロンプトで実行します。] 
    # [🇷🇺 Вызывает HTTP API Ollama для выполнения модели с заданным запросом.] 
    # [🇸🇦 يستدعي API HTTP الخاص بـ Ollama لتنفيذ نموذج معين باستخدام موجه.]

    Args:
        model (str): Le nom du modèle à exécuter.
        # [🇬🇧 The name of the model to execute.] | [🇪🇸 El nombre del modelo a ejecutar.] | [🇵🇹 O nome do modelo a executar.] | [🇯🇵 実行するモデルの名前。] | [🇷🇺 Имя модели для выполнения.] | [🇸🇦 اسم النموذج المراد تشغيله.]
        
        prompt (str): La question ou le prompt à envoyer au modèle.
        # [🇬🇧 The question or prompt to send to the model.] | [🇪🇸 La pregunta o prompt a enviar al modelo.] | [🇵🇹 A pergunta ou prompt a enviar para o modelo.] | [🇯🇵 モデルに送信する質問またはプロンプト。] | [🇷🇺 Вопрос или запрос для отправки модели.] | [🇸🇦 السؤال أو الموجه لإرساله إلى النموذج.]

    Returns:
        dict: La réponse JSON complète de l'API Ollama.
        # [🇬🇧 The complete JSON response from the Ollama API.] | [🇪🇸 La respuesta JSON completa de la API de Ollama.] | [🇵🇹 A resposta JSON completa da API Ollama.] | [🇯🇵 Ollama API からの完全な JSON 応答。] | [🇷🇺 Полный JSON-ответ от API Ollama.] | [🇸🇦 الاستجابة الكاملة بتنسيق JSON من API Ollama.]
    """
    url = "http://localhost:11434/api/generate"

    # Format attendu par les modèles
    # [🇬🇧 Expected format for models] | [🇪🇸 Formato esperado por los modelos] | [🇵🇹 Formato esperado pelos modelos] | [🇯🇵 モデルが期待するフォーマット] | [🇷🇺 Ожидаемый формат для моделей] | [🇸🇦 التنسيق المتوقع للنماذج]
    expected_format = {
        "type": "object",
        "properties": {
            "question": {
                "type": "string"
            },
            "answer": {
                "type": "string"
            }
        },
        "required": ["question", "answer"]
    }

    # Payload de la requête
    # [🇬🇧 Request payload] | [🇪🇸 Carga útil de la solicitud] | [🇵🇹 Payload da requisição] | [🇯🇵 リクエストのペイロード] | [🇷🇺 Полезная нагрузка запроса] | [🇸🇦 حمولة الطلب]
    payload = {
        "model": model,
        "prompt": prompt,
        "format": expected_format,
        "stream": False
    }

    try:
        # Envoi de la requête
        # [🇬🇧 Sending the request] | [🇪🇸 Enviando la solicitud] | [🇵🇹 Enviando a requisição] | [🇯🇵 リクエストの送信] | [🇷🇺 Отправка запроса] | [🇸🇦 إرسال الطلب]
        response = requests.post(url, json=payload)
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        # Gestion des erreurs HTTP
        # [🇬🇧 Handling HTTP errors] | [🇪🇸 Manejo de errores HTTP] | [🇵🇹 Tratamento de erros HTTP] | [🇯🇵 HTTP エラーの処理] | [🇷🇺 Обработка ошибок HTTP] | [🇸🇦 معالجة أخطاء HTTP]
        return {"error": str(e), "response": None}
