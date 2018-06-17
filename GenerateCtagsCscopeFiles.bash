#!/usr/bin/bash
# Generate ctags and cscope database files for each RP_SW project at the Model directory level

CTAGS_EXE=/usr/bin/ctags
CSCOPE_EXE=/usr/bin/cscope
FIND_EXE=/usr/bin/find

# Project directories
PROJ_DIRS=( RP_SW MDS_TC )

# Relative paths to source code
SRC_TOP_DIRS=( RP_SW/SKR_Software_Source/Model
               RP_SW/SKR_Software_Source/External_Source
               MDS_TC/mds_tcn )


START_DIR=`pwd`
echo Base directory: $START_DIR

# Process each project directory, e.g. RP_SW~ai01
for PROJ_DIR in ${PROJ_DIRS[@]}
do
  MY_PROJ_DIRS=${PROJ_DIR}~*
  for MY_PROJ_DIR in $MY_PROJ_DIRS
  do
    if [ -d "$MY_PROJ_DIR" ]; then
      # Iterate directories within the project
      for SRC_TOP_DIR in ${SRC_TOP_DIRS[@]}
      do
        SRC_DIR=$MY_PROJ_DIR/$SRC_TOP_DIR
        if [ -d $SRC_DIR ]; then
          echo Processing $SRC_DIR
          cd $SRC_DIR

          echo ...ctags
          $CTAGS_EXE --recurse

          echo ...cscope
          $FIND_EXE . -name '*.c' -o -name '*.cpp' -o -name '*.h' > cscope.files
          $CSCOPE_EXE -b -i cscope.files -f cscope.out

          cd $START_DIR
        fi
      done
    fi
  done
done

