set disassembly-flavor intel
set history save on
set print pretty on
set pagination off
set confirm off

# Avoid stepping into Standard Library
skip -gfi /usr/include/c++/*/*/*
skip -gfi /usr/include/c++/*/*
skip -gfi /usr/include/c++/*
