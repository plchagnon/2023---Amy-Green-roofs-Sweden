# General considerations

The substrate DNA was extracted at Université de Montréal during fall 2020, using the PowerSoil PowerLyzer extraction kits. The DNA extracts were amplified using 3 sets of primers:

|Target organism|Forward|Reverse|
:-----------|:-----:|:-----:|
AM fungi|WANDA (general eukaryotic)|[AML2](https://doi.org/10.1111/j.1574-6941.2008.00531.x)
General fungal (ITS2 region)|gITS7|ITS4
Prokaryotes 16S|515F|926R

<br>
These amplicons were normalized, and multiplexed in a single Illumina MiSeq PE300bp run at the CERMO facilities in UQAM. The CERMO provided us with raw fastq files that we treated using this general pipeline:

<center>

```mermaid
%%{init: {'themeVariables': { 'edgeLabelBackground': '#FFF'}}}%%
flowchart TD
raw(Raw fastq files):::bl -- Truncate <br> Remove primers <br> Quality filter --> q(Quality filtered reads):::bl
q-->m(Merged pairs):::bl
m-- Consensus chim. removal -->chim(Chimera-removed from ASVs):::bl
chim--> tax(Assign them a taxonomy using a ref database):::bl --> rar(Rarefied ASV table):::bl -->st([<b>DOWNSTREAM STATISTIC ANALYSES</b>]) 

style st fill:#000000,color:#FFFFFF

classDef bl fill:#9BBBE1,stroke:#24548B 

```
</center>

<bR><br> Below we outline our bioinformatic pipeline for each microbial group.

<br><br>

# General fungi (ITS2)
These sequences were analyzed in batch in the R package ``dada2`` using [the following script](./Script_ITS.R). Briefly, this script filters sequences through:

- Primer removal
- Quality thresholding using ``tuncQ = 2``
- Sequence trimming (upon visual inspection of median quality scores ~base position): it was decided to trim fwd reads at 250bp and rev reads at 200 bp
- Not allowing any indeterminate base pair (N)

Then follows error learning and sample inference, after which paired-reads are merged together. Chimeras are then inferred using the "consensus" method, and taxonomy assignment using UNITE [version = 9.0]. All these steps were submitted to a computer cluster (Compute Canada) via SLURM, using the following [bash script](./Rjob.sh).

*** Because this bioinformatic pipeline has been applied to a whole run of ITS sequencing, including not only the samples for this project but also other samples from another project (Coralie's project on *Lonicera maackii*), we had to run [this little code chunk](./Filtering%20Amy's%20samples%20only.R) to only keep for downstream analyses the samples belong to this project.

We thus ended up with [this particular ``.RData`` file](./Amy_ITS.RData), which contains only two objects:

- ``comm`` : A metacommunity, i.e. sites $\times$ species (fungi) matrix
- ``taxa``: A taxonomy for the fungi found in ``comm`` (i.e., columns)

<br> These objects along with site properties and vegetation data, will be the core of downstream analyses. 
<br><br>

# Prokaryotes (16S)

<br><br>

# AM fungal (18S)