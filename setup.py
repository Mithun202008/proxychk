from setuptools import setup

setup(
    name="proxychk",
    version="1.0.0",
    description="Smart Proxy Liveness Checker with dirb-style streaming output",
    author="Mithun A",
    url="https://github.com/Mithun202008/proxychk",
    scripts=["proxychk"],
    entry_points={
        'console_scripts': [
            'proxychk=proxychk:main',
        ],
    },
    python_requires=">=3.6",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
