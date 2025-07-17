#https://www.ncbi.nlm.nih.gov/datasets/docs/v2/tutorials/download-ortholog-dataset/

# Link to all ortologs
https://ftp.ncbi.nlm.nih.gov/gene/DATA/

#Link for taxonomy IDS
https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Tree&id=40674&lvl=3&lin=f&keep=1&srchmode=1&unlock

# Manual
https://www.ncbi.nlm.nih.gov/datasets/docs/v2/how-tos/genes/get-gene-metadata/

To get genes
./datasets download gene symbol brca1 38601 --filename test.zip

To get ortologs
./datasets download gene symbol brca1 taxon primates --filename brca1_primates.zip

#Using NCBI gene IDs
#Retrieve gene metadata by providing one or more gene IDs (space delimited). If using the --inputfile option instead, each gene ID should be on a separate line.
./datasets download gene gene-id 1 2 3 9 10 11 12 13 14 15 16 --filename test.zip

#Using Gene IDs
#Download the Angiotensin Converting Enzyme 2 (ACE2) ortholog set for mammals.
datasets download gene gene-id 59272 --ortholog mammals

# Summary of genes for a taxa
./datasets summary gene taxon "Canis lupus" --as-json-lines | ./dataformat tsv gene --fields tax-name,symbol,taxa-id

# Get all ortologs
./datasets download gene symbol cftr --ortholog all

./datasets download gene symbol brca1 --ortholog mammals --filename brca1_primates.zip
