# Rule for downloading SRA files using prefetch. This rule will download the SRA file for each run and save it in the appropriate directory.
rule prefetch:
    output:
        temp(OUTDIR + "/{genotypes}/{biosamples}/{runs}/{runs}.sra")
    params:
        dir=OUTDIR + "/{genotypes}/{biosamples}"
    resources:
        ncbi_connections=1
    conda:
        "../envs/sra-tools.yaml"
    shell:
        "prefetch {wildcards.runs} -O {params.dir}"