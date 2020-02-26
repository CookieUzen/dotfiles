#!/bin/bash
TMPDIR="$HOME/anywhere"
TMPFILE="$TMPDIR/file$(ls $TMPDIR | wc -l)"

echo $TMPFILE
st sh -c "xsel | nvim '$TMPFILE'"
cat $TMPFILE | xsel --clipboard --input
