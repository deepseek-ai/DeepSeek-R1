import unittest
from deepseek_reasoner import DeepSeekReasoner

class TestDeepSeekReasoner(unittest.TestCase):

    def setUp(self):
        self.reasoner = DeepSeekReasoner()

    def test_interleaved_messages(self):
        request = {
            "messages": [
                {"role": "user", "content": "Hello!"},
                {"role": "assistant", "content": "Hi! How can I help?"},
                {"role": "user", "content": "Tell me about DeepSeek R1."}
            ]
        }
        response = self.reasoner.handle_request(request)
        self.assertEqual(response["status"], "success")
        self.assertEqual(len(response["processed_messages"]), 3)

    def test_successive_user_messages(self):
        request = {
            "messages": [
                {"role": "user", "content": "Hello!"},
                {"role": "user", "content": "Tell me about DeepSeek R1."}
            ]
        }
        response = self.reasoner.handle_request(request)
        self.assertEqual(response["status"], "success")
        self.assertEqual(len(response["processed_messages"]), 1)
        self.assertEqual(response["processed_messages"][0]["content"], "Hello! Tell me about DeepSeek R1.")

    def test_successive_assistant_messages(self):
        request = {
            "messages": [
                {"role": "assistant", "content": "Hello!"},
                {"role": "assistant", "content": "How can I assist you today?"}
            ]
        }
        response = self.reasoner.handle_request(request)
        self.assertEqual(response["status"], "success")
        self.assertEqual(len(response["processed_messages"]), 1)
        self.assertEqual(response["processed_messages"][0]["content"], "Hello! How can I assist you today?")

if __name__ == "__main__":
    unittest.main()
