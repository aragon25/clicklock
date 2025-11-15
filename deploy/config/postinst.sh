#!/bin/bash
function undo_changes(){
  rm -rf "/tmp/compile_clicklock" >/dev/null 2>&1
  rm -f "/usr/local/bin/clicklock" >/dev/null 2>&1
  rm -f "/usr/local/bin/xssstart" >/dev/null 2>&1
  rm -f "/usr/local/bin/xsssuspend" >/dev/null 2>&1
  rm -f "/usr/local/share/man/man1/xssstart.1" >/dev/null 2>&1
  rm -f "/usr/local/share/man/man1/xsssuspend.1" >/dev/null 2>&1
  exit 1
}
if [ -f "/usr/local/src/clicklock/clicklock.zip" ] && [ -f "/usr/local/src/clicklock/xssstart.zip" ]; then
  echo "Extract source(s) ..."
  rm -rf "/tmp/compile_clicklock" >/dev/null 2>&1
  mkdir -p "/tmp/compile_clicklock/clicklock" >/dev/null 2>&1
  mkdir -p "/tmp/compile_clicklock/xssstart" >/dev/null 2>&1
  unzip "/usr/local/src/clicklock/clicklock.zip" -d "/tmp/compile_clicklock/clicklock" >/dev/null 2>&1
  [ $? -ne 0 ] && undo_changes
  unzip "/usr/local/src/clicklock/xssstart.zip" -d "/tmp/compile_clicklock/xssstart" >/dev/null 2>&1
  [ $? -ne 0 ] && undo_changes
  echo "Compile and install from source(s) ..."
  cd "/tmp/compile_clicklock/xssstart"
  make >/dev/null 2>&1
  [ $? -ne 0 ] && undo_changes
  make install >/dev/null 2>&1
  [ $? -ne 0 ] && undo_changes
  cd "/tmp/compile_clicklock/clicklock"
  autoreconf --force --install >/dev/null 2>&1
  [ $? -ne 0 ] && undo_changes
  ./configure >/dev/null 2>&1
  [ $? -ne 0 ] && undo_changes
  make >/dev/null 2>&1
  [ $? -ne 0 ] && undo_changes
  make install >/dev/null 2>&1
  [ $? -ne 0 ] && undo_changes
  rm -rf "/tmp/compile_clicklock" >/dev/null 2>&1
else
  undo_changes
fi
exit 0