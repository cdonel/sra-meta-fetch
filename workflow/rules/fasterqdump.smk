# Rule for converting SRA files to FASTQ format using fasterq-dump. 
# This rule will convert the SRA file for each run into three FASTQ files (one for each read) and save them in the appropriate directory.
rule fasterqdump:
    input:
        OUTDIR + "/{genotypes}/{biosamples}/{runs}/{runs}.sra"
    output:
        OUTDIR + "/{genotypes}/{biosamples}/{runs}/{runs}_1.fastq",
        OUTDIR + "/{genotypes}/{biosamples}/{runs}/{runs}_2.fastq",
        OUTDIR + "/{genotypes}/{biosamples}/{runs}/{runs}_3.fastq"
    params:
        outdir=OUTDIR + "/{genotypes}/{biosamples}/{runs}"
    conda:
        "../envs/sra-tools.yaml"
    shell:
        "fasterq-dump --split-files --include-technical {input} -O {params.outdir}"
