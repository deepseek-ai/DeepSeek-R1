import json

class DeepSeekReasoner:
    def __init__(self):
        pass

    def process_messages(self, messages):
        """
        Process the input messages to ensure they follow the required format.
        """
        if not messages:
            raise ValueError("Messages cannot be empty")

        # Merge successive messages of the same role
        merged_messages = []
        for message in messages:
            if merged_messages and merged_messages[-1]['role'] == message['role']:
                merged_messages[-1]['content'] += " " + message['content']
            else:
                merged_messages.append(message)

        # Ensure interleaved user and assistant messages
        for i in range(1, len(merged_messages)):
            if merged_messages[i]['role'] == merged_messages[i-1]['role']:
                raise ValueError("Messages must be interleaved between user and assistant")

        return merged_messages

    def handle_request(self, request):
        """
        Handle the incoming request and process the messages.
        """
        try:
            messages = request.get('messages', [])
            processed_messages = self.process_messages(messages)
            return {"status": "success", "processed_messages": processed_messages}
        except Exception as e:
            return {"status": "error", "message": str(e)}

# Example usage
if __name__ == "__main__":
    reasoner = DeepSeekReasoner()
    request = {
        "messages": [
            {"role": "user", "content": "Hello!"},
            {"role": "user", "content": "Tell me about DeepSeek R1."},
            {"role": "assistant", "content": "DeepSeek R1 is a reasoning model."}
        ]
    }
    response = reasoner.handle_request(request)
    print(json.dumps(response, indent=2))
