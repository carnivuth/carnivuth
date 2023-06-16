#!/bin/bash
git switch master
git merge develop
git push
ng deploy --base-href='https://carnivuth.github.io/carnivuth/'
git switch develop