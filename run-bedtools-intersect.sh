# bash script

# The input is the standard ARTDeco output folder, containing the dogs folder to filter, and the preprocess_files folder where the all.genes.bed can be found
tissue_folder=$1

# automatically defined from the input folder
dogs_folder=${tissue_folder}/dogs/
all_genes_bed=${tissue_folder}/preprocess_files/genes_condensed.bed

# create a filtered list of dogs for each .bed file

for file in $(ls $dogs_folder/*.bed); do

	echo "creating ${file}.filtered.intersect.antisense";

	bedtools intersect -a $file -b $all_genes_bed -v -S > ${file}.filtered.intersect.antisense
done

# -v Only report those entries in A that have no overlap in B. Restricted by -f and -r.
# -S Require different strandedness. That is, only report hits in B that overlap A on the _opposite_ strand.