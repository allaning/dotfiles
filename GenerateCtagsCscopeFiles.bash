#!/bin/bash
# Generate ctags and cscope database files for each directory listed in SRC_TOP_DIRS

CTAGS_EXE=/bin/ctags
CSCOPE_EXE=/bin/cscope
FIND_EXE=/bin/find

# Relative paths to source code
SRC_TOP_DIRS=( everglades
               gots
               maxlight
               platinumTools )

# If SUB_DIRS, then only include these subdirectories
ONLY_SUBDIRS=1
SUB_DIRS=( src
           pysrc
           iolib_7.0.1
           dev )

CTAGS_TAGS_FILE="/proj/aing/tags"
CSCOPE_FILES="/proj/aing/cscope.files"
CSCOPE_OUT="/proj/aing/cscope.out"

START_DIR=`pwd`
echo Base directory: $START_DIR

# Clear old cscope files
rm -f ${CSCOPE_FILES}

# Process each directory

# Ctag calls after the first should append
FIRST_CTAGS_CALL=1
APPEND_FLAG="no"

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
        for SUB_DIR in *
        do
          if [ -d "$SUB_DIR" ]; then  # If directory
            # Only process if it's in the SUB_DIRS list
            if [[ " ${SUB_DIRS[@]} " =~ " ${SUB_DIR} " ]]; then
              echo ....$CTAGS_EXE -f ${CTAGS_TAGS_FILE} --recurse --append=${APPEND_FLAG} $SUB_DIR
              $CTAGS_EXE -f ${CTAGS_TAGS_FILE} --recurse --append=${APPEND_FLAG} $SUB_DIR
              if [ $FIRST_CTAGS_CALL -eq 1 ]; then
                FIRST_CTAGS_CALL=0
                APPEND_FLAG="yes"
              fi
            fi
          fi
        done
      else
        echo ....$CTAGS_EXE -f ${CTAGS_TAGS_FILE} --recurse --append=${APPEND_FLAG}
        $CTAGS_EXE -f ${CTAGS_TAGS_FILE} --recurse --append=${APPEND_FLAG}
        if [ $FIRST_CTAGS_CALL -eq 1 ]; then
          FIRST_CTAGS_CALL=0
          APPEND_FLAG="yes"
        fi
      fi

      echo ..cscope
      $FIND_EXE `pwd` -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.py' -o -name '*.java' >> ${CSCOPE_FILES}
      $CSCOPE_EXE -b -i ${CSCOPE_FILES} -f ${CSCOPE_OUT}
    fi
  fi

  cd $START_DIR
done

