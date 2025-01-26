import unittest
from src.utils import parse_json, parse_xml, generate_json, generate_xml, call_function
from src.model import Model

class TestUtils(unittest.TestCase):

    def setUp(self):
        self.model = Model()

    def test_parse_json(self):
        response = '{"name": "John", "age": 30}'
        result = parse_json(response)
        self.assertIsInstance(result, dict)
        self.assertEqual(result["name"], "John")
        self.assertEqual(result["age"], 30)

    def test_parse_xml(self):
        response = "<person><name>John</name><age>30</age></person>"
        result = parse_xml(response)
        self.assertIsInstance(result, ET.Element)
        self.assertEqual(result.find("name").text, "John")
        self.assertEqual(result.find("age").text, "30")

    def test_generate_json(self):
        data = {"name": "John", "age": 30}
        result = generate_json(data)
        self.assertIsInstance(result, str)
        self.assertIn('"name": "John"', result)
        self.assertIn('"age": 30', result)

    def test_generate_xml(self):
        data = {"name": "John", "age": 30}
        result = generate_xml(data)
        self.assertIsInstance(result, str)
        self.assertIn("<name>John</name>", result)
        self.assertIn("<age>30</age>", result)

    def test_call_function(self):
        function_name = "add"
        args = {"a": 5, "b": 3}
        result = call_function(self.model, function_name, args)
        self.assertIsInstance(result, str)  # Assuming the result is a string
        self.assertIn("result", result)  # Assuming the result contains the word "result"

if __name__ == "__main__":
    unittest.main()
