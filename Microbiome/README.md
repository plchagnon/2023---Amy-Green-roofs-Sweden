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
raw(Raw fastq files) -- Truncate <br> Remove primers <br> Quality filter --> q(Quality filtered reads)
q-->m(Merged pairs)
m-- Consensus chim. removal -->chim(Chimera-removed from ASVs)
chim-- Rarefaction 32 912 reads-->rar(Rarefied ASV table) -- remove taxa with no occurrences after rarefaction --> tax(Assign them a taxonomy using a ref database) --> st([<b>DOWNSTREAM STATISTIC ANALYSES</b>]) 
```
</center>

