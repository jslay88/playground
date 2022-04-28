import io
from unittest.mock import patch

from hello_world.main import hello_world


def test_hello_world():
    mock_stdout = io.StringIO()
    with patch("sys.stdout", mock_stdout):
        hello_world()

    assert mock_stdout.getvalue() == "Hello, World!\n"
