"""
This script is used to initialize a development environment project that will
use a .devcontainer configuration setup for docker.  The purpose is to spin
up disposable environments for development.

Examples:

    Create a python development environment using the base container in the
    current directory and destroy the current .devcontainer directory if it
    exists:

        dfconfig.py -r -n base -l py

    Create a c++ development environment using the base container:

        dfconfig.py -n base -l cpp

    Create an ignition development environment with python cli:

        dfconfig.py -n ignition -l py

"""
import argparse
import logging
import os
from os.path import abspath, dirname, exists, join, realpath
import shutil
import sys


logformat = '%(asctime)s [%(levelname)7s]: %(message)s'
logging.basicConfig(level=logging.DEBUG, stream=sys.stdout, format=logformat)
log = logging.getLogger(__name__)


class App(object):

    def __init__(self, args):
        self._args = args
        self._dotfileHome = abspath(join(dirname(realpath(__file__)), ".."))
        self._outputHome = abspath(self._args.directory)
        self._configHome = join(self._dotfileHome, "conf")
        self._containersHome = join(self._configHome, "containers")
        self._bootstrapHome = join(self._configHome, "bootstrap")

    def main(self):
        log.debug("main()")
        self._showEnvironment()
        self._initializeContainer(self._args.name)
        self._initializeBootstrap(self._args.lang)

    def _initializeContainer(self, name):
        """Initializes the selected container in the output directory.  It
        makes a copy of the selected container into the output directory.
        This devcontianer can be used in vscode to spin up a development
        environment.

        Parameters:
            - name (str): The name of the container to initialize

        Returns:
            - None
        """
        log.debug(f"_initializeContainer({name})")
        src = join(self._containersHome, name)
        dst = join(self._outputHome, ".devcontainer")

        if self._args.reinit and exists(dst):
            # Remove the existing .devcontainer directory
            shutil.rmtree(dst, ignore_errors=True)

        if not exists(dst):
            os.makedirs(dst)

        # Copy the selected container into the output .devcontainer directory
        shutil.copytree(src, dst, dirs_exist_ok=True)

    def _initializeBootstrap(self, lang):
        """Initializes the selected development startup files in the output
        directory.  It makes a copy of the files in the destination. This is
        just the initial set of files.  It will not overwrite the existing
        files unless the --reinit flag is set.

        Parameters:
            - lang (str): The language of the container

        Returns:
            - None
        """
        log.debug(f"_initializeBootstrap({lang})")
        src = join(self._bootstrapHome, lang)
        dst = join(self._outputHome)

        # Copy the selected development startup files into the output directory
        # This will overwrite the existing files if they exist
        shutil.copytree(src, dst, dirs_exist_ok=True)

    def _showEnvironment(self):
        """Dumps the current global variables used to the log"""
        log.debug("_showEnvironment()")

        log.info(f"Directory: {self._args.directory}")
        log.info(f"Reinit: {self._args.reinit}")
        log.info(f"Name: {self._args.name}")
        log.info(f"Language: {self._args.lang}")
        log.info(f"Dotfile Home: {self._dotfileHome}")
        log.info(f"Output Home: {self._outputHome}")
        log.info(f"Config Home: {self._configHome}")
        log.info(f"Containers Home: {self._containersHome}")
        log.info(f"Bootstrap Home: {self._bootstrapHome}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--directory", "-d",
        required=False,
        default="./",
        help="The project directory where the scripts or configuration will be saved"
    )

    parser.add_argument(
        "--reinit", "-r",
        required=False,
        action='store_true',
        help="If set then the existing .devcontainer directory will be removed"
    )

    parser.add_argument(
        "--name", "-n",
        required=False,
        choices=['base', 'dev', 'ignition', 'www'],
        default='base',
        help="The name of the container to copy into the project"
    )

    parser.add_argument(
        "--lang", "-l",
        required=False,
        choices=['py', 'java', 'js', 'cpp', "csharp"],
        default='py',
        help="The language configuration files used with the project"
    )

    if len(sys.argv) <= 1:
        parser.print_help(sys.stderr)
        sys.exit(0)

    cliargs = parser.parse_args()

    log.info("Initializing dotfiles Container")
    App(cliargs).main()
    log.info("Done.")
