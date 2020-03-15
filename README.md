# OptiMol

[![Build Status](https://travis-ci.org/ng-git/OptiMol.svg?branch=master)](https://travis-ci.org/github/ng-git/OptiMol)

OptiMol is a package for predicting molecular conformations of organic compounds, currently limited to 4 most common elements, C, H, N, O.  There are four major components in this package: a data scrapping module, a data cleaning module, a machine learning module and  a visualization module.

## Table of Contents


- [Organization of the  project](#Organization-of-the-project)
- [Software Dependencies](#Software-Dependencies)
- [Project Data](#Project-Data)
- [Documentation](#Documentation)
- [Testing](#Testing)
- [Installation](#Installation)
- [Distribution](#Distribution)
- [Licensing](#Licensing)
- [Getting cited](#Getting-cited)
- [Scripts](#Scripts)
- [Git Configuration](#Git-Configuration)


## Organization of the  project

The project has the following structure:

    OptiMol/
      |- optimol/
      	|- __init__.py
      	|- data_compile.py
        |- tests/
        	|- __init__.py
            |- test_data_compile.py
      |- doc/
        |- component_specifications.ipynb
        |- functional_specifications.ipynb
        |- technology review.pdf
      |- demo/
     	|- demo.ipynb
      |- README.md
      |- requirement.txt
      |- setup.py
      |- setuptool.py
      |- OptiMol.yml
      |- travis.yml
      |- LICENSE
      

In the following sections we will examine these elements one by one. First, let's consider the core of the project. This is the code inside of `optimol/data_compile.py`. This file provides function that converts scrapped data (e.g. .mol or .txt ) into feedable data frames for the machine learning model.

XGBoost is the package we used to train the machine learning module. (need more stuff)

## Software Dependencies

- Python3
- For python packages see `requirements.txt` or use `OptiMol.yml` to create an environment for this package

## Project Data

In this case, the project data is rather small, and recorded in txt files.  Thus, it can be stored alongside the module code.  This is the link of data we used to train the machine learning model. (data source: http://www.chemspider.com/)  

Data: https://drive.google.com/open?id=17vfuY6pkMiZzqaDvUiW3Zl7S7d0hAw22

In this database, there are two structure files for each molecule, recording information of their 2d and 3d structure respectively. We strongly recommend name them in the form of `chemID_2d.txt` and `chemID_3d.txt` respectively to be better processed by this module.

## Documentation

`optimol/data_compile.py`

This module contain functions to retrieve and process data from the database folder. Below shows how to use this module. 

```
from optimol import * 				# import module
data_compile.get_df_database(18) 	# loading file according their chemID, 18 here
```

The outputs of this are 4 pandas data frames: 2d atom information, 2d bond information, 3d atom information and 3d bond information in order. Let look at the output of 3d bond information:

```
data_compile.get_df_database(18)[2]
```

Output:

![](https://github.com/ShadyMikey/OptiMol/blob/master/Presentation%20and%20image/image-20200313153002994.png)

The columns `3d_x`, `3d_y` and `3d_z` are the x, y ,z coordinates of atoms

`atom` stands for the atom type, while `periodic_#` stands for their periodic numbers

`connect_to` stands for what other atoms -- labelled in row numbers and as always in python the first row is labelled as 0 -- the current atom is connected to.

`bond_1`, `bond_2` and `bond_3` stands for the numbers of single, double and triple bonds that the atom has respectively.

Atoms information of 2d molecules can be interpreted similarly as above.

## Testing

Most scientists who write software constantly test their code. That is, if you
are a scientist writing software, I am sure that you have tried to see how well
your code works by running every new function you write, examining the inputs
and the outputs of the function, to see if the code runs properly (without
error), and to see whether the results make sense.

Automated code testing takes this informal practice, makes it formal, and
automates it, so that you can make sure that your code does what it is supposed
to do, even as you go about making changes around it.


We recommend using the ['pytest'](http://pytest.org/latest/) library for
testing. The `py.test` application traverses the directory tree in which it is
issued, looking for files with the names that match the pattern `test_*.py`
(typically, something like our `shablona/tests/test_shablona.py`). Within each
of these files, it looks for functions with names that match the pattern
`test_*`. Typically each function in the module would have a corresponding test
(e.g. `test_transform_data`). This is sometimes called 'unit testing', because
it independently tests each atomic unit in the software. Other tests might run a
more elaborate sequence of functions ('end-to-end testing' if you run through
the entire analysis), and check that particular values in the code evaluate to
the same values over time. This is sometimes called 'regression testing'. We
have one such test in `shablona/tests/test_shablona.py` called
`test_params_regression`. Regressions in the code are often canaries in the coal
mine, telling you that you need to examine changes in your software
dependencies, the platform on which you are running your software, etc.



## Installation

For installation and distribution we will use the python standard
library `distutils` module. This module uses a `setup.py` file to
figure out how to install your software on a particular system. For a
small project such as this one, managing installation of the software
modules and the data is rather simple.

A `shablona/version.py` contains all of the information needed for the
installation and for setting up the [PyPI
page](https://pypi.python.org/pypi/shablona) for the software. This
also makes it possible to install your software with using `pip` and
`easy_install`, which are package managers for Python software. The
`setup.py` file reads this information from there and passes it to the
`setup` function which takes care of the rest.

Much more information on packaging Python software can be found in the
[Hitchhiker's guide to
packaging](https://the-hitchhikers-guide-to-packaging.readthedocs.org).

## Distribution

The main venue for distribution of Python software is the [Python
Package Index](https://pypi.python.org/), or PyPI, also lovingly known
as "the cheese-shop".

To distribute your software on PyPI, you will need to create a user account on
[PyPI](http://python-packaging-user-guide.readthedocs.org/en/latest/distributing/#register-your-project).
It is recommended that you upload your software using
[twine](http://python-packaging-user-guide.readthedocs.org/en/latest/distributing/#upload-your-distributions).

Using Travis, you can automatically upload your software to PyPI,
every time you push a tag of your software to github. The instructions
on setting this up can be found
[here](http://docs.travis-ci.com/user/deployment/pypi/). You will need
to install the travis command-line interface

## Licensing

License your code! A repository like this without a license maintains
copyright to the author, but does not provide others with any
conditions under which they can use the software. In this case, we use
the MIT license. You can read the conditions of the license in the
`LICENSE` file. As you can see, this is not an Apple software license
agreement (has anyone ever actually tried to read one of those?). It's
actually all quite simple, and boils down to "You can do whatever you
want with my software, but I take no responsibility for what you do
with my software"

For more details on what you need to think about when considering
choosing a license, see this
[article](http://www.astrobetter.com/blog/2014/03/10/the-whys-and-hows-of-licensing-scientific-code/)!

## Getting cited

When others use your code in their research, they should probably cite you. To
make their life easier, we use [duecredit](http://www.duecredit.org). This is a software
library that allows you to annotate your code with the correct way to cite it.
To enable `duecredit`, we have added a file `due.py` into the main directory.
This file does not need to change at all (though you might want to occasionally
update it from duecredit itself. It's
[here](https://github.com/duecredit/duecredit/blob/master/duecredit/stub.py),
under the name `stub.py`).

In addition, you will want to provide a digital object identifier (DOI) to the
article you want people to cite.

To get a DOI, use the instructions in [this page](https://guides.github.com/activities/citable-code/)

Another way to get your software cited is by writing a paper. There are several
[journals that publish papers about software](https://www.software.ac.uk/resources/guides/which-journals-should-i-publish-my-software).

## Scripts

A scripts directory can be used as a place to experiment with your
module code, and as a place to produce scripts that contain a
narrative structure, demonstrating the use of the code, or producing
scientific results from your code and your data and telling a story
with these elements.

For example, this repository contains an [IPython notebook] that reads
in some data, and creates a figure. Maybe this is *Figure 1* from some
future article? You can see this notebook fully rendered
[here](https://github.com/uwescience/shablona/blob/master/scripts/Figure1.ipynb).

## Git Configuration

Currently there are two files in the repository which help working
with this repository, and which you could extend further:

- `.gitignore` -- specifies intentionally untracked files (such as
  compiled `*.pyc` files), which should not typically be committed to
  git (see `man gitignore`)
- `.mailmap` -- if any of the contributors used multiple names/email
  addresses or his git commit identity is just an alias, you could
  specify the ultimate name/email(s) for each contributor, so such
  commands as `git shortlog -sn` could take them into account (see
  `git shortlog --help`)
