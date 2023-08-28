#!/usr/bin/env bash

#
# A convenience script for checking out all git repos within the
# Satchel notebook project.  Used when setting up a new Linux
# development instance.
#

[ ! -d satchel ] && mkdir -p satchel
[ ! -d oss ] && mkdir -p oss
[ ! -d forks ] && mkdir -p forks

function githubRepo {
    [ ! -d $1 ] && git clone git@github.com:jmquigley/$1.git
}

pushd satchel
[ ! -d devops ] && git clone git@buildhaus.local:thirteensystems/devops.git
[ ! -d app ] && git clone git@buildhaus.local:thirteensystems/app.git
[ ! -d www ] && git clone git@buildhaus.local:thirteensystems/www.git
githubRepo notesdb
githubRepo gadgets
popd

pushd oss
githubRepo util.pkgwrap
githubRepo util.rstrip
githubRepo util.constants
githubRepo util.string
githubRepo util.toolbox
githubRepo util.home
githubRepo util.join
githubRepo util.leader
githubRepo util.chdir
githubRepo util.env
githubRepo util.filelist
githubRepo util.timestamp
githubRepo util.wait
githubRepo util.fixture
githubRepo util.ds
githubRepo util.promise
githubRepo util.log
githubRepo util.scaffold
githubRepo util.keymaster
githubRepo util.merge-packages
githubRepo util.classnames
githubRepo util.toggle
githubRepo util.calc
githubRepo util.keys
githubRepo util.fontlist
githubRepo util.section
githubRepo util.matches
githubRepo quill-markup
githubRepo meshwork
githubRepo module.template
githubRepo js-output-loader
githubRepo emacs
popd

pushd forks
githubRepo react-select
githubRepo react-modal
githubRepo Re-Flex
popd
