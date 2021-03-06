#!/usr/bin/env bash

# NOTE: call from the curriculum folder you want to process, will overrite
# previous theory seed file

# step 1: create the seed files

# first part creates (and outputs through pipe) a list of all the files in
# curriculum's directory, subdirectories, and those subdirectories' directories

# second part has perl print a list of all the files that have "theory"
# in them and that gets piped as output into python's stdin

# these are the theory files controlled by the local graphs
ls $files/**/**/*.html | perl -nle 'print if /(?<=theory).*\.html/' | python $loader/process_theory.py $pythonFillerPathLength

# these are the theory files controlled by the globalgraph
ls $files/**/*.html | perl -nle 'print if /(?<=theory).*\.html/' | python $loader/process_theory.py $pythonFillerPathLength

# step 2: grab all the _seed files and concatenate them into a large seed file
rm $seeds/theory_seed.rb
find $files -name '*.html_theory_seed' -exec cat {} >> $seeds/theory_seed.rb \;
# also add to gigantic seed file
find $files -name '*.html_theory_seed' -exec cat {} >> $seeds/all.rb \;
