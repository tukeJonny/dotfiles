#-*- coding: utf-8 -*-
"""
My dotfiles installer written in python
"""
import os
import argparse
import logging
import shutil
from pathlib import Path

try:
    from tqdm import tqdm
except:
    print("""
    This script requires tqdm python module.
    Please execute below command
    $ pip install tqdm
    Exiting ...""")
    os.exit(1)

logger = logging.getLogger(__name__)

HOME = os.getenv('HOME')
NON_DOTFILES = [
    'install.py',
    '.git',
    '.gitignore',
    'README.md',
]
DOTFILES = set(Path('.').glob('*')) - set(NON_DOTFILES)

def is_installed():
    """
    Return whether dotfiles had already been installed.
    """
    files = set(Path(HOME).glob('*'))
    if files >= DOTFILES:
        logger.warn('[!] dotfiles had already been installed')
        return True
    return False

def backup_old_dotfiles():
    logger.info('[*] Backuping old dotfiles ...')
    for dotfile in tqdm(DOTFILES):
        old_dotfile = Path(HOME) / dotfile
        if os.path.exist(old_dotfile) and os.path.isfile(old_dotfile):
            shutil.copy2(old_dotfile, \
                            Path(HOME) / '{}.orig'.format(dotfile))

def salvage_old_dotfiles():
    logger.info('[*] Salvaging old dotfiles ...')
    for dotfile in tqdm(DOTFILES):
        new_dotfile = Path(HOME) / dotfile
        if os.path.exist(new_dotfile) and os.path.isfile(new_dotfile):
            shutil.move('{}.orig'.format(new_dotfile), new_dotfile)

def create_symlink(abspath, filename):
    """
    Create Symblic links from dotfiles/.* to $HOME/.*
    """
    dest = Path(HOME) / filename
    os.symlink(abspath, dest)
    logger.info('[+] Created symlink {} -> {}'.format(dest, abspath))

def traverse_dotfiles():
    """
    Traverse dotfiles
    """
    if is_installed:
        return # Do nothing
    
    backup_old_dotfiles()

    logger.info('[*] Traversing ...')
    for f in tqdm(Path('.').glob('*')):
        if f in NON_DOTFILES:
            continue

        create_symlink(f, f.resolve())

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-s', '--salvage', action='store_true', help='Salvage old dotfile')
    args = parser.parse_args()
    return args

def install():
    logger.info('[+] Start install dotfiles!')
    traverse_dotfiles()

def uninstall():
    logger.info('[+] Start salvage old dotfiles')
    salvage_old_dotfiles()

def main():
    args = get_args()
    if args.salvage:
        uninstall()
    else:
        install()

if __name__ == '__main__':
    main()
