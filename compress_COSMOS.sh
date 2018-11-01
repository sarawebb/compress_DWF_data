#!/bin/bash
# Name the job, error and output files
#SBATCH --job-name=compress
 
# Specify the log output and error files (job will fail if these aren.t specified)
#SBATCH --output=compress.out
#SBATCH --error=compress.err
#SBATCH --output=compress.out
# Specify the queue name
#SBATCH --partition=skylake
 
# Node, processor, and GPU requests
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=72:00:00
# Memory request
#SBATCH --mem-per-cpu=5G
 
 
echo `date`
 
cd /fred/oz100/pipes/DWF_PIPE/MARY_WORK
for i in $( ls ); do 
	case $i in 
		(*COSMOS*) tar -czvf  /fred/oz100/pipes/DWF_PIPE/MARY_WORK_GZ/$i.gz    $i
	esac 
done 
wait

echo `date`
echo 'Job done'

