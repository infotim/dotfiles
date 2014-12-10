# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

for i in ~/.bash/*; do
    source "$i"
done
