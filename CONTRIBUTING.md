# Contributing

## Issues

If you have any bug to report or feel like contributing with a new idea or functionality, please feel free to create an issue. Make sure you specify the issue type (i.e bug or enhancement).

## Development process

If you want to contribute with code development, follow the next steps:

1. The user sends an email to contribute[at]argeniss[dot]com with a collaboration request providing his/her GitHub account and an email to receive a slack invitation. After the invitation is received he/she will be able to clone the source code and create a new pull request.
2. After the collaborator joined the slack, the admin will contact her and will discuss which issue will be assigned to the contributor by the project owner, or selected by the developer (discussed with the project members).
3. Read, understand and ask questions (by comments) before start working on it.
4. Read the Development guidelines (see below).
5. Fork the repository and clone the forked repository.
6. Create a new branch (following the naming convention described in the development guidelines).
7. Follow the instructions in the README file to setup the development environment locally. If you have any doubts, contact the project maintainer.
8. Commit and push to your branch after your work is done.
9. Create a pull request and assign it to person you got in contact with.

## Development guidelines

### Branches

A branch of **develop** and another **master** will be used for each module.
For each ticket assigned, a branch must be created from develop, which will then be integrated by using a Pull Request (PR):
The branch name must follow the following format:

* Fixes: fix/<# issue_number>-<fix_name>.
* Feature: feature/<# issue_number>-<feature_name>.
* Documentation: documentation/<# issue_number>-<documentation_name>.

An example to create a new branch for a fix:

```bash
git checkout develop
git pull
git checkout -b fix/<#issue_number>-<fix_name>
```

### Commits

It is recommended to generate a commit for each change. Commits can have from one to several files, but it is recommended not to have too many related files in a single commit. This eases visibility when performing the Code Review.
Once the task is finished, commit and push this change to the issue branch in your forked repository (not develop nor master yet).

### Coding style

The best documentation is the commented code, so you should comment on what was done in the same code. A little or poorly commented code is reason for rejection for a PR.

#### Python

The use of code checking tools is recommended. For python development you can use *pylint*, *mypy*, *flake8* or *pyflakes*.
Make sure you do not have more than 80 char per line.
Every time a function of more than 5 lines is created, the following documentation template must be completed:

```python
def create_complex(real=0.0, imag=0.0):
   """This is the description of the function
   Parameters:
   real -- the real part (default 0.0)
   imag -- the imaginary part (default 0.0)
   Returns:
   comp -- a complex number
   """
   (...)
   return complex(real, imag)
```

Additionally, the following guidelines for comments in the code should be followed:

* Comments that contradict the code are worse than no comments. Always make a priority of keeping the comments up-to-date when the code changes!
* Comments should be complete sentences. The first word should be capitalized, unless it is an identifier that begins with a lowercase letter (never alter the case of identifiers!).
* Block comments generally apply to some (or all) code that follows them, and are indented to the same level as that code. Each line of a block comment starts with a # and a single space (unless it is indented text inside the comment).
* Paragraphs inside a block comment are separated by a line containing a single #.
* Your comments should be D.R.Y: “Don’t Repeat Yourself.” This means that your code should have little to no redundancy. You don’t need to comment a piece of code that sufficiently explains itself, like this one

```python
return result # returns the result
```

Guidelines for declaration of variables, functions and file generation:
Files and Classes: UpperCamelCase.py
Functions and variables: lower_case_with_underscore ()
Directories: ./lowercasenohyphens/

#### Error handling

As a general rule, the try / except block should be added to all functionality that may crash the system. After catching the exceptions, the event must be logged using the debug(), info(), warning() or error() functions according to the event that occurred.

#### Logs

In most of the modules, a central logger was defined, which should be used to log all the information centrally. This implementation should be used when logging.

## Our Standards

Examples of behavior that contributes to creating a positive environment include:

Using welcoming and inclusive language
Being respectful of differing viewpoints and experiences
Gracefully accepting constructive criticism
Focusing on what is best for the community
Showing empathy towards other community members
Examples of unacceptable behavior by participants include:

The use of sexualized language or imagery and unwelcome sexual attention or advances
Trolling, insulting/derogatory comments, and personal or political attacks
Public or private harassment
Publishing others' private information, such as a physical or electronic address, without explicit permission
Other conduct which could reasonably be considered inappropriate in a professional setting
Our Responsibilities
Project maintainers are responsible for clarifying the standards of acceptable behavior and are expected to take appropriate and fair corrective action in response to any instances of unacceptable behavior.

Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct, or to ban temporarily or permanently any contributor for other behaviors that they deem inappropriate, threatening, offensive, or harmful.

## Code of Conduct

Our Pledge
In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

## Attribution

This Code of Conduct is adapted from the Contributor Covenant, version 1.4, available at http://contributor-covenant.org/version/1/4
