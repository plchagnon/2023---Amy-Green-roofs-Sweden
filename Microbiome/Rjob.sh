#!/bin/bash
#SBATCH --time=5:00:00
#SBATCH --job-name="dada2 ITS Coralie"
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=20
#SBATCH --output=Coralie

module spider r/4.2.1
module load gcc/9.3.0 r/4.2.1
export R_LIBS=~/.local/R/$EBVERSIONR/

Rscript --vanilla Script_ITS.R


