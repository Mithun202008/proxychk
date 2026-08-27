from setuptools import setup

setup(
    name="proxc",
    version="1.0.5",
    description="Smart Proxy Liveness Checker with streaming output",
    author="Mithun A",
    url="https://github.com/Mithun202008/proxychk",
    py_modules=["proxc"],
    entry_points={
        "console_scripts": [
            "proxc=proxc:main",
        ],
    },
    python_requires=">=3.6",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
