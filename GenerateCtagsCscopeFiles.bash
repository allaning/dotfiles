#!/bin/bash
# Generate ctags and cscope database files for each directory listed in SRC_TOP_DIRS

CTAGS_EXE=/bin/ctags
CSCOPE_EXE=/bin/cscope
FIND_EXE=/bin/find

# Relative paths to source code
SRC_TOP_DIRS=( everglades
               maxlight
               platinumTools )

# If SUB_DIRS, then only include these subdirectories
ONLY_SUBDIRS=1
SUB_DIRS=( src
           pysrc
           dev )


START_DIR=`pwd`
echo Base directory: $START_DIR

# Process each directory
for PROJ_DIR in *
do
  # Iterate directories within the project
  if [ -d "$PROJ_DIR" ]; then
    if [[ " ${SRC_TOP_DIRS[@]} " =~ " ${PROJ_DIR} " ]]; then
      cd $PROJ_DIR
      echo Directory: $PROJ_DIR
      echo ..ctags

      # If ONLY_SUBDIRS is true, then only process the specified subdirectories per SUB_DIRS
      if [[ $ONLY_SUBDIRS -eq 1 ]]; then
        # Ctag calls after the first should append
        FIRST_CTAGS_CALL=1
        for SUB_DIR in *
        do
          if [ -d "$SUB_DIR" ]; then  # If directory
            # Only process if it's in the SUB_DIRS list
            if [[ " ${SUB_DIRS[@]} " =~ " ${SUB_DIR} " ]]; then
              if [ $FIRST_CTAGS_CALL -eq 1 ]; then
                echo ....$CTAGS_EXE --recurse $SUB_DIR
                $CTAGS_EXE --recurse $SUB_DIR
                FIRST_CTAGS_CALL=0
              else
                echo ....$CTAGS_EXE --recurse --append=yes $SUB_DIR
                $CTAGS_EXE --recurse --append=yes $SUB_DIR
              fi
            fi
          fi
        done
      else
        echo ....$CTAGS_EXE --recurse
        $CTAGS_EXE --recurse
      fi

      echo ..cscope
      $FIND_EXE . -name '*.c' -o -name '*.cpp' -o -name '*.h' -o -name '*.java' > cscope.files
      $CSCOPE_EXE -b -i cscope.files -f cscope.out
    fi
  fi

  cd $START_DIR
done

