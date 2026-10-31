rule compress_fastq:
    input:
        OUTDIR + "/{genotypes}/{biosamples}/{runs}/{runs}_{read}.fastq"
    output:
        OUTDIR + "/{genotypes}/{biosamples}/{runs}/{runs}_{read}.fastq.gz"
    wildcard_constraints:
        read="[123]"
    shell:
        "pigz -c {input} > {output} && pigz -t {output}"