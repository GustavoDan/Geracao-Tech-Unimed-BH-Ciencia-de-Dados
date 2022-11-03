# Image Processing

This package is not mine, the original author provided it at a course on how to upload packages at PyPI, for people who don't have any package of their authorship to upload.

## Original author

Karina Kato

---

## Description

This package is used to:

-   Processing:

    -   Histogram matching
    -   Structural similarity
    -   Resize Image

-   Utils:

    -   Read image
    -   Save image
    -   Plot image
    -   Plot result
    -   Plot histogram

---

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install the package

```bash
pip install -i https://test.pypi.org/simple/ image-processing-gd
```

## Instructions on uploading to PyPI

Open the terminal at the project root folder, then run these commands to generate the distribution

```bash
pip install --upgrade pip
pip install wheel
pip install twine
pip install setuptools

python setup.py sdist bdist_wheel
```

Then, to upload at Test PyPI, run

```bash
python -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*
```

And for PyPI, run

```bash
python -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*
```

---

## License

[MIT](https://choosealicense.com/licenses/mit/)
