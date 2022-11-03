from setuptools import setup, find_packages

with open("README.md", "r") as f:
    page_description = f.read()

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="image_processing_gd",
    version="0.0.1",
    author="Gustavo Daniel",
    author_email="gudaniel1@gmail.com",
    description='This package belongs to Karina Kato, it\'s a demo with the purpose of teaching how to upload packages at PyPI, for a course in the bootcamp "Geração Tech Unimed-BH - Ciência de Dados".',
    long_description=page_description,
    long_description_content_type="text/markdown",
    url="https://github.com/GustavoDan/Geracao-Tech-Unimed-BH-Ciencia-de-Dados/tree/master/Descomplicando%20a%20cria%C3%A7%C3%A3o%20de%20pacotes%20de%20processamento%20de%20imagens%20em%20Python",
    packages=find_packages(),
    install_requires=requirements,
    python_requires=">=3.5",
)
