# 2023: Amy-Green-roofs-Sweden

This project aims at characterizing substrate microbiome in a green roof chronosequence in Malmö, Sweden. This study has the advantage of truly isolating the **time** factor as the roofs were all installed using the same starting materials, and maintained in a similar way. Thus, it'll be a way to test for temporal trends in green roof microbiomes, and how it's related to susbtrate properties and established vegetation.

<br>

# Files hierarchy

I would expect a file hierarchy like

```bash


|
|---Roof properties (age, location, substrate physico-chem)
|   |
|   |--- Protocol X
|   |--- Protocol Y
|   |--- Protocol Z
|   |--- Soil properties.txt ## actual data
|
|---Microbiome 
|   |
|   |--- Link to deposited sequences (Sequence Read Archives)
|   |--- R script workflow from .fastq files to community table
|
|---Vegetation
|   |
|   |--- Cover.txt ## pct cover of plants (cols) in all sites (rows)
|   |--- traits.txt ## data matrix of traits (rows) x species (cols)
|
|---Statistical workflow
|   |
|   |--- R Scripts
|   |--- Figures
```

