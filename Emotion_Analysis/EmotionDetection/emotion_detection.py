import requests

def find_dominant_emotion(emotion_scores):
    dominant_emotion = max(emotion_scores, key=emotion_scores.get)
    return dominant_emotion

def emotion_detector(text_to_analyze):
    if not text_to_analyze:
        return {
            'anger': None,
            'disgust': None,
            'fear': None,
            'joy': None,
            'sadness': None,
            'dominant_emotion': None
        }
    
    url = 'https://sn-watson-emotion.labs.skills.network/v1/watson.runtime.nlp.v1/NlpService/EmotionPredict'
    headers = {"grpc-metadata-mm-model-id": "emotion_aggregated-workflow_lang_en_stock"}
    input_json = {"raw_document": {"text": text_to_analyze}}
    
    response = requests.post(url, json=input_json, headers=headers)
    
    if response.status_code == 200:
        data = response.json()
        emotion_predictions = data.get('emotionPredictions', [])
        if emotion_predictions:
            emotions = emotion_predictions[0].get('emotion', {})
            dominant_emotion = find_dominant_emotion(emotions)
            
            return {
                'anger': emotions.get('anger', 0),
                'disgust': emotions.get('disgust', 0),
                'fear': emotions.get('fear', 0),
                'joy': emotions.get('joy', 0),
                'sadness': emotions.get('sadness', 0),
                'dominant_emotion': dominant_emotion
            }
        else:
            return {
                'anger': None,
                'disgust': None,
                'fear': None,
                'joy': None,
                'sadness': None,
                'dominant_emotion': None
            }
    else:
        return {
            'anger': None,
            'disgust': None,
            'fear': None,
            'joy': None,
            'sadness': None,
            'dominant_emotion': None
        }

if __name__ == "__main__":
    text = "I love this new technology."
    result = emotion_detector(text)
    print(result)
