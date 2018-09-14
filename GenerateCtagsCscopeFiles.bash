#!/usr/bin/bash
# Generate ctags and cscope database files for each directory listed in SRC_TOP_DIRS

CTAGS_EXE=/usr/bin/ctags
CSCOPE_EXE=/usr/bin/cscope
FIND_EXE=/usr/bin/find

# Relative paths to source code
SRC_TOP_DIRS=( RP_SW
               CFT_TC
               MDS_TC )

# If RP_SW, then only include these subdirectories
RP_SW_SUBDIRS=( SKR_Software_Source/Model
                SKR_Software_Source/External_Source )


START_DIR=`pwd`
echo Base directory: $START_DIR

# Process each directory, e.g. RP_SW~ai01
# Each subdirectory at this level should be a Synergy project
for PROJ_DIR in *
do
  # Iterate directories within the project
  if [ -d "$PROJ_DIR" ]; then
    for SRC_TOP_DIR in ${SRC_TOP_DIRS[@]}
    do
      SRC_DIR=$PROJ_DIR/$SRC_TOP_DIR
      if [ -d "$SRC_DIR" ]; then
        echo Processing $SRC_DIR
        cd $SRC_DIR

        echo ..ctags
        # If RP_SW project, then process the subdirectories per RP_SW_SUBDIRS
        if [[ "$SRC_DIR" =~ RP_SW$ ]]; then
          FIRST_ITER=1
          for RP_SW_SUBDIR in ${RP_SW_SUBDIRS[@]}
          do
            if [ "$FIRST_ITER" -eq 1 ]; then
              echo ....$CTAGS_EXE --recurse $RP_SW_SUBDIR
              $CTAGS_EXE --recurse $RP_SW_SUBDIR
              FIRST_ITER=0
            else
              echo ....$CTAGS_EXE --recurse --append=yes $RP_SW_SUBDIR
              $CTAGS_EXE --recurse --append=yes $RP_SW_SUBDIR
            fi
          done
        else
          echo ....$CTAGS_EXE --recurse
          $CTAGS_EXE --recurse
        fi

        echo ..cscope
        $FIND_EXE . -name '*.c' -o -name '*.cpp' -o -name '*.h' -o -name '*.java' > cscope.files
        $CSCOPE_EXE -b -i cscope.files -f cscope.out

        cd $START_DIR
      fi
    done
  fi
done

