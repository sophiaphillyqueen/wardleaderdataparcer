
if [ -f "source/${1}.c" ]; then
  echo WE FOUND IT
  gcc -c "source/${1}.c" -o "targets/${1}.o"
fi

