source ~/pyenv/stats/bin/activate
salloc --nodes=1 --ntasks=1 --tasks-per-node=32 --mem=0 --time=3:00:00 --account=def-paustin srun $VIRTUAL_ENV/bin/notebook.sh