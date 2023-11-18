cd "$(dirname "$(readlink -f "$0")")"
sh do down &
sh do up
