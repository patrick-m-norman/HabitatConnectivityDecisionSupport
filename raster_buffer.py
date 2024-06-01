#%%
# -*- coding: utf-8 -*-
"""
Created on Wed Aug 12 08:57:24 2020

@author: pat_n
"""
import os
import pkg_resources
import whitebox
import pandas as pd
#%%
abspath = os.path.realpath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

wbt = whitebox.WhiteboxTools()
print(wbt.version())
print(wbt.help())


print(dname)

#%%

i = dname + "/Habitat_for_distance_calcs.tif"
output = dname + "/Distance_from_forest.tif"

wbt.euclidean_distance(
    i, 
    output
)

# %%