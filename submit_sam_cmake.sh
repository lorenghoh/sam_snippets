#!/bin/bash
# ---------------------------------------------------------------------
# SLURM script for a multi-step job on a Compute Canada cluster. 
# ---------------------------------------------------------------------
#SBATCH --account=def-paustin
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=32
#SBATCH --time=3-00:00:00
#SBATCH --mem=0M
# ---------------------------------------------------------------------
echo "Current working directory: `pwd`"
echo "Starting run at: `date`"
# ---------------------------------------------------------------------
echo ""
echo "Job Array ID / Job ID: $SLURM_ARRAY_JOB_ID / $SLURM_JOB_ID"
echo "This is job $SLURM_ARRAY_TASK_ID out of $SLURM_ARRAY_TASK_COUNT jobs."
echo ""
# ---------------------------------------------------------------------
export CC=icc
export CXX=icpc
export FC=mpifort

# Run your simulation step here...
srun /scratch/gunho/BOMEX_BOWL/SAM_CMAKE
