from setuptools import setup

with open("README", 'r') as f:
    overview_discription = f.read()

Opt = dict(name='optimol',
           version='1.0',
           description='useful module for predicting molecular conformation',
           license="MIT",
           author=["Minh", "Vivian", "Mike", "Guanning", "Weishi"],
           url="https://github.com/ShadyMikey/OptiMol",
           packages=["optimol"],
           install_requires=["chemspipy", "os", "numpy", "shutil", "pandas", "scikit-learn", "pkg_resources",
                             "csv", "xgboost"],
           python_requires=">=3.0",
           package_data={'optimol': ['sample_data/*.txt']}
           )

if __name__ == '__main__':
    setup(**Opt,
          install_requires=["chemspipy", "numpy", "pandas", "scikit-learn", "xgboost"],
          include_package_data=True,
          packages=['optimol'],
          package_data={'optimol': ['sample_data/*.txt']})
