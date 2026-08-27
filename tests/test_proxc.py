import unittest
import sys
import os
import subprocess

# Add parent directory to sys.path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import proxc

class TestProxcUnit(unittest.TestCase):

    def test_module_version_variable(self):
        self.assertEqual(proxc.VERSION, "1.0.5")

    def test_version_tuple_parsing(self):
        self.assertEqual(proxc.parse_version_tuple("1.0.5"), (1, 0, 5))
        self.assertEqual(proxc.parse_version_tuple("v2.1.0"), (2, 1, 0))
        self.assertEqual(proxc.parse_version_tuple("invalid"), (0, 0, 0))

    def test_resolve_protocol(self):
        self.assertEqual(proxc.resolve_protocol("SOCKS5"), "socks5")
        self.assertEqual(proxc.resolve_protocol("http"), "http")
        self.assertEqual(proxc.resolve_protocol(None), "http")
        self.assertEqual(proxc.resolve_protocol("https,http"), "https")

    def test_parse_proxy_string(self):
        # IP and Port string
        res = proxc.parse_proxy_string("1.2.3.4:8080")
        self.assertIsNotNone(res)
        self.assertEqual(res['ip'], "1.2.3.4")
        self.assertEqual(res['port'], "8080")
        self.assertEqual(res['proto'], "http")

        # Auth URI
        res_auth = proxc.parse_proxy_string("socks5://user:pass@10.0.0.1:1080")
        self.assertIsNotNone(res_auth)
        self.assertEqual(res_auth['ip'], "10.0.0.1")
        self.assertEqual(res_auth['port'], "1080")
        self.assertEqual(res_auth['proto'], "socks5")
        self.assertEqual(res_auth['user'], "user")
        self.assertEqual(res_auth['pass'], "pass")

        # 4-part host:port:user:pass
        res_4part = proxc.parse_proxy_string("1.2.3.4:8080:usr:pwd")
        self.assertIsNotNone(res_4part)
        self.assertEqual(res_4part['ip'], "1.2.3.4")
        self.assertEqual(res_4part['port'], "8080")
        self.assertEqual(res_4part['user'], "usr")
        self.assertEqual(res_4part['pass'], "pwd")

    def test_cli_version_flag(self):
        proxc_bin = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'proxc'))
        res = subprocess.run([sys.executable, proxc_bin, '--version'], capture_output=True, text=True, encoding='utf-8', errors='replace')
        self.assertEqual(res.returncode, 0)
        self.assertIn("1.0.5", res.stdout)

        proxc_py_bin = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'proxc.py'))
        res_py = subprocess.run([sys.executable, proxc_py_bin, '--version'], capture_output=True, text=True, encoding='utf-8', errors='replace')
        self.assertEqual(res_py.returncode, 0)
        self.assertIn("1.0.5", res_py.stdout)

    def test_cli_help_flag(self):
        proxc_bin = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'proxc'))
        res = subprocess.run([sys.executable, proxc_bin, '--help'], capture_output=True, text=True, encoding='utf-8', errors='replace')
        self.assertEqual(res.returncode, 0)
        self.assertIn("PROXC", res.stdout)
        self.assertIn("Version : 1.0.5", res.stdout)

    def test_cli_invalid_input(self):
        proxc_bin = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'proxc'))
        res = subprocess.run([sys.executable, proxc_bin, 'non_existent_file.csv'], capture_output=True, text=True, encoding='utf-8', errors='replace')
        self.assertNotEqual(res.returncode, 0)
        self.assertIn("Invalid proxy address or file path", res.stdout)

if __name__ == '__main__':
    unittest.main()
