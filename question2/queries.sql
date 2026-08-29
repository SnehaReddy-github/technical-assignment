-- ============================================================
-- Question 2A
-- Determine how many types of Acacia plants are present
-- in the taxonomy table.
-- ============================================================

SELECT COUNT(*) AS acacia_count
FROM taxonomy
WHERE species LIKE 'Acacia%';

-- ============================================================
-- Question 2B
-- Determine which type of wheat has the longest DNA sequence.
-- ============================================================

SELECT
t.species,
MAX(r.length) AS longest_dna_length
FROM taxonomy AS t
JOIN rfamseq AS r
ON t.ncbi_id = r.ncbi_id
WHERE t.ncbi_id IN (4565, 4567)
AND r.mol_type IN ('DNA', 'genomic DNA')
GROUP BY t.species
ORDER BY longest_dna_length DESC
LIMIT 1;

-- ============================================================
-- Question 2C
-- Return family name, family accession and maximum DNA
-- sequence length for families above 1,000,000.
--
-- Sorted by maximum DNA sequence length descending.
-- 15 results per page.
-- Page 9 = OFFSET 120, LIMIT 15.
-- ============================================================

SELECT
f.rfam_id AS family_name,
f.rfam_acc AS family_accession,
MAX(r.length) AS maximum_dna_sequence_length
FROM family AS f
JOIN full_region AS fr
ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq AS r
ON fr.rfamseq_acc = r.rfamseq_acc
WHERE r.mol_type IN (
    'DNA',
    'genomic DNA',
    'ss-DNA',
    'other DNA',
    'unassigned DNA'
    )
GROUP BY
f.rfam_id,
f.rfam_acc
HAVING MAX(r.length) > 1000000
ORDER BY
maximum_dna_sequence_length DESC,
family_accession ASC
LIMIT 15 OFFSET 120;
