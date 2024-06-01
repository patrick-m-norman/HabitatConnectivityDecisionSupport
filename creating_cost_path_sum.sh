eval "$(conda shell.bash hook)"
conda activate otb_env

#The following script creates a summed spatial raster of the outputs created during the least cost paths.
otbcli_BandMathX -il \
    cost_pathway.tif.tif    \
    cost_pathway.tif.~10~.tif   \
    cost_pathway.tif.~11~.tif   \
    cost_pathway.tif.~12~.tif   \
    cost_pathway.tif.~13~.tif   \
    cost_pathway.tif.~14~.tif   \
    cost_pathway.tif.~15~.tif   \
    cost_pathway.tif.~16~.tif   \
    cost_pathway.tif.~17~.tif   \
    cost_pathway.tif.~18~.tif   \
    cost_pathway.tif.~19~.tif   \
    cost_pathway.tif.~1~.tif    \
    cost_pathway.tif.~20~.tif   \
    cost_pathway.tif.~21~.tif   \
    cost_pathway.tif.~22~.tif   \
    cost_pathway.tif.~23~.tif   \
    cost_pathway.tif.~24~.tif   \
    cost_pathway.tif.~25~.tif   \
    cost_pathway.tif.~26~.tif   \
    cost_pathway.tif.~27~.tif   \
    cost_pathway.tif.~28~.tif   \
    cost_pathway.tif.~29~.tif   \
    cost_pathway.tif.~2~.tif    \
    cost_pathway.tif.~3~.tif    \
    cost_pathway.tif.~4~.tif    \
    cost_pathway.tif.~5~.tif    \
    cost_pathway.tif.~6~.tif    \
    cost_pathway.tif.~7~.tif    \
    cost_pathway.tif.~8~.tif    \
    cost_pathway.tif.~9~.tif    \
    cost_pathway_reverse.tif.tif    \
    cost_pathway_reverse.tif.~10~.tif   \
    cost_pathway_reverse.tif.~11~.tif   \
    cost_pathway_reverse.tif.~12~.tif   \
    cost_pathway_reverse.tif.~13~.tif   \
    cost_pathway_reverse.tif.~14~.tif   \
    cost_pathway_reverse.tif.~15~.tif   \
    cost_pathway_reverse.tif.~16~.tif   \
    cost_pathway_reverse.tif.~17~.tif   \
    cost_pathway_reverse.tif.~18~.tif   \
    cost_pathway_reverse.tif.~19~.tif   \
    cost_pathway_reverse.tif.~1~.tif    \
    cost_pathway_reverse.tif.~20~.tif   \
    cost_pathway_reverse.tif.~21~.tif   \
    cost_pathway_reverse.tif.~22~.tif   \
    cost_pathway_reverse.tif.~23~.tif   \
    cost_pathway_reverse.tif.~24~.tif   \
    cost_pathway_reverse.tif.~25~.tif   \
    cost_pathway_reverse.tif.~26~.tif   \
    cost_pathway_reverse.tif.~27~.tif   \
    cost_pathway_reverse.tif.~28~.tif   \
    cost_pathway_reverse.tif.~29~.tif   \
    cost_pathway_reverse.tif.~2~.tif    \
    cost_pathway_reverse.tif.~3~.tif    \
    cost_pathway_reverse.tif.~4~.tif    \
    cost_pathway_reverse.tif.~5~.tif    \
    cost_pathway_reverse.tif.~6~.tif    \
    cost_pathway_reverse.tif.~7~.tif    \
    cost_pathway_reverse.tif.~8~.tif    \
    cost_pathway_reverse.tif.~9~.tif    \
                -exp "sum(im1b1, im2b1, im3b1, im4b1, im5b1, im6b1, im7b1, im8b1, im9b1, im10b1, im11b1, im12b1, im13b1, im14b1, im15b1, im16b1, im17b1, im18b1, im19b1, im20b1, \
                im21b1, im22b1, im23b1, im24b1, im25b1, im26b1, im27b1, im28b1, im29b1, im30b1, im31b1, im32b1, im33b1, im34b1, im35b1, im36b1, im37b1, im38b1, im39b1, im40b1, \
                im41b1, im42b1, im43b1, im44b1, im45b1, im46b1, im47b1, im48b1, im49b1, im50b1, im51b1, im52b1, im53b1, im54b1, im55b1, im56b1, im57b1, im58b1, im59b1, im60b1)" \
                -ram 20000 \
                -out Combined_paths.tif

#gdal_edit.py -unsetnodata Combined_paths.tif

