"""
Server module for emotion detection application.
"""

from flask import Flask, request, jsonify
from EmotionDetection import emotion_detection

app = Flask(__name__)

@app.route('/emotionDetector', methods=['POST'])
def emotion_detector_route():
    """
    Endpoint for emotion detection.
    Analyzes the input text and returns the detected emotions.
    """
    data = request.get_json()
    text_to_analyze = data.get('text', '')
    result = emotion_detection.emotion_detector(text_to_analyze)

    if result['dominant_emotion'] is None:
        return 'Invalid text! Please try again.', 400

    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)
