import json
import xml.etree.ElementTree as ET

def parse_json(response):
    try:
        return json.loads(response)
    except json.JSONDecodeError:
        return None

def parse_xml(response):
    try:
        return ET.fromstring(response)
    except ET.ParseError:
        return None

def generate_json(data):
    return json.dumps(data)

def generate_xml(data):
    root = ET.Element("root")
    for key, value in data.items():
        child = ET.SubElement(root, key)
        child.text = str(value)
    return ET.tostring(root, encoding='unicode')

def call_function(model, function_name, args):
    prompt = f"Call function {function_name} with args {args} and return the result."
    return model.generate(prompt)
