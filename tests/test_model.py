import unittest
from src.model import Model

class TestModel(unittest.TestCase):

    def setUp(self):
        self.model = Model()

    def test_generate_structured_output_json(self):
        prompt = "Extract the following data as JSON: {\"name\": \"John\", \"age\": 30}"
        result = self.model.generate_structured_output(prompt, format="json")
        self.assertIsInstance(result, dict)
        self.assertEqual(result["name"], "John")
        self.assertEqual(result["age"], 30)

    def test_generate_structured_output_xml(self):
        prompt = "Extract the following data as XML: <person><name>John</name><age>30</age></person>"
        result = self.model.generate_structured_output(prompt, format="xml")
        self.assertIsInstance(result, ET.Element)
        self.assertEqual(result.find("name").text, "John")
        self.assertEqual(result.find("age").text, "30")

    def test_call_function(self):
        function_name = "add"
        args = {"a": 5, "b": 3}
        result = self.model.call_function(function_name, args)
        self.assertIsInstance(result, str)  # Assuming the result is a string
        self.assertIn("result", result)  # Assuming the result contains the word "result"

    def test_integrate_with_api(self):
        api_endpoint = "https://api.example.com/endpoint"
        data = {"key": "value"}
        result = self.model.integrate_with_api(api_endpoint, data)
        self.assertIsInstance(result, dict)
        self.assertIn("response", result)  # Assuming the API response contains the key "response"

if __name__ == "__main__":
    unittest.main()
